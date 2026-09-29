# 论文索引与阅读优先级

共 **37 篇**独立解析。P0＝首轮核心概念或直接人形工作；P1＝体系完整性与主要分支；P2＝进阶研究。优先级面向学习，不代表质量或当前性能排序。

“正式年份 / arXiv首发”可能不同；表中未知会议不作猜测。完整标题、作者、主来源、代码状态和实际阅读范围见每篇笔记。所有代码均未在本地运行。

## A. 几何建图与足下表面（4篇）

| # | 工作 | 发表信息 | 主要问题 | 优先级 |
|---|---|---|---|---|
| 01 | [OctoMap](papers/octomap/README.md) | Autonomous Robots 2013 | 三维占用证据、八叉树、未知空间 | P0 |
| 02 | [Voxblox](papers/voxblox/README.md) | IROS 2017 / arXiv 2016 | TSDF 到增量 ESDF，规划距离查询 | P0 |
| 03 | [nvblox](papers/nvblox/README.md) | ICRA 2024 / arXiv 2023 | GPU 增量距离场建图，软件版本边界 | P1 |
| 04 | [Elevation Mapping using GPU](papers/elevation_mapping_gpu/README.md) | IROS 2022 | 局部高程与足式地形接口 | P1 |

## B. BEV基础、多传感器与时序（7篇）

| # | 工作 | 发表信息 | 主要问题 | 优先级 |
|---|---|---|---|---|
| 05 | [Lift, Splat, Shoot](papers/lift_splat_shoot/README.md) | ECCV 2020 | 概率深度提升、BEV聚合 | P0 |
| 06 | [BEVDet](papers/bevdet/README.md) | arXiv 2021，2022修订 | 多相机 BEV 检测训练 | P1 |
| 07 | [BEVDepth](papers/bevdepth/README.md) | AAAI 2023 / arXiv 2022 | 可靠深度与几何监督 | P0 |
| 08 | [BEVFormer](papers/bevformer/README.md) | ECCV 2022 | 空间查询与历史 BEV | P0 |
| 09 | [BEVFusion（MIT）](papers/bevfusion_mit/README.md) | ICRA 2023 / arXiv 2022 | 共享 BEV 多模态融合 | P1 |
| 10 | [Simple-BEV](papers/simple_bev/README.md) | ICRA 2023 / arXiv 2022 | 简单基线与公平控制实验因素 | P1 |
| 11 | [FIERY](papers/fiery/README.md) | ICCV 2021 | 未来 BEV 实例预测 | P2 |

## C. 三维语义占用与补全（10篇）

| # | 工作 | 发表信息 | 主要问题 | 优先级 |
|---|---|---|---|---|
| 12 | [SSCNet](papers/sscnet/README.md) | CVPR 2017 / arXiv 2016 | 单深度几何和语义补全 | P1 |
| 13 | [MonoScene](papers/monoscene/README.md) | CVPR 2022 / arXiv 2021 | 单目三维场景补全 | P0 |
| 14 | [VoxFormer](papers/voxformer/README.md) | CVPR 2023 | 几何提案与稀疏到稠密推理 | P1 |
| 15 | [TPVFormer](papers/tpvformer/README.md) | CVPR 2023 | 三平面三维表示 | P0 |
| 16 | [Occ3D](papers/occ3d/README.md) | NeurIPS 2023 Datasets & Benchmarks | 标签构造与可见性协议 | P0 |
| 17 | [OpenOccupancy](papers/openoccupancy/README.md) | ICCV 2023 | 标注增密、多模态、级联细化 | P1 |
| 18 | [SurroundOcc](papers/surroundocc/README.md) | ICCV 2023 | 多相机稠密三维占用 | P0 |
| 19 | [OccFormer](papers/occformer/README.md) | ICCV 2023 | 双路径编码与占用解码 | P1 |
| 20 | [SparseOcc（Liu）](papers/sparseocc/README.md) | ECCV 2024 / arXiv 2023 | 全稀疏预测与 RayIoU | P2 |
| 21 | [GaussianFormer](papers/gaussianformer/README.md) | ECCV 2024 | 语义高斯到三维占用 | P1 |

## D. 自监督、室内在线与长期记忆（7篇）

| # | 工作 | 发表信息 | 主要问题 | 优先级 |
|---|---|---|---|---|
| 22 | [SelfOcc](papers/selfocc/README.md) | CVPR 2024 / arXiv 2023 | 视频自监督几何；语义伪标签边界 | P2 |
| 23 | [EmbodiedScan](papers/embodiedscan/README.md) | CVPR 2024 / arXiv 2023 | 室内多模态感知基准 | P0 |
| 24 | [EmbodiedOcc](papers/embodiedocc/README.md) | ICCV 2025 / arXiv 2024 | 显式高斯记忆、在线局部更新 | P0 |
| 25 | [SliceOcc](papers/sliceocc/README.md) | arXiv 2025 | 高度切片、多视图室内占用 | P1 |
| 26 | [EmbodiedOcc++](papers/embodiedocc_plus/README.md) | ACM MM 2025 | 平面约束、不确定性采样 | P1 |
| 27 | [RoboOcc](papers/roboocc/README.md) | arXiv 2025 | 高斯几何与透明度引导 | P1 |
| 28 | [GEM-Occ](papers/gem_occ/README.md) | arXiv 2026 | 观测证据、层级记忆、自由/未知 | P2 |

## E. 直接人形与足式占用（4篇）

| # | 工作 | 发表信息 | 主要问题 | 优先级 |
|---|---|---|---|---|
| 29 | [Humanoid Occupancy](papers/humanoid_occupancy/README.md) | 2025技术报告 | 人形多模态、重力对齐与时序 | P0 |
| 30 | [Humanoid-OmniOcc](papers/humanoid_omniocc/README.md) | arXiv 2026 | 双目全视角人形占用数据 | P0 |
| 31 | [OneOcc](papers/oneocc/README.md) | CVPR 2026 / arXiv 2025 | 单全景相机、足式数据；非全真人形数据 | P1 |
| 32 | [PanoMMOcc / VoxelHound](papers/panommocc/README.md) | arXiv 2026，8月v2 | 四足全景多模态与视角扰动 | P1 |

## F. 任务接口与世界模型（5篇）

| # | 工作 | 发表信息 | 主要问题 | 优先级 |
|---|---|---|---|---|
| 33 | [ViPlanner](papers/viplanner/README.md) | ICRA 2024 / arXiv 2023 | 视觉语义如何进入局部导航 | P1 |
| 34 | [VLMaps](papers/vlmaps/README.md) | ICRA 2023 / arXiv 2022 | 三维语言特征地图、目标查询 | P1 |
| 35 | [ConceptGraphs](papers/conceptgraphs/README.md) | ICRA 2024 / arXiv 2023 | 对象级开放词汇场景图 | P1 |
| 36 | [OccWorld](papers/occworld/README.md) | ECCV 2024 / arXiv 2023 | 占用token与未来场景/运动 | P2 |
| 37 | [RoboOccWorld](papers/robooccworld/README.md) | arXiv 2025 | 下一相机位姿条件的室内预测 | P2 |

## 代码和阅读状态如何用

逐篇标记有以下差别：官方实现目录可见；项目入口可见但发布不完整；代码 coming soon；未确认官方实现。它们都不表示本地复现成功。对于 OctoMap、SSCNet、OpenOccupancy 和部分工程/任务桥接工作，本轮可能只读摘要、项目或文档；逐篇已注明，不声称37篇都是全文精读。

Humanoid Occupancy、Humanoid-OmniOcc、OneOcc 等直接相关新工作优先读概念和数据假设，但能否作为立即执行的 baseline 还取决于官方发布状态。不要因为 P0 就跳过资源检查。

进一步候选见 [EXTENDED_READING.md](EXTENDED_READING.md)，检索过程见 [METHODOLOGY.md](METHODOLOGY.md)。
