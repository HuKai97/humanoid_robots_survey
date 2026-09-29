# 人形系统与近期感知融合检索记录

检索日期：2026-09-29。目标是为初学者选出可串联学习的代表工作，并补充直接实体人形证据；这是主题取样，不声称穷尽截至该日所有新论文。未下载PDF、LaTeX源码或数据，未运行论文仓库。

## 检索路径

|检索词/线索|采纳工作|选择原因|证据入口|
|---|---|---|---|
|RMA Rapid Motor Adaptation legged robots|21 RMA|提供历史本体与隐式环境适应基础；明确四足|[摘要](https://arxiv.org/abs/2107.04034)、[作者页](https://ashish-kmr.github.io/rma-legged-robots/)|
|Learning robust perceptive locomotion wild Miki|22 野外感知运动|直接讨论外感知失效与本体互补；明确四足|[摘要](https://arxiv.org/abs/2201.08117)、[项目](https://leggedrobotics.github.io/rl-perceptiveloco/)|
|HumanPlus humanoid shadowing imitation|23 HumanPlus|人形双目、本体与行为克隆系统|[摘要](https://arxiv.org/abs/2406.10454)、[项目](https://humanoid-ai.github.io/)|
|OmniH2O universal dexterous teleoperation|24 OmniH2O|辨清替代输入接口、示教与自主的系统边界|[摘要](https://arxiv.org/abs/2406.08858)、[项目](https://omni.human2humanoid.com/)|
|GR00T N1 foundation humanoid arxiv|25 GR00T N1|论文明确GR-1真实操作；非单纯企业宣传|[论文](https://arxiv.org/abs/2503.14734)、[研究页](https://research.nvidia.com/labs/lpr/publication/gr00tn1_2025/)|
|Sim-to-Real vision dexterous humanoids 2025|26 视觉灵巧操作|稠密深度与稀疏位置互补；注明外部相机依赖|[论文](https://arxiv.org/abs/2502.20396)、[项目](https://toruowo.github.io/recipe/)|
|humanoid vision loco manipulation depth real world 2025|27 VisualMimic|G1第一人称深度到全身操作的分层闭环|[论文](https://arxiv.org/abs/2509.20322)、[项目](https://visualmimic.github.io/)|
|humanoid perceptive locomotion 2026 depth history|28 FootQuery|近期直接人形，接触预测引导历史视觉读取|[摘要](https://arxiv.org/abs/2609.21447)、[v1 HTML](https://arxiv.org/html/2609.21447v1)|

## 证据核验与排除

- 8篇均打开了arXiv全文HTML，实际阅读重点为方法、实验条件与相关限制，不把定向阅读标成逐页精读。
- 21—22的实验平台分别为A1、ANYmal；23—28为直接实体人形工作，其中23—24基于H1，25—26基于Fourier GR1，27—28基于G1。人形硬件存在不等于完成全身行走验证，笔记逐篇区分。
- 曾考虑H2O、FALCON控制框架与HumanVLA。未增加纯控制重复条目；FALCON存在重名论文，未据简称合并。HumanVLA与Humanoid-VLA也不得混为一篇。
- 检索也发现[VIRAL](https://arxiv.org/abs/2511.15200)和[Opening the Sim-to-Real Door](https://arxiv.org/abs/2512.01061)。本轮只检索到摘要线索，未写详细笔记；可作为下一轮RGB人形移动操作补充，不代表评价其优劣。
- FootQuery先由检索结果发现，随后以arXiv原始摘要和全文HTML核验。未采用第三方“已开源”标签，项目与代码字段留空；两个arXiv入口不算两份独立实验。
- GR00T官方仓库目前包含后续N1系列内容；笔记依据N1原始论文v1，不把后续版本宣称或指标归给N1。
- RMA作者项目页代码链接指向`antonilo/rl_locomotion`；仅确认链接关系，不声称该仓库当前默认分支完整复现论文。

## 阅读后仍需核验

1. 拟复现前固定论文版本、代码提交、权重、传感器布局与训练/测试分布。
2. 定量比较需回到每张原表的任务、试验次数、随机种子及低层控制器；本轮避免跨平台摘取成功率排名。
3. FootQuery的组件消融、诊断控制配置及因果归因存在正文明确描述的缺口，建议列为阅读讨论题，而非成熟基线直接复现承诺。
4. 人形感知路线可按22 → 23/26 → 27 → 28阅读；25用于了解VLA方向，24用于数据采集接口，21用于理解本体适应。
