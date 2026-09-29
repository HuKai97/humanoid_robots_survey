# 数据集调研与状态

**所有数据均未下载，未做预处理。** 下表是选择指南，不代表当前目录已有数据。容量、许可细则和格式应在下载前按具体版本核对。

| 数据集/集合 | 首选用途 | 关注点 | 一手入口 |
|---|---|---|---|
| YCB-Video / BOP YCB-V | 桌面已知对象 RGB-D 6D pose 入门 | 区分原始与 BOP 格式、对象单位、test targets | [BOP 数据页](https://bop.felk.cvut.cz/datasets/) |
| LINEMOD-Occlusion / LM-O | 遮挡与经典方法比较 | 数据覆盖有限，不能代表真实人形场景 | [BOP 数据页](https://bop.felk.cvut.cz/datasets/) |
| T-LESS | 弱纹理、相似形状、对称性 | 对称定义、传感器与对象外观 | [官方页](https://cmp.felk.cvut.cz/t-less/) |
| NOCS CAMERA / REAL（常称 CAMERA25/REAL275） | 类别级位姿与尺寸 | 类别内新实例；对象规范坐标；名称不是对象数 | [官方代码与数据说明](https://github.com/hughw19/NOCS_CVPR2019) |
| HouseCat6D | 更丰富的家庭类别、材质与姿态 | RGB、深度、偏振及抓取标注；算法是否使用额外模态 | [项目](https://sites.google.com/view/housecat6d)、[工具](https://github.com/Junggy/HouseCat6D) |
| HO3D | 人手遮挡下物体姿态/跟踪 | 版本及划分、手/物体标注、mask 输入条件 | [官方仓库](https://github.com/shreyashampali/ho3d) |
| YCBInEOAT | 机器人操作时的物体跟踪 | 机器人操作相关，但不等于双足人形整机 | [作者仓库](https://github.com/wenbowen123/iros20-6d-pose-tracking) |
| HOT3D / HOT3D-Clips | 第一视角、多视角、手物交互 | 标定、鱼眼/非针孔模型、参考 onboarding 与测试分离 | [官方工具](https://github.com/facebookresearch/hot3d) |
| BOP-H3 | 新物体、参考采集、第一视角等更现实条件 | 包含 HOT3D、HOPEv2、HANDAL，需看具体任务条件 | [BOP 2024](https://bop.felk.cvut.cz/challenges/bop-challenge-2024/) |
| BOP-Industrial | 工业杂乱场景、单/多视图 | 和家庭手物操作不同，跨场景验证时使用 | [BOP 2025](https://bop.felk.cvut.cz/challenges/) |
| MR6D | 移动机器人远视角/较大对象 | 是工业移动机器人补充集，不是人形专属数据 | [官方论文页](https://openaccess.thecvf.com/content/ICCV2025W/R6D/html/Gouda_MR6D_Benchmarking_6D_Pose_Estimation_for_Mobile_Robots_ICCVW_2025_paper.html) |

数据用途与限制是本项目选型分析；数据模态/构成以对应官方页面为依据。

## BOP 数据接口最先检查什么

常用目录包括 `rgb/`、`depth/`、`mask/`、`mask_visib/`，场景 JSON 常包括相机参数、对象到相机位姿及可见性信息。`cam_t_m2c` 的长度单位和深度图的 `depth_scale` 不能忽略；通用程序内部建议统一米制，转换点写在日志中。官方格式说明以具体数据/工具版本为准。[BOP 格式文档](https://github.com/thodan/bop_toolkit/blob/master/docs/bop_datasets_format.md)

对官方格式中的常规深度图，`depth_m = depth_raw × depth_scale / 1000`（乘 scale 后为毫米）；姿态平移也从毫米转米。读取每帧 `scene_camera.json` 中的内参，不能默认所有帧共用根目录模拟相机参数。[官方格式规范](https://github.com/thodan/bop_toolkit/blob/master/docs/bop_datasets_format.md)

## 自采数据建议

每条记录至少有：原始 RGB/深度、采集时间、内参、畸变/投影模型、深度尺度、动态关节状态、外参版本、对象 ID、CAD/参考数据版本、估计结果和可选 GT 来源。数据真值若来自标记板、动作捕捉、人工对齐或其他算法，需要注明误差和是否用于推理。

按三组留数据：开发调试、冻结验证、最终测试。以对象/独立序列/场景为边界，连续帧不跨集合；参考重建序列也作为独立数据资产登记。先固定评测集与样例，再调超参数。

下载后应逐项补：本地路径、数据版本、许可、校验、实际容量、对象数/序列数、预处理命令、相机模型、单位、split 清单。当前这些本地状态均为“未准备”。
