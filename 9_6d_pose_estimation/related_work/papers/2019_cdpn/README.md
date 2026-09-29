# CDPN（ICCV 2019）

## 速读总结

**旋转与平移可以使用不同的估计路径。** CDPN 用预测的二维—三维对应关系求旋转，同时直接估计平移，是理解后续 GDR-Net 的重要前置工作。[CVF 论文页](https://openaccess.thecvf.com/content_ICCV_2019/html/Li_CDPN_Coordinates-Based_Disentangled_Pose_Network_for_Real-Time_RGB-Based_6-DoF_Object_ICCV_2019_paper.html)

学习优先级：**P1**。重点学问题分解、物体坐标图和裁剪后的尺度恢复。

## 基本信息与证据范围

- 题目：*CDPN: Coordinates-Based Disentangled Pose Network for Real-Time RGB-Based 6-DoF Object Pose Estimation*。
- Zhigang Li、Gu Wang、Xiangyang Ji；ICCV 2019。
- 一手来源：[CVF 论文页](https://openaccess.thecvf.com/content_ICCV_2019/html/Li_CDPN_Coordinates-Based_Disentangled_Pose_Network_for_Real-Time_RGB-Based_6-DoF_Object_ICCV_2019_paper.html)、[官方训练代码](https://github.com/LZGMatrix/CDPN_ICCV2019_ZhigangLi)、[官方 BOP 实现](https://github.com/LZGMatrix/BOP19_CDPN_2019ICCV)。
- 证据深度：CVF 摘要、检索返回的论文 §3 方法文字、官方 README。没有完整通读正文与补充材料；未下载论文、未运行代码。

## 任务边界、输入输出与先验

输入为 RGB、检测区域和内参；对象模型及目标身份已知。输出模型坐标系到相机的姿态。官方训练说明使用真实图像、渲染图像和三维模型，并提供分阶段训练入口。[官方代码](https://github.com/LZGMatrix/CDPN_ICCV2019_ZhigangLi)

## 方法步骤与关键表示

1. 检测后裁剪目标。Dynamic Zoom In 在训练中扰动区域位置与尺度，增强对框误差的容忍。
2. 预测稠密对象坐标及置信信息，构造像素—模型点对应，用 RANSAC/PnP 获得旋转。
3. 独立分支估计尺度归一化的平移参数，再恢复实际平移。[CVF 方法来源](https://openaccess.thecvf.com/content_ICCV_2019/papers/Li_CDPN_Coordinates-Based_Disentangled_Pose_Network_for_Real-Time_RGB-Based_6-DoF_Object_ICCV_2019_paper.pdf)

上面链接供读者在线查阅，本项目未保存 PDF。具体参数公式和实现分支应在后续精读时再次核对。

**我们的解释：** “对象坐标图”给像素标记它对应模型上的哪个表面点，不是深度图。前者在物体系表达，后者描述相机到可见表面的距离。稠密对应随后满足投影关系 `u ∼ K(RX+t)`；但网络会预测带误差的 `X`，因此几何求解的稳定性取决于这些对应是否可信。

再考虑裁剪：远处小物体和近处大物体都缩放到相同输入尺寸后，网络不能仅靠裁剪图判断原始尺度。必须保留框大小、裁剪变换和内参。这个信息流是部署中容易丢失、却直接影响平移的部分。

**建议的小练习：** 对同一三维点先在完整图像投影，再使用裁剪变换映射到网络输入；同时直接用变换后的内参投影，两种结果应一致。用这个无需训练的小检查，可以提前发现裁剪原点、缩放顺序或填充边界处理中的错误。

## 实验结论与可信范围

作者在 LINEMOD 和遮挡版本上报告 RGB 方法的改进。[CVF 论文页](https://openaccess.thecvf.com/content_ICCV_2019/html/Li_CDPN_Coordinates-Based_Disentangled_Pose_Network_for_Real-Time_RGB-Based_6-DoF_Object_ICCV_2019_paper.html) 未逐表核验，本笔记不引用具体分数；仓库的不同训练阶段、CDPNv2 和 BOP 配置也不能当成同一结果。

## 优点、局限与人形机器人启示

**我们的分析：** 分开处理旋转和平移，使损失与误差来源更容易讨论；稠密对应也便于可视化。代价是检测、坐标预测和求解仍组成多环节系统，对称性可能使坐标标签不唯一。模型尺度错了，即使图像投影看似合理，绝对平移也可能错。

**工程推断，非论文人形验证：** 对头部纯 RGB 相机，可先做“不同距离与框扰动”的定量测试。对于拿工具、对准插孔等任务，应另测毫米级位置及轴向误差，不能只看较宽松的物体平均距离阈值。由远及近的操作过程中，检测框稳定性也应与最终位姿一起记录。

## 阅读与复现检查点

- 对同一图像改变框大小、位置和缩放，观察恢复后的位姿是否一致。
- 对物体坐标图着色，并与真值渲染图比较。
- 分别检查旋转、光轴深度和图像平面位置，不只报告一个总分。
- 官方训练代码存在三个阶段，复现时记录所用阶段与 checkpoint；先补读公式和补充材料，再决定如何简化训练。[官方代码](https://github.com/LZGMatrix/CDPN_ICCV2019_ZhigangLi)
