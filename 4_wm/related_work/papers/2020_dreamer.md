# Dreamer：在想象轨迹中学习策略

## 元数据与阅读范围

- *Dream to Control: Learning Behaviors by Latent Imagination*。
- Danijar Hafner、Timothy Lillicrap、Jimmy Ba、Mohammad Norouzi；2019 预印本，ICLR 2020。
- 类型：潜空间世界模型 + imagination actor–critic；仿真视觉控制。
- 已读：摘要、作者项目和官方方法介绍；未核验所有附录公式。检索：2026-09-29。
- 来源：[论文](https://arxiv.org/abs/1912.01603)、[作者项目](https://danijar.com/project/dreamer/)、[方法介绍](https://research.google/blog/introducing-dreamer-scalable-reinforcement-learning-using-world-models/)、[代码](https://github.com/danijar/dreamer)。

## 30 秒总结

PlaNet 主要在执行时规划，Dreamer 进一步在世界模型产生的潜空间轨迹中训练策略和价值函数。因此世界模型可以主要用于训练：部署时不一定每个控制周期都做大规模候选搜索。

## 详细介绍

世界模型利用真实交互中的图像、动作和奖励训练。随后，从已编码的状态开始，在模型内模拟策略动作及未来状态，训练 actor 选择动作、critic 估计长期收益。Dreamer V1 的重要机制是让想象轨迹中的价值梯度经过动力学传播到行为学习。[作者介绍](https://research.google/blog/introducing-dreamer-scalable-reinforcement-learning-using-world-models/)

把整个循环分成三部分容易理解：收集真实经验，拟合预测模型，利用想象经验优化行为。三者交替进行，所以它不是拿互联网视频训练一个模型就自动学会任意机器人任务。奖励信号、动作接口和交互覆盖仍然关键。

教学上，真实 replay 可以理解为“有证据的经历”，imagination 是“依赖模型假设的预测”。同样数量的想象步骤通常比真实机器人交互便宜，但它们不是额外的独立事实。如果模型在接触区域存在偏差，训练得更久可能强化错误策略。

## 实验支持与适用范围

论文主要展示多个视觉控制基准上的样本效率、计算与任务回报优势。原论文实验不是高自由度真实人形部署，不宜把“控制任务”泛化为“已解决双足走路”。[论文摘要与项目](https://danijar.com/project/dreamer/)

## 与感知的交叉：分析推断

你的感知模块可以用在状态初始化、观测编码、多模态融合，或给训练提供几何辅助监督。真正需要回答的是：这些信号是否改善策略用到的未来预测？例如，增加深度预测损失可能改善空间结构，也可能让网络花更多容量重建无关背景，必须做控制回报与预测误差的联合评测。

人形尤其需要把外感知和本体感知分开检查。视觉能看见台阶，但关节编码器、IMU 和接触信号更直接描述身体状态。若两类信息时间戳错位，潜状态可能看似平滑却落后实际身体运动。

## 学习与复现建议

优先级 P0：先读 PlaNet，再读本卡，最后读 DreamerV3。理解 actor、critic、价值自举、想象轨迹和 replay buffer 即可开始读代码。第一次实验建议只运行一个小任务，检查 actor 在真实环境的回报和模型对同一条固定轨迹的预测是否同步改善。

可做教学消融：固定模型，用短/长想象范围训练策略；观察想象更长是否因累计误差而变差。记住这不是严格隔离所有因素的最终论文实验，需要保持训练预算和价值目标可比。现有官方 V1 代码偏历史版本，本轮只核验入口，没有运行。
