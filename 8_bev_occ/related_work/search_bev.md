# BEV 基础方向检索与筛选记录

检索日期：2026-09-29。目标是为具有传统轮式机器人感知背景、计划转向人形机器人 BEV/occupancy 的学习者建立方法谱系。此文件只覆盖 BEV 基础子主题，不是全领域或最新论文的穷尽检索。

## 检索范围与方法

以题名和正式作者项目为种子，在线检索 arXiv、CVF、AAAI、作者项目页与作者官方 GitHub；阅读可用 HTML 正文的关键方法与实验段落，交叉核验年份、正式标题、官方代码归属。没有下载 PDF、论文源码、仓库源码、权重或数据，也没有执行远程脚本。搜索结果偶尔含 PDF 文本片段，未把片段当成完整 PDF 阅读。

筛选以学习价值而非当日排行榜位置为主：视角变换、检测训练、深度监督、时序记忆、多模态融合、三维表示、未来动态预测各选代表工作。为避免复杂度掩盖基本问题，额外纳入 Simple-BEV 作为实验方法对照。

## 已执行的检索词

| 查询 | 后续核验 | 纳排决定 |
|---|---|---|
| `Lift Splat Shoot ECCV 2020 official github nv-tlabs` | NVIDIA 作者项目、arXiv 2008.05711、nv-tlabs 仓库 | 纳入：可微视锥展开及 BEV pooling 起点 |
| `BEVFormer ECCV 2022 official project` | arXiv 2203.17270、fundamentalvision 仓库 | 纳入：空间与时间注意力；排除搜索命中的 changtekai fork 作为官方归属依据 |
| `BEVDepth AAAI 2023 official github` | AAAI DOI 页、arXiv 2206.10092、Megvii-BaseDetection 仓库 | 纳入：明确深度监督与相机参数条件化 |
| `BEVFusion MIT Han Lab ICRA 2023 official` | MIT Han Lab 项目、arXiv 2205.13542、mit-han-lab 仓库 | 纳入 MIT 版本；同名另一篇不合并结果 |
| `TPVFormer Tri-Perspective View for Vision-Based 3D Semantic Occupancy Prediction CVPR 2023 official` | CVF 正式记录、arXiv 2302.07817、wzzheng 仓库 | 纳入：BEV 到三维语义占据的桥梁 |
| `Simple-BEV What Really Matters for Multi-Sensor BEV Perception ICRA 2023 official` | 作者项目、arXiv 2206.07959、aharley 仓库 | 纳入：公平对照及训练/传感器因素 |
| `FIERY Future Instance Prediction Birds Eye View Surround Monocular Cameras ICCV 2021 official` | arXiv 2104.10490、wayveai 仓库 | 纳入：动态 BEV 与未来实例；标题按正式论文 Prediction |
| `BEVDet High-performance Multi-camera 3D Object Detection in Bird-Eye-View 2021 2022 official github arxiv` | arXiv 2112.11790、第一作者主页、HuangJunJie2017 仓库 | 补充纳入：连接 LSS 与检测/深度改进 |

检索返回的综述清单、博客、第三方转载与 fork 只用来发现候选或消歧，不作为算法细节的最终证据。各篇主要论文 HTML 和仓库链接已打开核验；可下载资产的链接存在，不代表已验证下载可用或运行成功。

## 文献索引与建议阅读次序

| 序号 | 论文 | 年份与出版状态 | 主要学习问题 | 本地解析 |
|---|---|---|---|---|
| 1 | Lift, Splat, Shoot | ECCV 2020 | 图像如何进入共同 BEV 坐标系 | [LSS](papers/lift_splat_shoot/README.md) |
| 2 | Simple-BEV | 2022 首发，ICRA 2023 | 强基线、公平对照、传感器信息贡献 | [Simple-BEV](papers/simple_bev/README.md) |
| 3 | BEVDet | 2021 首发预印本，2022 修订 | 视角转换之后如何训练检测系统 | [BEVDet](papers/bevdet/README.md) |
| 4 | BEVDepth | 2022 首发，AAAI 2023 | 中间几何量如何获得可靠监督 | [BEVDepth](papers/bevdepth/README.md) |
| 5 | BEVFormer | ECCV 2022 | BEV query、时序对齐和可学习关联 | [BEVFormer](papers/bevformer/README.md) |
| 6 | BEVFusion（MIT） | 2022 首发，ICRA 2023 | 多模态共享空间与计算瓶颈 | [BEVFusion](papers/bevfusion_mit/README.md) |
| 7 | TPVFormer | CVPR 2023 | 如何恢复显式高度与控制表示成本 | [TPVFormer](papers/tpvformer/README.md) |
| 8 | FIERY | ICCV 2021 | 从历史融合到未来动态预测 | [FIERY](papers/fiery/README.md) |

上述次序按学习依赖排列，不按发表时间排序。每篇都先给摘要式总结，再写方法、输入输出、实验口径、局限、人形迁移分析与阅读/复现检查点。

## 跨论文关键辨析

1. **BEV 特征不是 occupancy**：LSS、BEVDet、BEVFormer 等构造中间 BEV 表示，具体能否回答占据问题由任务头、标签和评价协议决定。
2. **点上评价不是体素空间评价**：TPVFormer 的点分割代理任务与稠密占据不能混称；可视化补全也不等于每个未知体素都有可靠真值。
3. **相机推理不等于相机监督**：BEVDepth 等使用点云提供训练几何信息，要分别登记训练传感器和推理传感器。
4. **历史感知不等于未来预测**：BEVFormer 的时间信息改善当前估计；FIERY 明确预测未来实例，两者不是同一任务。
5. **汽车证据不等于人形证据**：以上核心结果来自道路数据。人形迁移讨论均是工程分析，尚未实验验证。
6. **总体帧率不同于算子速度**：BEVFusion 等 pooling 优化不可直接推断整机延迟；变动外参与近场细网格会改变计算条件。

## 未覆盖与下一轮扩展

- BEVDet4D、BEVStereo、BEVPoolv2、MatrixVT 是当前八篇的自然代码/时序/效率延伸，暂未作为逐篇深读条目，避免挤占三维占据与人形空间建模的学习重心。
- DETR3D、PETR 等适合进一步理解三维 object query 与位置编码，但本轮已用 BEVFormer 覆盖几何引导查询的基础，不宣称已调研它们的全文。
- 没有进行各方法在 2026 年软件环境中的构建、依赖兼容、权重有效性与机器人实时性验证。
- 之后若做复现，应先冻结数据划分和坐标约定，再固定模型提交与配置，分别报告训练监督、推理输入、时域、网格与硬件；真实结果写入项目实验记录。
