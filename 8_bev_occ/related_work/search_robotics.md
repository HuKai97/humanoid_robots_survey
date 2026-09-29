# 机器人几何建图、人形与足式占据：检索记录

检索截止：2026-09-29。范围是“从传统轮式感知进入人形BEV/OCC”，同时覆盖行走、全身碰撞和导航后的操作。传感器和平台尚未确定。本文记录这一分支的检索与纳排，不代表全目录只有这些论文。

## 检索路径

1. 经典表示：`OctoMap An Efficient Probabilistic 3D Mapping Framework Based on Octrees paper`、`Voxblox Incremental 3D Euclidean Signed Distance Fields on-board MAV planning paper`、`nvblox NVIDIA reconstruction GPU TSDF ESDF official`。
2. 足下几何：`Elevation Mapping for Locomotion and Navigation using GPU Takahiro Miki paper`，进一步追到GPU仓库与Robot-Centric Elevation Mapping前序引用。
3. 感知到任务：`ViPlanner Visual Semantic Imperative Learning Local Navigation paper official`、`Visual Language Maps VLMaps paper ICRA 2023 official`、`ConceptGraphs Open Vocabulary 3D Scene Graphs Perception Planning official`。
4. 真正人形占据：`humanoid robot occupancy mapping perception locomotion 2025 2026 height map`、`HumanoidOcc occupancy 2026`、`Humanoid-OmniOcc`、`Humanoid Occupancy arxiv`。
5. 全景足式与新近记忆：由前述原始文献及检索线索追查OneOcc、PanoMMOcc和GEM-Occ；对照arXiv当前版本、HTML方法/实验及作者仓库，不只用搜索摘要。
6. 开放状态：检查作者仓库是否具有实现和权重，而非仅有README/网站；数据链接是否是官方入口；“计划公开”和“当前可见数据包”分别记录。

浏览中出现的二手聚合页仅用于发现候选，正文技术判断优先采用作者项目、官方仓库、arXiv正文与出版页面。没有下载PDF、TeX源码、代码库、模型或数据，也没有给作者发送邮件。没有实际训练或真机测试。

## 已纳入索引

P0=学习与基线优先，P1=核心扩展/前沿跟踪，P2=任务语义扩展。证据中的“项目级”不等于全文精读；“HTML方法级”也不等于已经复现。

| 工作 | 年份/状态 | 类别与真实平台边界 | 阅读优先级 | 本次证据 | 笔记 |
|---|---|---|---|---|---|
| OctoMap | Autonomous Robots 2013 | 概率几何占据；通用机器人 | P0 | 官方项目/代码/元数据 | [解析](papers/octomap/README.md) |
| Voxblox | IROS 2017 | TSDF→ESDF；原验证为MAV | P0 | 摘要/官方代码/文档 | [解析](papers/voxblox/README.md) |
| nvblox | ICRA 2024 | GPU几何建图；论文与新版工程分开 | P0 | HTML方法/官方API/changelog | [解析](papers/nvblox/README.md) |
| Elevation Mapping using GPU | IROS 2022 | 四足地形/地下探索，不称人形实验 | P0 | 摘要/官方实现/文档 | [解析](papers/elevation_mapping_gpu/README.md) |
| ViPlanner | ICRA 2024 | 语义局部路径；不是全身控制或OCC网络 | P1 | 摘要/官网/训练说明 | [解析](papers/viplanner/README.md) |
| VLMaps | ICRA 2023 | 语言目标与地图；不替代碰撞几何 | P2 | 摘要/官网/官方仓库 | [解析](papers/vlmaps/README.md) |
| ConceptGraphs | ICRA 2024 | 对象图与任务关系；非稠密OCC | P2 | 摘要/官网/官方仓库 | [解析](papers/conceptgraphs/README.md) |
| Humanoid Occupancy | 2025技术报告 | 人形系统；数据有同配置人戴采集 | P0 | HTML v2方法/表格/官网/代码状态 | [解析](papers/humanoid_occupancy/README.md) |
| Humanoid-OmniOcc | 2026预印本 | 人形环视双目；主要仿真并真实评估 | P1 | HTML v1方法/表格/官网/访问要求 | [解析](papers/humanoid_omniocc/README.md) |
| OneOcc | CVPR 2026，2025首发 | 真四足QuadOcc+仿真人视角H3O | P1 | HTML v2/当前arXiv/官方仓库 | [解析](papers/oneocc/README.md) |
| PanoMMOcc / VoxelHound | 2026预印本 | 真四足多模态；不是双足验证 | P1 | HTML v2/官方仓库 | [解析](papers/panommocc/README.md) |
| GEM-Occ / HIOcc | 2026预印本 | 室内长期占据记忆；非真机步态结果 | P1 | HTML方法/局限/官网/官方数据卡 | [解析](papers/gem_occ/README.md) |

## 纳入、排除与后续候选

纳入条件是至少解决一个直接接口：占用/自由/未知、距障查询、足底支撑几何、BEV/体素投影、时序与姿态扰动、环视传感器、占据数据标注、长期语义地图，或导航/操作所需的语义组织。经典几何不因年代早被排除；其作用是可验证基线和概念桥梁。

纯控制工作、泛化VLM规划、视觉漂亮但不提供空间有效性/几何接口的世界模型，不作为本分支核心。四足成功不当成人形成功；人戴采集不当成全部真机采集；离线IoU不当成闭环任务收益。没有把工程仓库名称自动变成论文：nvblox的正式ICRA2024论文已额外核验。

保留的候选/延伸：

- [Gait-Adaptive Perceptive Humanoid Locomotion with Real-Time Under-Base Terrain Reconstruction](https://ga-phl.github.io/)：作者项目页可见，涉及向下深度与自中心高程，是人形脚下盲区的重要候选；本轮未进一步核对论文版本与完整实验，暂不列为已精读条目。
- [Robot-Centric Elevation Mapping前序代码](https://github.com/ANYbotics/elevation_mapping)：2014与2018不确定性建图引用已确认，合并放入GPU高程笔记的基础阅读，不重复计数。
- iSDF、Voxfield、Hydra等可在几何距离场/大规模语义地图阶段延伸；本轮未为这些方法独立建立已核验详细条目。

## 核验中需要保留的限制

- Humanoid Occupancy单帧mIoU不优于同表BEVFusion，多帧结果应限定设置；历史帧越多没有单调提升。[原表](https://arxiv.org/html/2507.20217v2)
- Humanoid-OmniOcc的网络简称在摘要/正文/官网不一致，正文“最佳单目”叙述与表格也不一致，笔记以表格与明确版本为依据。[原文](https://arxiv.org/html/2606.22971v1)
- OneOcc当前arXiv v2已明确CVPR2026录用；真实四足与CARLA人类视角不能合并为人形真机证据。[元数据](https://arxiv.org/abs/2511.03571)
- PanoMMOcc的总采集帧、已标注帧和stride采样帧不同；增加模态并非夜间所有指标都提高。[原文](https://arxiv.org/html/2603.13108v2)
- GEM-Occ聚焦静态室内；官网代码尚待发布，官方数据卡已有部分包，ScanNet++制品分辨率存在明确范围限制。[项目](https://zhuhu00.top/GEM-Occ/)、[数据卡](https://huggingface.co/datasets/zhuhu00/HI-Occ)

## 下一轮更新方法

先检查作者仓库及arXiv版本变化，再更新相应笔记的核验日期、开放状态与结论。新结果必须记录输入模态、数据划分、体素大小、有效性mask、硬件和任务指标。只有拿到可运行代码并完成验证后，才将“可见仓库”升级为“本地复现通过”。
