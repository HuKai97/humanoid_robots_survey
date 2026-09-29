# 人形机器人学习与调研

围绕人形机器人的感知、导航、操作与学习，整理中文文献笔记、方法对比、学习路线和后续复现规划。重点关注传统机器人感知经验与具身智能相关方向的衔接。

本仓库适合用于建立领域知识框架、查找论文与资源、选择学习主线，以及规划可验证的研究或工程项目。阅读文档无需安装训练环境，使用支持 Markdown 的编辑器或代码托管平台即可。

**当前阶段：文献调研、入门学习与项目规划。** 仓库中的复现方案、评测草案和候选假设应与实际实验结果区分；各方向的具体进度见对应 `handoff.md`。

## 方向导航

| 目录 | 方向 | 主要内容 | 阅读入口 |
|---|---|---|---|
| `0_todo/` | 项目规划 | 从现有感知任务出发，规划工程项目、阶段交付与成果材料 | [项目规划与简历路线](0_todo/人形机器人多模态感知项目规划与简历路线.md) |
| `1_vlm_vln/` | VLM / VLN 基础 | 视觉语言模型、多模态大模型、视觉语言导航基础与部分论文精读 | [调研总览](1_vlm_vln/related_work/README.md) |
| `2_vln/` | 人形机器人 VLN | 经典与连续环境导航、语言导航方法、人形导航及执行接口 | [方向介绍](2_vln/README.md) |
| `3_vla/` | 视觉语言动作模型（VLA） | 通用操作策略、语言条件动作学习、人形控制与相关数据评测 | [方向介绍](3_vla/README.md) |
| `4_wm/` | 世界模型（World Model） | 动作条件预测、模型式控制、机器人视频与三维表征、感知交叉研究 | [方向介绍](4_wm/README.md) |
| `5_mutlimodel_perc/` | 多模态感知 | 多传感器融合、RGB-D、语义与触觉感知，以及感知与学习的结合 | [方向介绍](5_mutlimodel_perc/README.md) |
| `6_RL/` | 强化学习（RL） | 强化学习基础、模仿学习、腿足运动、人形控制与感知辅助策略 | [方向介绍](6_RL/README.md) |
| `7_hunan_perc/` | 人形机器人感知 | 视觉几何、传感器标定与融合、地形感知及其与控制的接口 | [方向介绍](7_hunan_perc/README.md) |
| `8_bev_occ/` | BEV / Occupancy | 鸟瞰图与三维占据表示、建图、室内场景及人形机器人迁移 | [方向介绍](8_bev_occ/README.md) |
| `9_6d_pose_estimation/` | 物体 6D 位姿估计 | 物体位置与朝向估计、跟踪、方法选型及人形操作感知 | [方向介绍](9_6d_pose_estimation/README.md) |

`1_vlm_vln/` 提供 VLM 与 VLN 的基础脉络；`2_vln/` 进一步聚焦人形机器人导航。其他方向也会交叉引用同一工作，阅读时以各自关注的问题和实验条件为准。

## 从哪里开始

按当前目标选择一条主线，无需按目录编号通读全部材料：

- **补齐视觉语言模型基础**：从 [VLM 阅读顺序](1_vlm_vln/related_work/multimodal-llm/README.md) 入手，再阅读 [ViT](1_vlm_vln/related_work/multimodal-llm/01-foundations/vit.md)、[CLIP](1_vlm_vln/related_work/multimodal-llm/01-foundations/clip.md) 和 [BLIP](1_vlm_vln/related_work/multimodal-llm/01-foundations/blip.md) 笔记。
- **学习语言导航**：从 [VLN 零基础入门](2_vln/related_work/00_start_here.md) 开始，结合 [学习路线](2_vln/related_work/02_learning_path.md) 阅读任务、方法与评测。
- **学习机器人操作与 VLA**：先看 [VLA 入门导读](3_vla/related_work/00_START_HERE.md)，再按 [学习路线](3_vla/related_work/LEARNING_ROADMAP.md) 阅读策略、数据与人形相关工作。
- **从传统感知切入人形机器人**：先看 [感知调研入口](7_hunan_perc/related_work/README.md)，再按任务补充 [多模态感知](5_mutlimodel_perc/related_work/README.md)、[BEV / Occupancy](8_bev_occ/related_work/README.md) 或 [6D 位姿估计](9_6d_pose_estimation/related_work/README.md)。
- **研究预测、决策与控制**：分别从 [世界模型领域总览](4_wm/related_work/01_领域总览.md) 和 [强化学习调研入口](6_RL/related_work/README.md) 建立概念，再查看感知交叉选题。
- **规划可落地的项目**：阅读 [项目规划与简历路线](0_todo/人形机器人多模态感知项目规划与简历路线.md)，结合已有任务、传感器、算力和协作条件确定范围。

进入一个方向后，建议按以下顺序使用资料：

1. 阅读方向介绍、入门指南和领域地图，明确任务及输入输出。
2. 按学习路线选择少量核心论文，结合方法对比表与术语表阅读。
3. 查看 `dataset.md` 与 `复现/README.md`，确认数据、代码、硬件和基线条件。
4. 开始实验前明确 `experiment/evaluation.md` 中的评测协议；运行后在 `experiment/results.md` 记录真实结果与失败案例。
5. 根据实际证据更新 `brainstorm.md`，并在 `handoff.md` 中留下进度和下一步。

## 文档组织

`2_vln/` 至 `9_6d_pose_estimation/` 采用相近的研究文档结构，具体文件名以各目录为准：

```text
<研究方向>/
├── README.md                方向介绍与阅读入口
├── AGENTS.md                该方向的工作约定
├── handoff.md               当前进度、限制与下一步
├── brainstorm.md            待验证问题与候选假设
├── related_work/            综述、学习路线、论文笔记与来源索引
├── 复现/                    基线选择、复现计划与报告
├── dataset.md               数据、环境及使用条件说明
├── DataSet/                 数据目录说明
└── experiment/
    ├── evaluation.md        评测协议
    └── results.md           实验结果记录
```

`1_vlm_vln/` 按 `multimodal-llm/` 与 `vln/` 组织文献；`0_todo/` 保存跨方向的项目规划。论文笔记可能采用单独的 Markdown 文件或 `papers/<工作名>/README.md`，请通过各方向索引访问。

## 当前资料与使用说明

- **已整理的内容**：领域概览、中文论文解析、来源链接、方法比较、学习路线，以及数据与复现入口。部分方向还包含结构化索引、检索记录和核验说明。
- **待推进的工作**：结合具体设备与任务选择基线、搭建实验环境、运行复现、进行实机验证。当前各方向尚未记录已完成的基线复现或实机实验。
- **阅读深度**：各篇笔记的资料范围不同，可能来自摘要、论文重点章节、项目页或官方代码说明；具体以单篇记录为准。
- **资源与时效**：文献覆盖范围、检索日期、代码及权重状态以对应方向的记录为准，开展复现前应重新核查。`1_vlm_vln/` 保留论文下载脚本及少量 PDF，其余专题主要保存笔记与来源链接；阅读仓库无需批量下载论文。

## 补充与维护

继续某个方向的工作前，先阅读该目录的 `AGENTS.md`、`handoff.md` 和 `related_work/README.md`。

- 新增文献时沿用该方向的模板，补充论文或作者官方来源、版本信息、检索日期与实际阅读深度，并同步索引。
- 将论文事实、作者报告、个人分析和待验证假设分开记录；四足、机械臂、仿真人形与真实双足平台的证据分别说明。
- 方法比较需注明输入、数据划分、任务、动作空间和平台条件，实验数字应能追溯到原文或实际运行记录。
- 保留已有笔记与实验版本，按各方向约定追加勘误和结果；完成阶段工作后更新交接记录。

各方向的详细规范和进度记录是持续维护的依据，本 README 提供仓库层面的总览与导航。
