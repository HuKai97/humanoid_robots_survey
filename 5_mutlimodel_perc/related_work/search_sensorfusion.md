# RGB—LiDAR 与点云基础补充检索记录

核验日期：2026-09-29。依据本轮范围修订，主线是 RGB、RGB-D、LiDAR、IMU、关节编码器及与 RL 的结合；本分支补齐点云编码和 RGB—LiDAR 传感器融合。四篇均不是直接 RL 工作，也均没有直接人形机器人验证，作为方法基础保留，不把自动驾驶结果写成人形能力。未下载 PDF、论文源码、代码仓库、模型或数据，未运行实验。

## 实际查询与访问

| 实际查询 | 筛选用途 |
|---|---|
| `PointNet++ Deep Hierarchical Feature Learning on Point Sets in a Metric Space arxiv official` | 确认题名、2017首发、作者项目及官方实现。 |
| `PointPainting Sequential Fusion for 3D Object Detection arxiv official` | 确认2019首发与CVPR 2020，进一步检查HTML方法、监督与流水处理。 |
| `TransFusion Robust LiDAR-Camera Fusion for 3D Object Detection with Transformers arxiv official` | 定位2203.11496与XuyangBai官方仓库，检查训练和权重发布范围。 |
| `BEVFusion Multi-Task Multi-Sensor Fusion with Unified Bird Eye View Representation Liu MIT arxiv github` | 明确选择Liu等MIT版本2205.13542，排除同名论文混淆。 |
| `PointPainting Sourabh Vora official code github` | 结果包含多个第三方复现，未核实原作者完整官方仓库，metadata code_url留空。 |

直接访问摘要、作者页面及HTML，不以聚合站/社区总结作事实依据。搜索自动返回的PDF条目没有主动下载或作为本轮全文阅读入口。

## 原始证据及深度

| 论文 | 来源 | 本轮阅读范围 |
|---|---|---|
| 29 PointNet++ | [摘要](https://arxiv.org/abs/1706.02413)、[HTML v1](https://arxiv.org/html/1706.02413v1)、[Stanford作者页](https://stanford.edu/~rqi/pointnet2/)、[官方代码](https://github.com/charlesq34/pointnet2) | 第3节分层采样/分组/传播和第4节部分实验；确认ScanNet实验去除RGB，不能称RGB-D融合。未精读全部附录。 |
| 30 PointPainting | [摘要](https://arxiv.org/abs/1911.10150)、[HTML v2](https://arxiv.org/html/1911.10150v2)、[CVPR官方条目](https://openaccess.thecvf.com/content_CVPR_2020/html/Vora_PointPainting_Sequential_Fusion_for_3D_Object_Detection_CVPR_2020_paper.html) | 第2节输入输出与三阶段架构、第3节分割监督来源、第5节语义质量和时序消融；CVF直接打开曾返回内部错误，但官方条目搜索索引可核验题名、作者与会议。 |
| 31 TransFusion | [摘要](https://arxiv.org/abs/2203.11496)、[HTML v1](https://arxiv.org/html/2203.11496v1)、[官方仓库](https://github.com/XuyangBai/TransFusion) | 第3—5节和附录训练设置片段；最初尝试HTML v2失败，摘要显示仅v1，改用v1成功。确认柔性关联仍使用标定、分阶段监督训练、TransFusion-L独立变体、作者不发布预训练模型。 |
| 32 MIT BEVFusion | [摘要](https://arxiv.org/abs/2205.13542)、[HTML v3](https://arxiv.org/html/2205.13542v3)、[MIT项目](https://hanlab.mit.edu/projects/bevfusion)、[官方仓库](https://github.com/mit-han-lab/bevfusion) | 第III节统一表示、视图变换、融合、多任务头与第IV节部分实验；核验2022首发、ICRA 2023和仓库归档状态；阅读v3不能把修订年当首发年。 |

## 关键校正与后续复现约束

1. **四篇都不是RL。** 分类标签、像素标签、三维框和区域标签与环境奖励不同；分阶段监督训练不等于教师学生RL，注意力也不是策略。笔记单独写了可迁移到RL的设想，并标为未验证。
2. **四篇都没有原生IMU/编码器联合融合。** 在人形上用IMU/关节角更新坐标或提供策略本体状态，是未来系统设计；不能回写到原作者结果。
3. **点云来源与网络模态分开。** 由RGB-D获得的点云若未输入颜色，不构成RGB与深度融合；相机分支预测深度也不等于使用RGB-D传感器。
4. **方法排序用于理解。** PointNet++学习点集几何；PointPainting学习点级语义增强；TransFusion学习对象查询关联；MIT BEVFusion学习共同空间特征融合。不是四篇性能排名。
5. **代码可用性分级。** PointPainting尚未核实原作者完整实现；TransFusion官方有代码和配置但不发布预训练权重；MIT BEVFusion有检查点但仓库已归档；PointNet++有较旧框架和自定义算子。均未在本地验证可运行。
6. **不做SLAM。** 本分支只关注点云/图像编码、检测和局部环境表示；BEV区域分割并非轨迹估计或长期地图维护。相机标定、时间对齐仍是融合必要基础。
7. **人形迁移先看条件。** 重点核查头部关节引起的外参变化、身体振动、近距离自遮挡、稀疏足底边缘、物体尺度和传感延迟，分别报告感知与下游策略指标。

所有建议的小练习、RL接口与扰动评估均为计划，当前没有任何复现实验结果。
