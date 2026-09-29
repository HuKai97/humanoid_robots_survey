# GaussianFormer：用可变形高斯分配三维表示资源

## 一分钟总结

**定位：理解 3D OCC 从固定网格走向稀疏连续基元。** GaussianFormer 用一组带位置、尺度/朝向和语义的三维高斯表示场景，从图像更新这些高斯，再把邻域高斯贡献聚合为体素占据。它不是普通新视角合成 3DGS 的简单改名，也不是自动获得可碰撞查询的精确机器人地图。[原始论文](https://arxiv.org/abs/2405.17429)

## 论文与证据

- **标题**：GaussianFormer: Scene as Gaussians for Vision-Based 3D Semantic Occupancy Prediction；Yuanhui Huang、Wenzhao Zheng、Yunpeng Zhang、Jie Zhou、Jiwen Lu；ECCV 2024。[ECCV 官方论文列表](https://eccv.ecva.net/virtual/2024/papers.html)
- **官方代码**：[huang-yh/GaussianFormer](https://github.com/huang-yh/GaussianFormer)。已核验仓库包含原版、只建模占据区域的后续更新，以及 GaussianFormer-2；本轮未下载或运行。
- **实际阅读级别**：原论文 HTML §3 表示与模块、局限段；官方 README 和会议目录。没有把后续版本实现混作原论文。核验日期：2026-09-29。

## 输入输出与方法步骤

输入为图像及相机参数；内部表示是一组高斯属性及其可学习查询；输出仍可转为稠密三维语义体素。网络交替进行高斯间的信息交互、向图像查询特征、属性细化。最终 Gaussian-to-voxel splatting 只聚合查询位置附近的高斯，减少无关区域计算。[原文 §3](https://arxiv.org/html/2405.17429#S3)

其“object-centric”强调资源跟随区域与结构分配，不能理解成每个高斯恰好对应一个物体实例。相比传统 3DGS，论文是从输入图像前向预测语义占据表示，不是为某一场景长时间优化颜色渲染模型。[原文与 3DGS 区别](https://arxiv.org/html/2405.17429)

## 关键概念解释

**均值**控制高斯中心；**协方差**控制覆盖空间的尺度与朝向，能够适应长条、平面等不同局部结构；**语义属性**用于聚合后判定类别。高斯在数学上有空间影响范围，但对物理障碍而言仍需定义如何阈值化、如何生成边界以及如何处理多个高斯重叠。

重要区别是：高斯函数形状不等于经过校准的障碍概率。原版语义与空类的处理还存在冗余，作者局限段明确讨论需要较多高斯的问题；后来 GaussianFormer-2 专门修改为概率叠加与初始化，不能将这些改进倒写入 ECCV 2024 原版。[原版局限](https://arxiv.org/html/2405.17429)、[GaussianFormer-2 CVPR 2025](https://openaccess.thecvf.com/content/CVPR2025/html/Huang_GaussianFormer-2_Probabilistic_Gaussian_Superposition_for_Efficient_3D_Occupancy_Prediction_CVPR_2025_paper.html)

## 实验应看什么

重点看高斯数量与精度/显存的关系，比较 nuScenes 环视及 KITTI-360 单目设置。不能只看显存减少百分比：需要固定主干、输出范围、分辨率、稀疏算子版本和硬件；还要把高斯转成规划所需表示的成本计入延迟。官方仓库分支和配置已发展，复现必须记录 commit 与具体配置。[官方版本与配置入口](https://github.com/huang-yh/GaussianFormer)

自己的对比建议观察同样预算下细杆和大平面如何分配高斯、物体之间是否被连续覆盖形成假桥、空隙边缘是否膨胀。可视化既画高斯，也画最终体素；只有一种图不足以定位误差。

## 局限与人形迁移分析（本调研推断）

高斯自适应表示可能适合有限算力下的近距离三维环境，但连续光滑基元也可能抹平台阶尖锐边缘与细薄结构。对手部工作区和足边地形，应以表面距离误差、碰撞召回和间隙保真度评价，不只看语义 mIoU。

若下游仍要求栅格或 ESDF，应评估转换开销与信息损失；若直接查询高斯，还需另行设计有意义的碰撞阈值和保守边界。它不是长期维护地图的现成替代：跨帧高斯关联、动态物体更新、位姿漂移和未知区域管理仍需系统层处理。预测高斯的位置误差也不能被形状参数自动当作不确定性吸收。

## 阅读与复现检查点

- 用一张图说明高斯属性、query feature 与最后体素 logits 的关系。
- 分开原版、solid 更新、GaussianFormer-2 的配置，报告自己实际运行哪一个。
- 先用小场景检查 Gaussian-to-voxel 边界和坐标单位，再扩展候选数量。
- 评价同时包含峰值内存、完整推理延迟、薄障碍召回和碰撞查询耗时。
- 下一步可读 GaussianFormer-2，但进入工程前先与稠密 [SurroundOcc](../surroundocc/README.md) 和 [SparseOcc](../sparseocc/README.md) 建立同协议基线。
