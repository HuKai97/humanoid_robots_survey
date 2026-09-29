# 面向人形机器人操作的物体 6D 位姿估计

帮助已有轮式机器人感知经验的工程师，系统学习物体 6D 位姿估计，并规划在人形机器人操作中的验证。

**核心主张：先辨明输入、对象先验和评测条件，再选择 baseline；先复现和分析失败，再提出研究假设。**

目标：当前是学习与调研，未指定会议、期刊或截止日期。默认研究刚体物体相对相机/机器人坐标系的位姿；机器人自身定位和人体关节姿态仅作边界说明。

## 每个新窗口先读

1. 本文件。
2. [handoff.md](handoff.md)。
3. 开始实验前读 [experiment/evaluation.md](experiment/evaluation.md) 和 [experiment/results.md](experiment/results.md)。

## 目录职责

| 路径 | 内容 |
|---|---|
| `related_work/` | 调研总览、逐篇解析、对比表、学习路线和来源 |
| `related_work/papers/<year>_<method>/` | 每篇 `README.md` + `metadata.json` |
| `复现/` | baseline 计划和后续实际复现报告 |
| `experiment/` | 评测协议和只追加的实验结果 |
| `DataSet/`、`dataset.md` | 数据清单、数据状态与划分规则 |
| `brainstorm.md` | 真实讨论记录；未验证的研究候选须明确标记 |
| `handoff.md` | 进度、证据范围与下一步 |

## 本项目约束

- 用户明确要求**不下载论文**。本轮也不下载论文源码、数据、模型权重；文献保留官方链接与中文解析。不要调用上游 `fetch-paper.sh`。
- 标准术语：6D object pose estimation、SE(3)、RGB/RGB-D、PnP、ICP、instance-level、category-level、novel/unseen object、pose tracking、object symmetry、hand–eye calibration、BOP、ADD(-S)、VSD/MSSD/MSPD。
- 每篇先给总结，再详述方法；注明来源和阅读深度。区分作者结论、我们的解释、工程推断和待验证事项。
- 不把 unseen object 等同于无 CAD，不把 model-free 等同于无参考数据，不把 detector/mask 的人工输入当成全自动能力。
- 不编造会场、结果、代码可运行性；论文报告不写成我们的复现结果。未知项明确写待核实。
- 修改实验前说明改动目的；每版命名 `v<序号>_<核心改动>`，结果不覆盖、不删除，失败也记录。
- 不临时挑指标；对象、序列、参考采集和测试场景的划分须避免泄漏。
- 结束前更新 handoff；按需读文件，无需一次读全库。

工作流来源：[skJack/research-workflow](https://github.com/skJack/research-workflow)，参考提交 `14c882df49a7991b9833f2ff416e4dfd38668827`（2026-09-29 核验）。按用户要求将上游每篇 PDF/源码结构调整为链接与笔记。
