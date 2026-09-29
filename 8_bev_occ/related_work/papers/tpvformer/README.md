# TPVFormer：从一个 BEV 平面走向三维占据

## 论文与证据

- **标题**：Tri-Perspective View for Vision-Based 3D Semantic Occupancy Prediction。
- **作者 / 年份**：Yuanhui Huang、Wenzhao Zheng、Yunpeng Zhang、Jie Zhou、Jiwen Lu；CVPR 2023。
- **主来源**：[CVF 正式页面](https://openaccess.thecvf.com/content/CVPR2023/html/Huang_Tri-Perspective_View_for_Vision-Based_3D_Semantic_Occupancy_Prediction_CVPR_2023_paper.html)、[arXiv 记录](https://arxiv.org/abs/2302.07817)、[正文 HTML](https://arxiv.org/html/2302.07817)。
- **官方代码**：[wzzheng/TPVFormer](https://github.com/wzzheng/TPVFormer)，CVF 页面直接链接；已核验 README 与任务说明，未下载或运行。
- **阅读证据级别**：会议摘要、HTML 表示与注意力关键段、评价设置、官方 README；初读解析，未下载 PDF、源码、权重或数据。核验日期：2026-09-29。

## 一分钟总结

BEV 只显式索引水平位置，TPV 增加两个相互垂直的侧面特征平面。查询一个三维位置时，从三个平面分别取特征并组合，得到随高度变化的表示。这是一座理解“BEV 为什么不够、完整体素为什么昂贵、三平面如何折中”的重要桥梁。[CVF 摘要](https://openaccess.thecvf.com/content/CVPR2023/html/Huang_Tri-Perspective_View_for_Vision-Based_3D_Semantic_Occupancy_Prediction_CVPR_2023_paper.html)

## 任务、输入和输出

推理输入为相机图像，表示支持对三维位置进行语义查询并形成体素预测。原始研究包含稀疏 LiDAR 语义监督下的预测探索，以及 nuScenes 点分割和 SemanticKITTI 语义场景补全设置；各设置的监督与评测域必须分开看。[正文引言和 §4](https://arxiv.org/html/2302.07817)

## 方法拆解

1. 维护俯视、侧视、正视三个带通道的二维特征平面。
2. 以图像交叉注意力为各平面引入多相机特征，再让平面之间交互。
3. 对任意三维查询点，在三个投影位置插值取特征并相加，再预测语义。
4. 表示存储从稠密体素的三维乘积，变为三个二维面积之和。[正文 §3](https://arxiv.org/html/2302.07817)

以桌子为例，桌面下方和桌面上方共享相同俯视坐标，但在两个竖直平面的查询位置不同，因此能得到不同特征。这不意味着三平面和完整体素的表达能力完全等价；压缩表示仍要求参数共享，也不保证任意微小结构都能恢复。提高查询分辨率只是更密地读同一表示，并不会凭空增加传感器提供的信息。

## 最重要的实验口径

**不要把稀疏点分割成绩称作稠密占据成绩。** 论文对“稀疏训练、所有体素测试”的原始占据设置主要展示定性结果；量化代理包括 nuScenes 稀疏点上的语义分割，以及 SemanticKITTI 稠密监督和评测的 SSC。只有在实际量测点上表现好，无法证明不可见空间和所有空体素都正确。[正文引言、§4](https://arxiv.org/html/2302.07817)

官方仓库给出不同任务的配置与独立评测入口，并提示可改用后续稠密标签。复现时必须记录使用哪套监督，不能将后续修改过的 dense occupancy 配置与原始 sparse-supervision 论文设置合并叙述。[仓库任务说明](https://github.com/wzzheng/TPVFormer)

## 局限与对人形机器人的迁移价值（分析）

三平面特别值得用于思考人形机器人常见的高度关系：桌面、椅子、楼梯、门框与悬空障碍都不是单层二维占据足以表达的。但原始道路数据并不构成人形机器人实验证据。近场细结构要求更精细的空间与图像分辨率，模型可能需要从大范围粗网格改成局部细网格或分层范围。

另一个关键问题是未知空间。稀疏监督不为每个体素提供可靠标签；只在点上训练后对所有体素解码，容易让读者把平滑外观误认作几何证据。工程上应另设可观测性与未知状态，评估桌面下方、遮挡背面及相机盲区的错误占据和错误清空。

TPV 省的是内部特征表示；如果最终要为整个空间生成稠密高分辨率标签，解码与输出成本仍随查询点数量增加。可以按导航走廊、候选脚步或手臂扫掠区按需查询，这是人形平台的潜在优化方向，需和整图预测比较实际收益。

## 阅读与复现检查点

- 画出同一水平坐标、不同高度的两点在三个平面的投影；确认它们为何能被区分。
- 分别预算平面特征内存、三维查询解码内存、输出标签内存。
- 在日志中明确监督是稀疏点还是稠密体素，评估是否含 empty 类，哪些体素被 mask。
- 对照“可见区域、遮挡区域、未知区域”分组，别只保留整体语义 mIoU。
- 前置读 [BEVFormer](../bevformer/README.md) 的空间 query；后续与稠密监督 OCC 工作比较数据制作与评测协议。
