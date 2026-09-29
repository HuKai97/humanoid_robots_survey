# 人形机器人 RL：从传统感知到学习控制

本项目为有传统机器人感知经验、尚无强化学习经验的研究者建立中文文献调研、学习路线与可执行的复现准备。

核心目标：先理解并复现基础运动控制，再用状态估计、几何地图、感知不确定性等已有能力寻找可检验的研究问题。候选方向不等于已证实创新。

投稿会议、deadline、机器人型号、GPU 与可用工时：均未指定，不自行假定。

## 阅读顺序

1. 本文件。
2. [handoff.md](handoff.md)。
3. [related_work/README.md](related_work/README.md)；涉及实验时读 [评测规范](experiment/evaluation.md) 和 [实验记录](experiment/results.md)。

## 目录约定

| 路径 | 用途 |
|---|---|
| `related_work/` | 总览、学习路线、论文矩阵、感知交叉方向；`papers/` 每篇一份中文解析 |
| `复现/` | 复现计划与报告；尚未执行的内容明确标注 |
| `brainstorm.md` | 问题、候选假设与后续讨论，倒序记录 |
| `experiment/` | 预先制定的评测协议与只追加的实验记录 |
| `DataSet/` 与 `dataset.md` | 数据占位及来源、用途、许可检查、划分方法 |
| `handoff.md` | 当前完成项、限制和下一步 |

## 工作约定

- 采用用户指定的 [research-workflow](https://github.com/skJack/research-workflow)，按其固定目录与交接、复现、测评原则组织；本轮只做调研与计划。
- 用户明确要求不下载论文。不要运行 `fetch-paper.sh`，不要下载 PDF 或 LaTeX 源码。本轮通过公开网页、论文摘要/HTML、作者项目页和官方代码仓库核验，保存原创笔记及链接。
- 每篇解析先简短总结，再详细介绍。区分论文事实、作者报告结果、我们的推断与待核验内容；不编造实验数字、硬件要求、开源状态或复现结果。
- 区分物理仿真人体、四足、双足与人形实机。四足方法对人形的迁移是研究假设。
- 区分 RL、模仿学习、行为克隆、遥操作、状态估计与部署；不用一个“端到端”概括所有方法。
- 沿用标准术语：MDP/POMDP、policy、actor/critic、PPO、GAE、sim-to-real、domain randomization、privileged information、teacher–student、proprioception/exteroception、state estimation、motion retargeting、whole-body control。
- 先跑 baseline、检查输入输出与失败案例，再提升候选假设的可信度。每次实验保留配置、种子、代码版本、失败结果。
- 训练/测试按地形族、场景、采集序列或动作源划分，避免近邻样本泄漏。依照 `experiment/evaluation.md` 评测。
- 收尾更新 `handoff.md`；不把本轮建议写成用户已确认的研究决策。
