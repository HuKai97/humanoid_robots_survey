# 人形机器人世界模型：调研与入门

帮助有传统机器人感知背景、尚未做过世界模型的研究者建立知识框架，选择可复现的切入点。

**核心问题：动作条件的环境预测，能否利用几何、状态估计和多传感器经验，提高人形机器人的闭环决策可靠性？这是待验证问题，不是已证明的论文主张。**

当前目标：文献调研、入门学习和实验设计。会议、截止时间、硬件与感知细分方向尚未指定。

## 接续工作

1. 先读本文件与 [handoff.md](handoff.md)。
2. 文献入口为 [related_work/README.md](related_work/README.md)，按需阅读论文卡。
3. 开始实验前读 [experiment/evaluation.md](experiment/evaluation.md) 与 [experiment/results.md](experiment/results.md)。

## 目录

| 路径 | 职责 |
|---|---|
| `related_work/` | 总览、学习路线、比较表、论文卡和可追溯来源 |
| `复现/` | 最小基线计划与将来的复现报告 |
| `brainstorm.md` | 研究假设、支持依据及否证条件，按新到旧追加 |
| `experiment/evaluation.md` | 开始实验前冻结的评测协议 |
| `experiment/results.md` | 真实实验结果，追加记录，失败同样保留 |
| `DataSet/`、`dataset.md` | 数据实体目录与数据说明；目前只记录链接 |
| `handoff.md` | 本轮产物、证据边界和下一步 |

## 当前约束

- 用户明确不下载论文：不保存 PDF、LaTeX 源码或论文网页镜像。每篇保存中文分析和官方链接。也未授权启动大规模训练或数据下载。
- 使用标准术语：world model、model-based RL、POMDP、belief state、RSSM、latent dynamics、MPC、proprioception、exteroception、contact、occupancy、sim-to-real。
- 区分事实、作者声称、分析推断、拟议实验；未复现不得写成实验结论。
- 分清真人形双足、仿真人形、轮式人形、机械臂、四足和自动驾驶证据。
- 标注阅读深度：读过 HTML 方法段不等于核验过全部附录；摘要级证据不得支持精确公式和数据表。
- 新工作记录首次公开时间与查询日期；代码链接存在不等于训练代码、权重、数据全部可用。
- 先跑通基线、分析失败，再决定选题。当前 brainstorm 仅是复现后的候选清单。
- 实验按轨迹/场景/物体/机器人/地形等目标泛化维度划分，避免相邻帧泄漏。所有版本留名，禁止只记录最优种子。

结构依据：[skJack/research-workflow](https://github.com/skJack/research-workflow)。本地适配说明见 [related_work/06_调研方法与来源.md](related_work/06_调研方法与来源.md)。
