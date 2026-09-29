# 数据集选择、标签谱系与使用边界

核验日期：2026-09-29。**本项目尚未下载、申请或解压任何数据，也未运行数据处理。** 以下“有入口”仅表示官方页面或数据包说明可见，不表示完整性、许可适用性和实际下载已验证。当前人形传感器与计算平台未确定，先选任务，再选数据；不要求一次收集全部基准。

## 1. 基础数据与派生占据标签是两层

| 数据源 | 原始观测与适合学习的问题 | 应避免的混淆 |
|---|---|---|
| **NYU Depth V2 / NYUv2** | 室内 Kinect RGB-D，适合认识近场深度、二维语义和单目 SSC。官方提供原始视频与带标注的对齐图像对。[官方](https://cs.nyu.edu/~fergus/datasets/nyu_depth_v2.html) | MonoScene/SSCNet 使用的三维补全目标属于任务处理版本；不能把原始二维标签直接当体素真值。[解析](related_work/papers/monoscene/README.md) |
| **SemanticKITTI** | 基于 KITTI Odometry 的逐扫描语义点云与另行提供的 SSC 体素数据；适合学习道路三维补全及标签读取。[官方](https://www.semantic-kitti.org/dataset.html) | 点分割与 SSC 是不同任务；SSC 的 `invalid` 与 `occluded` 分开定义，忽略掩码不是 empty 标签。单目方法另读取配套图像，不能由基准名称推断模型推理使用 LiDAR。 |
| **nuScenes** | 多传感器道路序列及标定、位姿、检测/点语义等信息，是多种占据标签的基础。[官方 devkit](https://github.com/nutonomy/nuscenes-devkit) | 下载 nuScenes 并不等于得到所有 OCC 真值；下述标签管线互不替代。 |
| **ScanNet** | 带位姿的室内 RGB-D 扫描、重建表面与实例语义，是多个室内 OCC 基准的数据来源。[官方说明](https://github.com/ScanNet/scannet.github.io/blob/master/index.md) | 同一物理房间可能有多个扫描；随机拆帧不构成未知场景泛化。整理后的相机位姿不等于实机在线定位性能。 |

NYU 适合先理解单帧补全；nuScenes 系适合学习环视 BEV 及道路标签制作；ScanNet 系更贴近室内语义与回看记忆。这是本调研的学习安排，不是数据集优劣排名。已有传统地图经验时，可先用少量未来授权的 RGB-D 序列建立几何参照，再引入学习式补全。

## 2. 同为 nuScenes：Occ3D、OpenOccupancy、OpenOcc 的区别

| 派生标签 | 关键区别 | 复现前需要锁定 |
|---|---|---|
| **Occ3D-nuScenes** | Occ3D 还含 Waymo 版本；官方数据区分语义、`mask_lidar` 和 `mask_camera`，其原始评价说明使用相机可见掩码。[官方说明](https://github.com/Tsinghua-MARS-Lab/Occ3D) | 哪个原始数据版本、相机/LiDAR mask 在训练和测试怎样用、类别及空间范围；后续工作可能修改协议。[解析](related_work/papers/occ3d/README.md) |
| **OpenOccupancy / nuScenes-Occupancy** | 独立的增密与净化标注管线，并支持相机、LiDAR、多模态基线；官方文档区分弃用 v0.0 与 v0.1，后者列出 0.2 m 体素。[数据文档](https://github.com/JeffWang987/OpenOccupancy/blob/main/docs/prepare_data.md) | 原始 noise 与训练 empty 的映射、标签版本、动态伪影处理和评测区域；不要照搬其他基准类表。[解析](related_work/papers/openoccupancy/README.md) |
| **OpenOcc** | *Scene as Occupancy / OccNet* 对应标签；当前官方仓库列出 `openocc_v2.1`、语义及 flow，网格为 0.4 m；也提供射线评价和流相关协议。[官方](https://github.com/OpenDriveLab/OccNet) | 原始论文设置与更新后的 challenge 设置分别登记；flow、RayIoU 和 voxel mIoU 不混称。 |

三者可以使用相同帧 token，却在几何增密、空/未知处理、范围、体素尺寸和评价对象上不同。严禁只凭“nuScenes mIoU”把分数放进同一排行榜。离线真值允许用额外观测增密，但这些图像/点云不能因此进入在线推理的未来时间窗。

## 3. ScanNet 系：局部、全局与未来任务的区别

| 名称 | 数据与任务的关系 | 对学习者的意义 |
|---|---|---|
| **EmbodiedScan** | 统一 ScanNet、3RScan、Matterport3D 等来源，组织带位姿第一视角 RGB-D 与检测、占据、语言任务；不是 ScanNet 的一个简单标签别名。[官方仓库](https://github.com/InternRobotics/EmbodiedScan) | 适合比较室内模态与任务；检测类别数不等于 occupancy 类别数。[解析](related_work/papers/embodiedscan/README.md) |
| **Occ-ScanNet / OccScanNet** | ISO 提供的室内局部单目占据基准，准备包含 `posed_images`、`gathered_data` 与局部划分；其数据卡还要求遵守 ScanNet、CompleteScanNet 条款。[ISO](https://github.com/hongxiaoy/ISO)、[数据卡](https://huggingface.co/datasets/hongxiaoy/OccScanNet/blob/main/README.md) | 学习相机前方局部体积预测。需审计局部帧划分所属场景，不自行假设所有版本场景互斥。 |
| **EmbodiedOcc-ScanNet** | 基于局部标注重组为按场景分组的带位姿序列与全局标签，服务连续观察、显式记忆及已探索范围评价。[正文 §4.1](https://arxiv.org/html/2412.04380v2)、[官方数据卡](https://huggingface.co/datasets/YkiWu/EmbodiedOcc-ScanNet) | “当前视锥结果好”与“看过多个视角后的地图好”分别评价；mini、mini2 与原 ISO mini 不默认相同。 |
| **OccWorld-ScanNet** | RoboOccWorld 基于上述数据重组下一状态及自回归预测任务；条件还包含下一相机位姿。[正文 §4](https://arxiv.org/html/2505.05512v1) | 下一状态变化可能来自视角变化。区分历史真值占据、模型预测占据及 RGB 前端，不能把 oracle 输入成绩当成端到端成绩。[解析](related_work/papers/robooccworld/README.md) |

这些名称体现的是标注与任务组织，不能仅因都源于 ScanNet 就合并训练列表。原始扫描提供的完整网格也不能未经裁剪直接作为“只看过去”的模型输入。观察历史的顺序、可见掩码和场景坐标原点，应一起版本化。

## 4. 人形与足式数据：优先核实采集主体和开放状态

| 数据或论文 | 观测配置与证据边界 | 本次核验状态 |
|---|---|---|
| **HumanoidOcc / Humanoid Occupancy** | 六相机与 LiDAR，人佩戴同配置设备采集，人形视角不等于真实人形步态；关注重力对齐与动态标注。[项目](https://humanoid-occupancy.github.io/) | 官方代码仍 coming soon；数据完整获取未验证。[解析](related_work/papers/humanoid_occupancy/README.md) |
| **Humanoid-OmniOcc** | 四组环视双目，真实传感器规格到仿真生成再到真实评估；不能把混合样本数写成全是真机实采。[项目](https://d-robotics-ai-lab.github.io/humanoid-omniocc/) | 数据需协议申请，代码待发布；本次未申请。[解析](related_work/papers/humanoid_omniocc/README.md) |
| **OneOcc：QuadOcc / Human360Occ** | QuadOcc 为真实四足全景观测；Human360Occ 为仿真人类视角与步态扰动，须分开报告。[官方](https://github.com/MasterHow/OneOcc) | 训练/推理、权重及数据指南仍在待发布清单。[解析](related_work/papers/oneocc/README.md) |
| **PanoMMOcc** | 真实四足，全景 RGB、热、偏振、LiDAR；采集序列总量与实际标注子集不同。[官方](https://github.com/SXDR/PanoMMOcc) | 仓库明确 Code and Dataset Coming soon；不将演示图当数据包。[解析](related_work/papers/panommocc/README.md) |
| **HIOcc / HI-Occ** | GEM-Occ 的室内基准，整合 ScanNet、ScanNet++、Matterport3D 的带位姿 RGB-D/全景观测；名称不能证明真实人形采集。[项目](https://zhuhu00.top/GEM-Occ/) | [官方数据卡](https://huggingface.co/datasets/zhuhu00/HI-Occ)已有包说明，但 ScanNet++ 仅 frame 级 `060`，排除 scene 级及 `120/240`；完整配置可复现性未验证。[解析](related_work/papers/gem_occ/README.md) |

对于近期学习，先把可核验的经典数据协议读清楚，再跟踪人形新数据；不要把“论文提出”“网页发布”“数据包存在”“脚本可运行”“结果已复现”合成一个“已开源”。网页状态会变化，未来实际启动前须再核验。

## 5. 任何数据进入实验前都要填写的记录

1. **来源与版本**：原始数据、派生标签、场景列表、预处理脚本提交、许可入口；保留原始 ID 到训练 ID 的映射。
2. **三份输入清单**：采集硬件提供什么；离线标签/训练额外使用什么；在线推理真正可见什么。深度传感器制标签和测试时使用深度是不同设置，预测深度还要记录其预训练来源。
3. **几何**：米/毫米、轴方向、图像畸变模型、裁剪后内参、位姿方向、重力轴、网格范围与高度原点。位姿标为参考/真值、扰动或在线估计，不能省略。
4. **观测状态**：分别定义 occupied、free、unknown、ignore；默认零值不自动代表已观测自由。训练 mask、评价 mask 和可视化 mask 分别保存。
5. **划分与时间**：优先沿用正式 split；额外泛化实验按物理场景/轨迹分组，同房间重扫描、同路线相邻片段不跨集合。仿真和真实、室内和室外分别报告；在线输入仅截至当前时刻。
6. **少量样本审计**：先叠图核对投影，再检查细腿、门槛、透明物、动态人、回看与自遮挡。记录无法判断的区域，不能为了稠密外观随意补洞。

将指标和统一对照条件写入 [测评协议](experiment/evaluation.md)，仅把真正执行的结果追加到 [实验结果](experiment/results.md)。数据目录的管理约定见 [DataSet/README.md](DataSet/README.md)。
