# 人形机器人RL：入门、代表工作与感知交叉调研

调研日期：**2026-09-29**。面向已有传统机器人感知经验、刚开始学习RL的研究者。收录**24篇代表性工作**，覆盖RL与足式控制基础、人形全身控制、感知与状态估计；每篇先给一分钟总结，再解释方法和训练/部署接口、证据局限、感知关联与复现重点。

**建议从“PPO与基础行走 → 状态估计/局部地形 → 感知误差对闭环控制的影响”进入。** 不必在开始时同时追动作大模型、复杂跑酷和灵巧操作。已有几何、滤波、标定和地图经验可以成为研究优势，但候选选题需要复现和实验验证。

本项目按你指定的 [research-workflow](https://github.com/skJack/research-workflow) 组织，目录用其标准名称 `related_work/`。**未下载论文PDF或LaTeX，也未安装环境、下载数据/权重或运行实验。** 文献依据公开摘要、论文HTML、作者项目页和官方仓库核验；证据深度见各篇。调研有明确范围，不是截至该日的穷尽综述。

## 建议先打开这四份

| 文件 | 你能获得什么 |
|---|---|
| [领域地图与入门概念](01_领域地图与入门概念.md) | 分清感知、导航、运动控制、模仿与RL；读懂基本训练闭环 |
| [论文对比矩阵](02_论文对比矩阵.md) | 24篇的角色、输入、平台、阅读优先级和代码边界 |
| [十二周学习路线](03_十二周学习路线.md) | 每阶段读什么、做什么、怎样判断已经学会 |
| [传统感知与RL交叉选题](04_传统感知与RL交叉选题.md) | 六个候选方向，最近邻、最小实验、对照与否定条件 |

补充：[调研方法与范围](00_调研方法与范围.md) · [资源与复现选择](05_资源与复现选择.md) · [前沿更新与边界](06_前沿更新与边界.md) · [术语速查](07_术语速查.md)。

## 第一轮只读十篇

以下是本调研针对你的背景安排的阅读顺序，非影响力排名，也不要求依次完整复现：

1. [PPO](papers/F01_PPO_2017.md)：策略怎样学习。
2. [GAE](papers/F02_GAE_2015_2016.md)：怎样估计动作的相对好坏。
3. [Massively Parallel RL](papers/F06_Massively_Parallel_2021_2022.md)：足式训练框架的组成。
4. [Humanoid-Gym](papers/H03_Humanoid_Gym.md)：人形行走的训练与部署工程。
5. [Concurrent Training](papers/P05_Concurrent_State_Estimation.md)：从熟悉的状态估计进入学习控制。
6. [RMA](papers/F05_RMA_2021.md)：隐藏动力学和历史信息。
7. [Robust Perceptive Locomotion](papers/P01_Miki2022_Perceptive_Locomotion.md)：不可靠外感知如何影响控制。
8. [BeamDojo](papers/P07_BeamDojo.md)：人形脚底几何、LiDAR地图与稀疏落脚。
9. [DeepMimic](papers/F03_DeepMimic_2018.md)：理解参考动作与物理控制。
10. [BeyondMimic](papers/H07_BeyondMimic.md)：连接现代人形全身动作跟踪。

感知分支的短路线是 **P05 → P01 → P07**：前两篇以四足机制为借鉴，最后一篇进入人形；建议掌握PPO和基础行走后读。代码开放程度不同，阅读顺序不等于复现可执行顺序。

## 第二轮怎样分支

- 关心视觉/局部地图：P02 Extreme Parkour → P06 Humanoid Parkour Learning；再选读P08 PHP。
- 关心导航与运动协同：P03 ANYmal Parkour、P04 ViNL；注意导航指标和步行指标不同。
- 关心动作模仿与全身控制：F03 DeepMimic → F04 AMP → H05 ExBody → H06 ASAP → H07 BeyondMimic → H08 SONIC。
- 关心人类动作输入与操作：H01 H2O、H04 HumanPlus；区分遥操作、低层RL与高层视觉模仿。
- 关心仿真迁移与历史观测：F07 Hwangbo、F08 Cassie、H02 Humanoid Transformer。

所有条目均在[矩阵](02_论文对比矩阵.md)中链接。无需第一天通读24篇；先读总结，遇到你的方向再下钻。

## 如何接着做

[复现计划](../复现/README.md)按小任务PPO、运动baseline、感知闭环、候选假设四步推进。[评测规范](../experiment/evaluation.md)规定数据划分、对照、任务指标和失败案例；[实验记录](../experiment/results.md)目前为空，避免将计划写成结果。

进一步上下文见[AGENTS.md](../AGENTS.md)、[handoff.md](../handoff.md)、[brainstorm.md](../brainstorm.md)和[dataset.md](../dataset.md)。投稿目标、具体机器人、GPU和工时仍待确定。

## 文献管理

- `papers/`：24篇中文解析。
- `metadata/`：三个分支的来源元数据，包含年份、平台、证据和代码备注。
- [references.bib](references.bib)：便于检索的精简BibTeX；不是已核验完整作者/卷期的投稿参考文献库。
- [论文解析模板](论文解析模板.md)：后续扩充时沿用。

对最新论文、开源状态和改题版本，优先沿各篇的一手来源检查，不把本轮笔记当作永久不变的事实。
