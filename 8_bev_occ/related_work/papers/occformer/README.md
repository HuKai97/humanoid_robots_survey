# OccFormer：把三维编码拆成局部与全局路径

## 一分钟总结

**定位：学习 occupancy 编码器与解码器如何针对三维稀疏性设计。** OccFormer 在由图像生成的三维特征上使用双路径 Transformer：局部路径保留水平切片细节，全局路径汇集更大范围上下文；再将 Mask2Former 的 mask 分类思想改造到三维。它既讲如何编码三维，也讲如何避免小类在训练与下采样中消失。[ICCV 原始页](https://openaccess.thecvf.com/content/ICCV2023/html/Zhang_OccFormer_Dual-path_Transformer_for_Vision-based_3D_Semantic_Occupancy_Prediction_ICCV_2023_paper.html)

## 论文与证据

- **标题**：OccFormer: Dual-path Transformer for Vision-based 3D Semantic Occupancy Prediction；Yunpeng Zhang、Zheng Zhu、Dalong Du；ICCV 2023。[arXiv](https://arxiv.org/abs/2304.05316)
- **官方代码**：[zhangyp15/OccFormer](https://github.com/zhangyp15/OccFormer)。已核验官方 README 和代码入口，未执行。
- **实际阅读级别**：论文 HTML 方法段，特别是 preserve-pooling 与 class-guided sampling；会议摘要及官方 README。实验数字未全部复核，未下载论文。核验日期：2026-09-29。

## 输入输出与方法步骤

输入为相机图像和几何参数，首先得到三维体积特征，然后输出语义占据。模型把较昂贵的三维处理分解成水平切片上的局部注意力和全局上下文路径，再融合两者。解码器采用基于查询的 mask 分类：查询预测一组体素的掩码及其语义类别，而非只对每个体素独立分类。[方法 §3](https://arxiv.org/html/2304.05316)

两个适配很值得单独理解：**preserve-pooling** 用 max-pooling 下采样注意力 mask，降低稀疏物体在下采样中消失的风险；**class-guided sampling** 按训练类别频率调整采样，缓解空体素和常见类主导训练的问题。[原文 §3.3.3–3.3.4](https://arxiv.org/html/2304.05316#S3)

## 关键概念解释

**局部/全局** 描述特征交互范围，不是机器人 local map/global map 的存储层级。**Mask classification** 把一组体素的归属与类别统一预测，有利于结构化分割，但输出仍受体素分辨率和监督标签约束。**类别重采样** 改变模型看到的训练分布；它能提高小类学习机会，却不直接给出碰撞风险优先级。

本论文在 SemanticKITTI 做 SSC，在 nuScenes 包括 LiDAR 点位置的语义评价。后者是对视觉预测在点位置上采样后的评估，不应自动改写成“在完整 nuScenes 稠密体素真值上取得相同结果”。需要按照论文和仓库具体任务配置区分。[会议摘要](https://openaccess.thecvf.com/content/ICCV2023/html/Zhang_OccFormer_Dual-path_Transformer_for_Vision-based_3D_Semantic_Occupancy_Prediction_ICCV_2023_paper.html)

## 实验应看什么

优先读双路径、preserve-pooling 与采样策略的消融。比较三维卷积和 Transformer 时要控制主干、输入分辨率、深度监督和数据增强。学习者最容易误读的是：总 mIoU 提高就认为障碍可靠性全面提高；实际应看少数类、细结构以及几何 IoU 是否同步改善。

建议增加可视化：显示进入 decoder 前的小物体 mask、下采样后的 attention mask 和最终预测。如果桌腿在中间层已经丢失，调高最终分类置信度并不能恢复它。效率应统计图像到三维提升、双路径编码和 mask 解码各部分开销。

## 局限与人形迁移分析（本调研推断）

人形近距离安全关键物体的风险并不等于语义类频率。细线缆、透明隔挡、门槛可能既罕见又难标注，单纯类别重采样不足以解决；可以考虑按几何尺度、身体碰撞区域和观测置信度分层评价。preserve-pooling 的思想有借鉴意义，但必须检查它是否也保留了深度噪声产生的伪小障碍。

双路径围绕水平空间的设计需要明确重力方向。如果直接使用随头部滚转的坐标系，网络的水平结构假设会漂移；迁移时可在重力对齐局部坐标定义网格，再按时刻投影各相机。语义预测输出还应外接状态融合及 ESDF/碰撞查询模块，不能把网络中“全局路径”误当成可长期维护的全局地图。

## 阅读与复现检查点

- 用一张图标注每一级三维特征的空间 shape，并解释两条路径如何共享/恢复高度信息。
- 在 SemanticKITTI 与 nuScenes 配置之间逐项检查标签、监督位置和有效 mask。
- 分开测试 max-pooling 对真实细结构与噪声的影响，记录类别采样超参数。
- 官方实现基于已有视觉检测/分割框架；复现前核对其版本组合及自定义算子，本轮未验证安装兼容性。[代码说明](https://github.com/zhangyp15/OccFormer)
- 与 [SurroundOcc](../surroundocc/README.md) 比较编码策略，与 [SparseOcc](../sparseocc/README.md) 比较是否真正避免稠密体积计算。
