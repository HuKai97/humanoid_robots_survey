# 人形机器人多传感器感知：阅读入口

已整理 **28篇重点工作**，聚焦你指定的 **视觉、LiDAR、深度相机、IMU**。不研究SLAM；只把外部姿态/短时运动作为感知接口，局部高程和三维表示用于描述周围环境。

每篇独立保存在 `papers/<首次公开年>_<方法>/README.md`：**先总结，再讲问题、输入输出、方法、监督、实验边界、局限、岗位迁移、学习练习和自测**。只保存笔记和链接，没有下载论文、源码、模型或数据，也没有运行算法实验。

## 建议这样开始

1. [调研总览](00_调研总览.md)：你已有经验怎么迁移，需要补什么。
2. [八周学习路线与先读十篇](02_学习路线.md)：按顺序读，不必一次读完28篇。
3. [传感器工程指南](03_传感器工程指南.md)：坐标、时钟、IMU、深度尺度、运动补偿和自遮挡。
4. [论文矩阵](01_论文矩阵.md)：比较输入、平台、用途、优先级和一手来源。
5. [近期人形工作](05_近期工作跟踪.md)：DPL、RPL、CReF和LiDAR细结构研究的证据边界。

## 分类数量

| 方向 | 篇数 | 代表入口 |
|---|---:|---|
| 标定、同步与IMU | 3 | [Kalibr](papers/2013_kalibr/README.md)、[iKalibr](papers/2024_ikalibr/README.md) |
| 深度、视觉与物体几何 | 8 | [FoundationStereo](papers/2025_foundationstereo/README.md)、[Metric3Dv2](papers/2024_metric3d_v2/README.md) |
| 相机/LiDAR融合与三维语义 | 7 | [PointPainting](papers/2019_pointpainting/README.md)、[BEVFusion](papers/2022_bevfusion_mit/README.md) |
| 局部环境表示 | 2 | [GPU高程](papers/2022_elevation_mapping_gpu/README.md)、[MEM](papers/2023_mem/README.md) |
| 足式/人形感知接口 | 6 | [DPL](papers/2025_dpl/README.md)、[RPL](papers/2026_rpl/README.md)、[CReF](papers/2026_cref/README.md) |
| 感知到操作扩展 | 2 | [DP3](papers/2024_dp3/README.md)、[GR00T N1](papers/2025_gr00t_n1/README.md) |

车载、四足、机械臂与人形的验证平台在各篇明确区分。BEVFormer/BEVDepth属于视觉BEV，不等于运行时相机—LiDAR融合；高程图也不能代替全身三维障碍表达。

## 后续工作入口

- [数据资源与自采schema](../dataset.md)
- [复现计划](../复现/README.md)与[统一测评草案](../experiment/evaluation.md)
- [个人阅读进度](READING_LOG.md)与[新增论文模板](论文解析模板.md)
- [机器可读目录](catalog.json)；四个 `*_manifest.json` 是分类来源清单，路径均相对本目录
- [检索与证据说明](04_检索与证据说明.md)、[进度交接](../handoff.md)

组织依据：[skJack/research-workflow](https://github.com/skJack/research-workflow)。核查日期2026-09-29；本资料是有取舍的入门调研，不是穷尽文献综述。未读到的原文、未核实的代码与近期预印本的限制均显式记录。
