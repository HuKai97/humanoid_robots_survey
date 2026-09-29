# 数据资源：视觉、LiDAR、RGB-D 与 IMU（非 SLAM）

核查日期：2026-09-29。**本次只调研，没有下载数据。** 建议先用公开数据练接口与单项能力，再用小规模自采验证人形域差异。下列资源没有一个同时覆盖人形动态、自遮挡、近场落足及完整视觉—LiDAR—深度—IMU组合。已有位姿可作为给定输入，本学习路线不训练定位或SLAM后端。

## 先按问题选数据

| 数据资源与官方入口 | 可用模态；IMU情况 | 主要标签/参考量 | 最适合练什么 | 到人形的主要偏差 |
|---|---|---|---|---|
| [nuScenes](https://www.nuscenes.org/nuscenes) | 6相机、LiDAR、雷达；原始IMU信息见单独[CAN bus扩展](https://github.com/nutonomy/nuscenes-devkit/blob/master/python-sdk/nuscenes/can_bus/README.md)，不要把ego_pose当IMU | 3D框、类别、跟踪；lidarseg另有逐点语义扩展；标定与ego pose | 相机—LiDAR投影、BEV融合及传感器故障消融；仅汽车域baseline | 相机/雷达布局、视角高度、目标尺度和动态均为汽车；缺少人形关节、自遮挡与脚边精细支撑标签 |
| [SemanticKITTI](https://semantic-kitti.org/dataset.html) | 以KITTI Odometry LiDAR扫描及标定为核心；标准语义包不是同步原始IMU包 | 逐点语义/实例、任务相关体素标签；训练标签与测试服务分开 | 点云分割、细结构召回、未知/遮挡体素处理 | 道路类别与车载扫描密度，不代表室内头部LiDAR；不能默认附带人形可踩踏标签 |
| [ScanNet](https://github.com/ScanNet/ScanNet) | 室内RGB-D、内外参、相机位姿、重建网格；官方C++ SensReader说明包含IMU读取能力，具体序列的字段与时间戳需核查 | 网格语义/实例及其2D投影 | RGB-D语义、局部几何、给定位姿下的多帧投影；不要求重跑重建系统 | 手持扫描以室内结构为主；IMU格式支持不等于已验证可作同步完整惯性基准；没有人形关节和落脚接触 |
| [NYU Depth V2](https://cs.nyu.edu/~fergus/datasets/nyu_depth_v2.html)（可选） | RGB、Kinect深度、accelerometer数据；不应写成完整六轴IMU | 稠密类别/实例；rawDepths与补洞后的depths分别提供 | 深度缺失分析、RGB-D语义、小型室内深度评估 | 老一代结构光传感器与当前双目/ToF误差不同；补洞结果不是全部实测真值 |
| [DIODE](https://diode-dataset.org/)（可选） | RGB、扫描仪深度、有效掩码、法线；公开任务输入无配套IMU时序 | 度量深度、法线与valid mask；并非语义类别数据 | 单目深度跨室内外泛化、法线评估 | 静态扫描采集，不能评估步态时序、运动模糊或接触；扫描仪几何质量不代表机器人深度相机 |
| [iKalibr公开标定序列](https://github.com/Unsigned-Long/iKalibr/blob/master/docs/details/dataset.md) | 作者自采rig有相机、机械/固态LiDAR、雷达、多个IMU；软件同步并存在待估时差 | 标定配置与传感器记录；不是分割/动作标签集 | 外参、时差、运动激励、投影误差诊断 | 刚性标定rig不是有关节的人形；深度数据应按另外的VECtor等序列选取，不能把所有资源当同一个同步采集包 |

nuScenes的传感器记录和标定关系可先从[官方教程](https://www.nuscenes.org/tutorials/nuscenes_tutorial.html)理解。SemanticKITTI原始标签与任务映射需使用[官方API](https://github.com/PRBonn/semantic-kitti-api)，不要把原始类别数直接当某个评测任务的类别数。ScanNet同一物理房间可能有多次扫描，应按`spaceId`防止相邻扫描泄漏到测试集。[官方组织说明](https://github.com/ScanNet/ScanNet)

## 推荐的最小起步组合

| 学习目标 | 第一项练习 | 可交付验收 |
|---|---|---|
| 融合接口 | 选nuScenes少量场景，投影LiDAR到图像；人为加时间/外参扰动 | 静态边缘错位图、不同速度下误差曲线；姿态只用给定量 |
| 点云语义 | 选SemanticKITTI官方训练/验证划分的子集 | 总体mIoU之外，细杆、边缘、小目标召回；避免跨帧泄漏 |
| 室内几何 | 选ScanNet少量不同房间，以给定位姿构建局部表示 | 台阶/家具边缘误差、悬空结构保留率、深度有效覆盖率 |
| 深度泛化 | NYUv2与DIODE选一个室内、一个室外测试子集 | 相对深度与公制深度分别报告；保留有效掩码与深度范围 |
| IMU与同步 | 按iKalibr官方配置选一套具体序列 | 时间戳/单位审计、外参方向图、注入已知偏移后的误差变化 |

这些是自行设计的学习练习，尚未执行。iKalibr作者明确提示自采相机序列存在运动模糊，相机—IMU入门优先考虑其列出的TUM GS-RS；RGB-D分支不需要SfM初始化。这里只练标定链路，不扩展为SLAM调研。[作者数据说明](https://github.com/Unsigned-Long/iKalibr/blob/master/docs/details/dataset.md)

深度评价需特别声明是否做尺度对齐、使用什么有效区域、是否包含补全值。NYUv2的原始RGB与深度并非天然逐帧同步，官方工具按时间戳对齐；不能用已经处理好的子集证明自己的同步算法有效。[NYUv2数据说明](https://cs.nyu.edu/~fergus/datasets/nyu_depth_v2.html)

## 补齐人形域：小规模自采方案（建议，未执行）

先采静止、缓慢俯仰、转头和摆臂，再采已有控制器下的正常步行。场景至少包含脚边台阶与间隙、胸头高度悬空横杆、薄桌腿、手臂/搬运物自遮挡。将材质、光照、距离、身体运动分开组合，不必一开始覆盖所有排列。采集量按场景覆盖与独立session统计，不用相邻帧数量制造“大数据”印象。

| 字段组 | 建议schema | 要解决的问题 |
|---|---|---|
| 采集身份 | `scene_id, session_id, rig_id, hardware_version, calibration_id` | 同场景重访、安装变化与数据划分可追溯 |
| 原始传感器 | 各RGB/深度帧；LiDAR的XYZ/强度/有效性及可用时的逐点时间；IMU陀螺/加速度；关节位置/速度 | 保留未经补洞与滤波的数据；缺少字段显式写缺失，不伪造 |
| 时间与坐标 | 设备/主机接收时间、时钟域、曝光/扫描定义、单位、`frame_id`、内参/畸变/外参方向 | 分清采集时刻和到达时刻；动态头颈外参由关节链描述 |
| 处理与质量 | 深度尺度、valid mask、是否对齐RGB、滤波版本、丢帧和饱和标记 | 区分原始测量、历史融合、模型补全 |
| 任务标签 | 台阶边缘/高度、间隙、悬空障碍包围区域、机器人自身mask、可见/未知区 | 不把未知当自由，不把几何平面直接当可承重支撑面 |
| 参考与评估 | 人工尺量或独立测量、测量误差、标签审核、可选给定位姿与协方差 | 标记真值来源；不要用待测算法生成自己的“真值” |

建议保留三种标签：几何是否存在、是否被传感器观测、是否满足特定身体的通行条件。第三种依赖脚掌、身体包络与动作，不应和语义类别合并。已知静态外参也不能替代曝光时刻对应的关节链变换。

划分时先按物理场景分训练/验证/测试，再按采集session隔离；同一台阶不同视角、连续视频片段及其增强版本不得随机跨集合。另留出新材质、新安装角和新运动幅度的分布外集合。公开数据遵循其官方划分，自采数据保存不可变的split清单。

## 获取、许可与工程资料

所有数据许可、账号条件、再分发和商业用途需在实际下载前按对应版本核实；开源代码许可不代表数据许可。ScanNet需要官方Terms of Use流程，本次未发送申请；其他资源也仅记录入口，不代表授权已获准。数据存放约定见[DataSet/README.md](DataSet/README.md)。

- [RealSense深度调优指南](https://dev.realsenseai.com/docs/tuning-depth-cameras-for-best-performance/)：先理解纹理、曝光、立体匹配与量程，再调滤波；不要把某型号参数泛化到全部深度相机。
- [RealSense投影与遮挡说明](https://www.realsenseai.com/stereo-depth/occlusion/)：RGB与深度来自不同视点，对齐会带来遮挡边界问题；补洞不等于恢复真实表面。
- [ROS REP 103官方源文档](https://github.com/ros-infrastructure/rep/blob/master/rep-0103.rst)：SI单位、右手系、机体与光学坐标约定。
- [ROS REP 105官方源文档](https://github.com/ros-infrastructure/rep/blob/master/rep-0105.rst)：理解`base_link/odom/map`语义；这里用于接口约定，不要求实现定位后端。

核查范围：官方数据页、数据格式说明与工具仓库；未下载样本验证内容，尤其IMU字段可用性与时序质量仍需在选定具体序列后做数据审计。
