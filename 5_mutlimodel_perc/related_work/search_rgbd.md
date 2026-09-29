# RGB-D 融合补充检索记录

核验日：2026-09-29。范围：补齐 29–32 点云/RGB–LiDAR 阅读之外的 RGB-D 外观与几何特征融合基础。仅浏览网页，不下载论文 PDF、LaTeX、代码、数据或权重。

## 检索方式与来源

本次是已知论文的定向核验，没有执行泛化搜索查询。入口题名为“DenseFusion: 6D Object Pose Estimation by Iterative Dense Fusion”，按摘要、项目、官方仓库和 HTML 方法依次核验。

| 定向打开的原始来源 | 核验用途与结果 |
|---|---|
| [arXiv 1901.04780](https://arxiv.org/abs/1901.04780) | 首次公开 2019-01-15、作者、已知物体 RGB-D 6D 位姿任务；摘要不是开放世界识别声明。 |
| [论文 HTML v1](https://arxiv.org/html/1901.04780v1) | 重点读第 3 节融合、置信度、监督损失、迭代修正；第 4 节视觉基准和共享分割掩码；附录 6.2 核实机器人是 Toyota HSR 移动操作平台。 |
| [作者项目页](https://sites.google.com/view/densefusion) | 对照方法总述、作者与代码入口；未把视频当作定量证据。 |
| [作者官方仓库](https://github.com/j96w/DenseFusion) | CVPR 2019、公开训练/评估与权重入口、分割前端可替换、训练阶段、未包含真实抓取 ROS 代码；未运行下载脚本。 |

另尝试打开 [CVF 论文条目](https://openaccess.thecvf.com/content_CVPR_2019/html/Wang_DenseFusion_6D_Object_Pose_Estimation_by_Iterative_Dense_Fusion_CVPR_2019_paper.html)，浏览工具返回 Internal Error；未以该次失败页面作为新增证据。

## 关键辨析与覆盖边界

- PointNet 风格几何编码，不是 PointNet++ 原架构；RGB 与深度点云按对应位置融合，不等同于两个全局向量拼接。
- 分割是依赖项，部署读取估计掩码；已知对象位姿监督依赖对象模型与真值变换，不能推广成无需对象知识的开放世界方案。
- 置信度无需单独人工标注，但整体仍依赖位姿监督；迭代 refinement 不是强化学习。
- HSR 是移动操作机器人，名称含 Human Support 不构成人形实验。仅作为可迁移 RGB-D 感知方法收录。
- 对称物体的等价几何评价不必然满足下游操作朝向约束；遮挡鲁棒性实验不意味着完全遮挡也可可靠识别。
- 笔记包含学习练习和接入 RL 的设想，均未执行；没有新增实测结果。
