# NavDP：供语言导航调用的局部轨迹策略

**论文**：NavDP: Learning Sim-to-Real Navigation Diffusion Policy with Privileged Information Guidance。首次提交 **2025-05-13**，已查 v3 为 2025-12-24；官方仓库标注 **ICRA 2026**。优先级 **P1**。核查日期：2026-09-29。

## 先读总结

NavDP 研究视觉局部导航：根据观察和目标生成可走轨迹，再用学习到的评分器挑选轨迹。它包含 G1 人形实机，但原始任务是 PointGoal 和无目标探索，**没有独立完成自然语言路线理解**。纳入本调研，是因为它解释了语言导航双系统中的执行层，而不是因为所有人形导航都属于 VLN。[摘要](https://arxiv.org/abs/2505.08712)

## 问题、输入与输出

策略输入是历史 RGB、当前 depth 与机器人相对坐标中的目标；无目标探索使用空目标条件。输出是由多个 waypoint 组成的局部轨迹，供底层控制器跟踪，不是全身关节命令。RGB 帮助理解可见结构，depth 为距离提供尺度。[HTML §IV](https://arxiv.org/html/2505.08712v3)

## 方法如何工作

扩散模型不是一次只提出一条路径，而是能够生成候选轨迹；共享 Transformer 的 critic 分支评估候选安全性，帮助选择。训练时利用模拟器中的完整环境信息生成示范和碰撞负例；部署时策略只消费局部可观测输入。这里的 privileged information 是训练监督来源，不能被偷偷用于测试时规划。[作者项目页](https://wzcai99.github.io/navigation-diffusion-policy.github.io/)

**理解方式（本调研分析）**：即使上层选对了门口，当前路径也可能被行人挡住。局部策略解决“此刻怎样向子目标靠近”，语言模型解决“下一个该去哪个地方”。这种划分使不同频率的模块可以协作，也使错误可以拆开测量；然而局部避障不能自动修正选错房间的语义错误。

## 实验与人形证据

论文的评测涉及模拟场景以及 Turtlebot4、Go2、G1 等实机平台，给出 PointGoal、无目标探索和轨迹可视化。G1 的出现说明视觉轨迹策略具有跨身体迁移证据；不代表同一神经网络直接输出所有机器人关节控制。作者还做输入模态、critic 选择与训练负例的消融。[HTML 实验部分](https://arxiv.org/html/2505.08712v3)

比较结果时必须分开“有目标到达成功率”和“无目标探索时长／面积”。探索更久并不证明遵循了某条语言指令。也不要把本论文的单层 PointGoal 数字与完整 VLN 的 SR 放在同一排行榜。

## 与 InternVLA-N1 的关系

官方 [InternNav README](https://github.com/InternRobotics/InternNav) 区分单独 NavDP、与 System 2 联调的 NavDP* 和另一配置 DualVLN。原 NavDP 使用 RGB-D；DualVLN 的快速系统有自身实现和条件表示。复现时应从确切模型配置出发，不能把这些名字视为同一 checkpoint。

## 局限与初学者阅读要点

**本调研分析**：局部 RGB-D 观察不一定足以判断全身通过狭门的可行性；学到的 critic 也不是形式化安全保证。后续可固定上层语言目标，观察目标误差、depth 缺失、延迟及身体占用大小怎样影响轨迹成功率。先复现标准配置，再考虑这些变化。还需分别保存候选轨迹与最终执行轨迹，才能判断失败发生在生成、选择还是运动跟踪阶段。

阅读顺序：先弄懂 PointNav 与 VLN 区别，再看“生成—评分—选择”图，最后理解扩散噪声预测。代码入口为 [InternRobotics/NavDP](https://github.com/InternRobotics/NavDP)。本次只查 README 和论文，不运行其环境安装、数据下载或训练命令。

**证据深度**：已查摘要、HTML 方法与实机段落、项目页、官方仓库和 InternNav 关系说明；未代码审计、未复现。

---

[返回文献总索引](../../README.md) · [方法对比](../../03_method_comparison.md)
