# H03 · Humanoid-Gym：看懂完整的人形行走 RL 工程

- **论文**：Humanoid-Gym: Reinforcement Learning for Humanoid Robot with Zero-Shot Sim2Real Transfer，Xinyang Gu、Yen-Jen Wang、Jianyu Chen。
- **时间 / 平台**：2024-04-08 首发；方法核验使用 2024-05-18 的 v2；RobotEra XBot-S 与 XBot-L。
- **类别 / 优先级**：PPO 行走基线、sim-to-sim、sim-to-real；P0，适合从实现入门。
- **证据深度**：A；论文 HTML 与官方仓库已核验；未安装、未训练、未下载论文。访问日期：2026-09-29。

## 一分钟总结

最值得初学者学习的是完整工程链：观测怎样拼接、奖励怎样组成、PPO 怎样训练、模型怎样导出，以及为何上实机前还要换一个模拟器检验。它将成熟腿足 RL 做法整理成人形行走框架，展示两种尺寸机器人的迁移。[论文摘要](https://arxiv.org/abs/2404.05695)

## 详细介绍：问题与方法

RL 在一个模拟器里走得稳，可能利用了特有的接触或执行器误差。作者在 Isaac Gym 训练，随后到经校准的 MuJoCo 检查，再部署实机。这能暴露部分模拟器依赖，却不能证明真实环境全部可靠。框架也把部署 actor 可获得的输入，与训练 critic 看到的特权信息分开；读懂这个分工比先背 PPO 公式更有价值。[方法和实验](https://arxiv.org/html/2404.05695v2)

| 项目 | 已核验的设计 |
|---|---|
| Observation | 步态时钟、速度命令、12 维关节位置与速度、角速度、欧拉角、上一动作，并堆叠历史 |
| Privileged state | 训练时额外使用质量、摩擦、根部线速度、接触等信息 |
| Action | 关节目标经 PD 执行；论文策略 100 Hz、PD 1000 Hz |
| Reward | 速度跟踪、步态/接触模式、稳定及平滑正则 |
| Training | PPO、非对称 actor–critic、动力学随机化；正弦参考和周期接触掩码引导步态 |

它不是完全无先验地“自己悟出走路”，也不是端到端视觉控制。人工步态结构和奖励塑形是工程方案的一部分。[§III 与表 I](https://arxiv.org/html/2404.05695v2#S3)

## 证据与局限

官方仓库提供训练、play、模型导出及 MuJoCo sim2sim 路径，说明实现基于 legged_gym/rsl_rl，并列出默认 PPO 任务。仓库提到的其他方向或“Coming Soon”条目，不能当作本文已验证能力。[官方实现](https://github.com/roboterax/humanoid-gym)

实机验证对象是 XBot-S、XBot-L；迁移到 G1/H1 需要重新核对关节映射、执行器、增益、观测尺度和随机化。zero-shot 表示训练出的策略无需在目标实机上继续学习，不表示机器人模型不用校准，也不保证任意硬件直接运行。[摘要与校准](https://arxiv.org/abs/2404.05695)

## 与传统感知的关系

研究建议：用它学习传感器数据如何进入闭环。先固定原策略，对它实际使用的 IMU/关节观测注入偏置、噪声和延迟，画感知退化与跌倒的曲线。原 actor 不读取机体线速度；若增加速度估计、高度图或接触估计，应修改输入并重新训练，再把新增输入从仿真真值换成可部署传感器输出。这能区分观测误差、策略鲁棒性和仿真模型三个瓶颈。

## 阅读 / 复现重点

按 observation → action → reward → termination → randomization 顺序读。官方结构说明给出了 reward scale 与同名奖励函数的联系，适合画“公式—函数—配置”对照。初次实验只验证平地速度跟踪，保留原始配置和失败录像，再检查跨模拟器差异。此次仅完成阅读计划，没有运行结果。[代码结构](https://github.com/roboterax/humanoid-gym#code-structure)

特别适合做的入门练习是手动检查每个 observation 的单位、坐标系、归一化系数和更新频率，并把仿真重置后的第一帧与真实上电状态对照。很多部署错误来自接口不一致，未必来自 PPO 没有收敛；这是传统机器人经验可以直接发挥作用的地方。

**原始入口**：[HTML](https://arxiv.org/html/2404.05695v2)；[项目入口](https://sites.google.com/view/humanoid-gym/)（由论文与仓库交叉确认）。
