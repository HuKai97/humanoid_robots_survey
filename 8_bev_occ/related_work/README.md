# 人形机器人 BEV / Occupancy 学习资料库

面向已有传统轮式机器人感知经验的读者，兼顾人形行走、导航和操作。当前传感器、计算平台和时间目标未定。调研核验日期：**2026-09-29**。

本轮整理 **37 篇逐篇解析**，覆盖经典方法与 2025–2026 年直接相关工作。每篇先给总结，再介绍任务、输入输出、方法、实验读法、局限、人形迁移价值和复现检查点。另有候选扩展阅读，不将其算作已完成逐篇解析。

## 从哪里开始

| 你要做什么 | 入口 |
|---|---|
| 第一次学习，先建立概念 | [从这里开始](00_START_HERE.md) |
| 理解方法谱系与人形差异 | [领域地图与综述](SURVEY.md) |
| 找某一篇论文与阅读优先级 | [37 篇论文索引](PAPER_INDEX.md) |
| 比较技术路线 | [方法比较](COMPARISON.md) |
| 按阶段安排学习 | [学习路线](LEARNING_ROADMAP.md) |
| 查 BEV、SSC、TSDF、ESDF 等术语 | [术语与数学基础](GLOSSARY.md) |
| 选择数据与理解评价协议 | [数据集说明](../dataset.md)、[测评草案](../experiment/evaluation.md) |
| 准备复现 | [baseline 计划](../复现/README.md) |
| 继续跟踪新工作 | [扩展阅读](EXTENDED_READING.md) |
| 查检索和质量边界 | [调研方法](METHODOLOGY.md)、[检查记录](QUALITY_CHECK.md) |

## 首轮优先读的 12 篇

OctoMap → Voxblox → LSS → BEVDepth → BEVFormer → MonoScene → TPVFormer → SurroundOcc → EmbodiedScan → EmbodiedOcc → Humanoid Occupancy → Humanoid-OmniOcc。全部入口见索引。

行走分支再补高程建图与 ViPlanner；语义操作分支补 VLMaps 和 ConceptGraphs；效率分支补 SparseOcc、GaussianFormer；长期在线与预测分支补 GEM-Occ、OccWorld、RoboOccWorld。次序是针对你的经验制定的建议，不是论文影响力排名。

## 阅读时保留的边界

- **BEV 表征、三维占用、距离场和可通行性是不同概念。**
- **驾驶、四足、手持扫描与人形实机证据分别标明。**
- **正式论文与预印本、仓库存在与实现发布、论文成绩与本地复现分别记录。**
- 本次在线核验主来源并撰写笔记，**未下载论文 PDF、LaTeX 源码、数据或权重，未运行模型实验**。
- 这是代表作覆盖与学习调研，不声称穷尽截至该日期的全部文献，也没有制作跨协议的统一性能排行榜。

项目按 [research-workflow](https://github.com/skJack/research-workflow) 设置总纲、交接、文献、复现、实验和数据文件；用户不下载论文的要求优先，具体见调研方法。
