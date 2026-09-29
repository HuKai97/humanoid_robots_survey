# H07 · BeyondMimic：把动作跟踪变成可组合的控制能力

- **论文**：BeyondMimic: From Motion Tracking to Versatile Humanoid Control via Guided Diffusion，Takara E. Truong、Qiayuan Liao、Xiaoyu Huang、Guy Tevet、C. Karen Liu、Koushil Sreenath。项目页共同一作展示顺序与 arXiv 不同，引用以所用版本为准。
- **时间 / 平台**：2025-08-11 首发；Unitree G1；本卡不补填未经核验的会议归属。
- **类别 / 优先级**：RL 运动跟踪、状态—动作扩散、测试时引导；P1，当前全身跟踪实现重点。
- **证据深度**：A；v1 HTML、官方项目与训练仓库已核验；未运行。访问日期：2026-09-29。

## 一分钟总结

BeyondMimic 有两部分：先把各种人体参考动作变成可靠的机器人跟踪技能，再把技能轨迹融入扩散模型，用测试时目标代价引导合成动作。第一部分主要靠 RL，第二部分包含监督式扩散学习与推理引导。只复现公开的 tracking 仓库，不能说已经复现全文所有能力。[官方项目](https://beyondmimic.github.io/)

## 详细介绍：问题与方法

一个漂亮的跟踪视频不等于能任意转向、到达目标或绕过障碍。论文让跟踪管线提供高质量状态—动作轨迹，再让生成模型组合动作。跟踪设计关注真实硬件可执行性；同一组方法参数用于不同动作，减少逐动作调 reward 的工作。[论文](https://arxiv.org/html/2508.08241v1)

| 项目 | 已核验的设计 |
|---|---|
| Observation | 参考关节位置/速度提供相位信息，锚点位姿误差、本体状态与上一动作；无可靠定位时可移除部分线性状态 |
| Action | 归一化关节目标，经适度阻抗转换为控制；不是简单重放参考关节角 |
| Reward | 刚体位置、方向和速度的任务空间跟踪，加少量限位、平滑、自接触惩罚 |
| Training | 非对称 actor–critic、按失败分布自适应采样起始相位、随机化 |
| 组合控制 | 状态—动作扩散预测未来轨迹，测试时用任务代价的梯度引导采样 |

因此参考关节信息作为输入，不意味着奖励一定逐关节追踪。读实现时应把参考表示、优化目标与输出动作分别看清。[§III–IV](https://arxiv.org/html/2508.08241v1)

## 证据与局限

项目展示旋转跳跃、冲刺、侧手翻以及航点、手柄、避障等能力；项目页明确说，导航与避障演示使用动捕确定航点、障碍位置并辅助状态估计。它不能直接记作视觉避障或未知场景自主导航。[项目的动捕说明](https://beyondmimic.github.io/)

官方 `whole_body_tracking` 仓库明确只覆盖运动跟踪训练，部署另指向 `motion_tracking_controller`；README 列出命令、奖励、随机化、观测、终止条件和 PPO 配置的位置。这使它适合研究 MDP 设计，但扩散组合部分的完整复现仍需单独检查材料。[官方训练仓库](https://github.com/HybridRobotics/whole_body_tracking)

## 与传统感知的关系

研究建议：以固定的动作跟踪器和任务代价为基础，用 VIO/LIO 与局部距离场替换动捕提供的全局信息。研究地图延迟、障碍漏检、漂移对引导采样的影响；进一步用不确定性膨胀障碍边界或调整代价权重。这是可检验方向，尚不是已确认的新颖贡献。

应同时报告障碍感知精度、最小间距、碰撞率、任务完成率和控制延迟。只降低 MPJPE 无法证明避障更好；只成功绕过一个静态障碍也无法证明覆盖动态环境。

## 阅读 / 复现重点

先做一个 tracking 基线，重点读 action scale、阻抗、锚点坐标、失败采样。再理解扩散阶段的数据来自哪里、测试代价怎样作用于生成轨迹。官方 README 提供 LAFAN1 数据接入流程；动作源和测试划分要独立记录，防止训练/测试只换相邻片段。本轮未下载数据与模型。

**原始入口**：[arXiv](https://arxiv.org/abs/2508.08241)；[HTML](https://arxiv.org/html/2508.08241v1)；[项目](https://beyondmimic.github.io/)；[代码](https://github.com/HybridRobotics/whole_body_tracking)。
