# 三维语义占据文献检索记录

检索与核验日期：**2026-09-29**。范围：面向具有传统轮式机器人感知经验、准备转向人形 BEV/OCC 的读者，建立任务起源、稠密视觉占据、数据/评测、稀疏表示和自监督的学习链。此表是定向代表作调研，不宣称系统综述穷尽全部文献，也不宣称当前性能排名。

## 检索流程和证据规则

按“核心论文定位 → 原始会议/arXiv → 作者项目/官方仓库 → 方法段与实验协议 → 关联工作扩展”推进。只使用原始论文、会议发布页、作者项目页、作者/机构官方代码仓库支撑技术结论；搜索中的第三方解读和聚合页仅用于发现，不用作最终方法证据。

未下载论文 PDF、论文源码、实现代码、模型权重或数据。浏览器侧读取论文 HTML、摘要与 README；搜索引擎有时返回 PDF 的索引摘要，但未将其保存为本地论文。所有本地材料为自行撰写的中文调研笔记。代码状态只代表官网/仓库入口已核验，不表示完成运行或复现。

各篇先给一分钟总结，再介绍输入输出、方法、概念、实验阅读重点、局限及人形迁移。原文结果与个人迁移分析分开；后者明确标为“本调研推断”。没有完整核对协议的精确精度/速度数字不进入笔记。

## 实际使用的查询

| 阶段 | 查询关键词（实际查询或主页面定向打开） | 目的 |
|---|---|---|
| 起源 | `SSCNet Semantic Scene Completion single depth image CVPR 2017 official` | 定位任务定义、CVPR 年份与旧仓库 |
| 单目基线 | `MonoScene CVPR 2022 official github` | 核验单目输入、FLoSP、官方仓库迁移 |
| 稀疏到稠密 | `VoxFormer CVPR 2023 official github` | 核验两阶段结构、深度来源、时序输入 |
| 数据 | `Occ3D Large-Scale 3D Occupancy Prediction Benchmark NeurIPS 2023 official github` | 核验可见性、标签流水线与协议 |
| 稠密环视 | `SurroundOcc Multi-Camera 3D Occupancy Prediction ICCV 2023 official` | 核验三维查询和标签增密 |
| 编解码 | `OccFormer Dual-path Transformer Vision-based 3D Semantic Occupancy Prediction ICCV 2023` | 核验局部/全局路径及 mask 解码 |
| 稀疏/评价 | `SparseOcc Sparse 3D Occupancy Prediction ECCV 2024 official github` | 发现同名论文，核验 RayIoU 归属 |
| 连续表示 | `GaussianFormer Semantic-Aware 3D Gaussian Splatting 3D Occupancy Prediction ECCV 2024 official` | 确认准确标题及版本区别 |
| 自监督 | `SelfOcc Self-Supervised Vision-Based 3D Occupancy Prediction CVPR 2024 official` | 核验 SDF、视频损失和语义伪标签来源 |
| 2025 延伸 | `site:openaccess.thecvf.com GaussianFormer-2 2025` | 核验原版后续概率建模工作 |
| 2026 延伸 | `OccAny Generalized Unconstrained Urban 3D Occupancy 2026`；`site:arxiv.org 2026 occupancy humanoid` | 检查泛化与人形新数据集方向 |
| 方法补查 | 定向打开 arXiv HTML，并查找 `FLoSP`、`preserve`、`MVS-embedded`、`OpenSeeD`、`Limitations` | 避免只根据摘要编造方法细节 |

## 纳入的九篇核心论文

| 本地解析 | 正式标题及年份 | 主要价值 | 原始/官方证据 | 本轮实际阅读 |
|---|---|---|---|---|
| [SSCNet](papers/sscnet/README.md) | Semantic Scene Completion From a Single Depth Image，CVPR 2017（预印本 2016） | 单深度语义补全任务起点 | [CVF](https://openaccess.thecvf.com/content_cvpr_2017/html/Song_Semantic_Scene_Completion_CVPR_2017_paper.html)、[代码](https://github.com/shurans/sscnet) | 摘要、项目页、README；未逐式精读 |
| [MonoScene](papers/monoscene/README.md) | MonoScene: Monocular 3D Semantic Scene Completion，CVPR 2022 | 单目特征投影与上下文补全 | [论文 HTML](https://arxiv.org/html/2112.00726)、[代码](https://github.com/astra-vision/MonoScene) | 方法重点与消融入口、项目/README |
| [VoxFormer](papers/voxformer/README.md) | VoxFormer: Sparse Voxel Transformer for Camera-based 3D Semantic Scene Completion，CVPR 2023 | 深度提案、稀疏取证、稠密补全 | [论文 HTML](https://arxiv.org/html/2302.12251)、[代码](https://github.com/NVlabs/VoxFormer) | 方法 §3、协议入口、README |
| [Occ3D](papers/occ3d/README.md) | Occ3D: A Large-Scale 3D Occupancy Prediction Benchmark for Autonomous Driving，NeurIPS 2023 D&B | 标签生成与可见性评价 | [NeurIPS](https://papers.neurips.cc/paper_files/paper/2023/hash/cabfaeecaae7d6540ee797a66f0130b0-Abstract-Datasets_and_Benchmarks.html)、[论文 HTML](https://arxiv.org/html/2304.14365)、[代码](https://github.com/Tsinghua-MARS-Lab/Occ3D) | 数据/质量/模型章节与 README |
| [SurroundOcc](papers/surroundocc/README.md) | SurroundOcc: Multi-Camera 3D Occupancy Prediction for Autonomous Driving，ICCV 2023 | 环视稠密 3D volume 与标签增密 | [论文 HTML](https://arxiv.org/html/2303.09551)、[代码](https://github.com/weiyithu/SurroundOcc) | 网络和标签章节、README |
| [OccFormer](papers/occformer/README.md) | OccFormer: Dual-path Transformer for Vision-based 3D Semantic Occupancy Prediction，ICCV 2023 | 双路径编码和小类保留 | [CVF](https://openaccess.thecvf.com/content/ICCV2023/html/Zhang_OccFormer_Dual-path_Transformer_for_Vision-based_3D_Semantic_Occupancy_Prediction_ICCV_2023_paper.html)、[论文 HTML](https://arxiv.org/html/2304.05316)、[代码](https://github.com/zhangyp15/OccFormer) | 方法，pooling/采样段，README |
| [SparseOcc/Liu](papers/sparseocc/README.md) | Fully Sparse 3D Occupancy Prediction，ECCV 2024（预印本 2023） | 全流程稀疏与 RayIoU | [论文 HTML](https://arxiv.org/html/2312.17118)、[代码](https://github.com/MCG-NJU/SparseOcc) | 方法、RayIoU、版本说明 |
| [GaussianFormer](papers/gaussianformer/README.md) | GaussianFormer: Scene as Gaussians for Vision-Based 3D Semantic Occupancy Prediction，ECCV 2024 | 自适应高斯表示与转体素 | [论文 HTML](https://arxiv.org/html/2405.17429)、[代码](https://github.com/huang-yh/GaussianFormer) | 方法、局限和版本说明 |
| [SelfOcc](papers/selfocc/README.md) | SelfOcc: Self-Supervised Vision-Based 3D Occupancy Prediction，CVPR 2024（预印本 2023） | 视频自监督几何与语义监督边界 | [CVF](https://openaccess.thecvf.com/content/CVPR2024/html/Huang_SelfOcc_Self-Supervised_Vision-Based_3D_Occupancy_Prediction_CVPR_2024_paper.html)、[论文 HTML](https://arxiv.org/html/2311.12754)、[代码](https://github.com/huang-yh/SelfOcc) | 方法、MVS、实现和伪语义来源 |

## 纳入/排除标准与候选

纳入标准：具有清楚技术转折点、可核验主来源、与人形空间感知有明确知识迁移关系；优先覆盖不同方法问题，而不是堆同类模型。九篇核心解析均已完成，以下是扩展阅读候选，未冒充完整精读。

| 候选 | 核验信息与主来源 | 本轮处理理由 |
|---|---|---|
| SparseOcc/Tang | CVPR 2024，[论文](https://arxiv.org/abs/2404.09502)、[官方仓库](https://github.com/VISION-SJTU/SparseOcc) | 与 Liu 的 SparseOcc 同名但不同方法；本轮主读 Liu 的全稀疏/RayIoU 线，在主笔记消歧 |
| GaussianFormer-2 | CVPR 2025，[会议原始页](https://openaccess.thecvf.com/content/CVPR2025/html/Huang_GaussianFormer-2_Probabilistic_Gaussian_Superposition_for_Efficient_3D_Occupancy_Prediction_CVPR_2025_paper.html) | 概率高斯叠加、非空区初始化，是原版后续；列为进阶，不混入 2024 方法 |
| OccAny | CVPR 2026，[会议原始页](https://openaccess.thecvf.com/content/CVPR2026/html/Cao_OccAny_Generalized_Unconstrained_Urban_3D_Occupancy_CVPR_2026_paper.html)、[作者项目](https://valeoai.github.io/OccAny/) | 已核验正式发表与任意相机输入/域外泛化方向；仅摘要级。仍是城市 occupancy，不据此宣称已解决人形近场 |
| Humanoid-OmniOcc | 2026 预印本，[arXiv:2606.22971](https://arxiv.org/abs/2606.22971) | 与人形直接相关，已转交人形/具身文献线深入核验；本索引不重复写核心解析，不凭 arXiv 年份虚构会议 |
| Humanoid Occupancy | 2025 预印本入口，[arXiv:2507.20217](https://arxiv.org/abs/2507.20217) | 人形多模态占据，交由人形线核验正式发表状态及方法，避免本支线重复 |
| OccNeRF | [arXiv:2312.09243](https://arxiv.org/abs/2312.09243)、[官方仓库](https://github.com/LinShan-Bin/OccNeRF)；当前标题为 OccNeRF: Advancing 3D Occupancy Prediction in LiDAR-Free Environments | 同属低标注成本方向，本轮优先 SelfOcc；只核验摘要和官方入口，未作完整方法解析。旧预印本标题为 Self-Supervised Multi-Camera Occupancy Prediction with Neural Radiance Fields，应留意版本差异 |
| TPVFormer、BEVFormer 等 | 已由 BEV/三维表示线分别解析 | 避免重复；本线引用其表示概念，不另造冗余笔记 |

未纳入：仅有第三方标题而无可核验主来源的“最新 SOTA”；主要做图像渲染而未证明占据用途的普通 3DGS 工作；只做 3D detection 的工作不在本 OCC 主线重复展开。相关性不足不表示论文质量差。

## 最需要避免的误读

1. **SSC 与在线建图不等价。** 单次补全预测不能代替带位姿不确定性、动态更新和回环修正的地图维护。
2. **Unknown 不等于 free。** 被遮挡、未采样、被稀疏裁剪或在预测范围之外，不构成自由空间证据。
3. **camera-only 要分训练与推理。** LiDAR 可能用于真值、深度监督或预训练；SelfOcc 的语义也有二维伪标签来源。
4. **同数据源不等于同基准。** nuScenes 上的稀疏点分割、Occ3D 标签、SurroundOcc 标签与不同 mask 的体素评价应分开。
5. **SDF/高斯不自动带安全含义。** 预测 SDF 不天然是可靠规划 ESDF，高斯也不天然是校准占据概率。
6. **车载证据不自动推出人形表现。** 近场细结构、六自由度头部运动、自遮挡和全身碰撞需要单独实测。

## 尚待后续精读和实测

- SSCNet 全文输入编码与损失细节仍需精读；本轮笔记已明示证据范围。
- 所有工作的源码、依赖安装、许可细节及模型推理尚未实际验证；复现入口可用不等于复现成功。
- 不同标签和 mask 下的精确分数未做统一重算，因此本轮不提供横向总排名。
- 2025–2026 候选是定向补查，不是对全年度论文的穷尽覆盖；OccAny 和人形新基准值得下一轮优先深化。
