# 扩展阅读：下一轮补哪些问题

以下候选没有单独完整解析，不计入37篇。已经核验题名/主来源的条目只作方向指引，阅读证据主要为摘要和项目说明。

| 工作 | 为什么值得后续读 | 本轮边界与主来源 |
|---|---|---|
| GaussianFormer-2 | 原版之后的概率高斯叠加与效率 | CVPR2025，OCC线已核验正式页；[会议入口](https://openaccess.thecvf.com/content/CVPR2025/html/Huang_GaussianFormer-2_Probabilistic_Gaussian_Superposition_for_Efficient_3D_Occupancy_Prediction_CVPR_2025_paper.html)，根复查偶发403 |
| OccAny | 任意相机配置和域外泛化 | CVPR2026，摘要级；[作者项目](https://valeoai.github.io/OccAny/)，不可据此宣称人形近场已解决 |
| OccNeRF | 与SelfOcc对比弱/自监督三维语义 | [原始记录](https://arxiv.org/abs/2312.09243)，版本标题和代码见search_occupancy；没有全文对比 |
| SparseOcc（Tang） | 与本库Liu版消歧，另一稀疏表示路线 | CVPR2024，[原始记录](https://arxiv.org/abs/2404.09502)、[官方](https://github.com/VISION-SJTU/SparseOcc) |
| BEVPoolv2 | 了解BEV提升/聚合的实现瓶颈 | [2022原始记录](https://arxiv.org/abs/2211.17111)，摘要级；不是当前硬件上的速度承诺 |
| OccNet / OpenOcc | 占用与规划接口、flow及射线评价协议 | [官方仓库](https://github.com/OpenDriveLab/OccNet)，当前默认分支含challenge，原方法和挑战版本须分开 |

## 尚未逐项核验的检索方向

BEVDet4D、BEVStereo、MatrixVT 用于时序深度与部署延伸；DETR3D/PETR 用于三维查询对照；开放词汇占用可沿 OpenScene、OpenOccupancy 的语义扩展、语言场景图等引用继续找，但本轮不把未核验条目包装成推荐实现。

人形全身运动与操作控制文献范围很大。本轮聚焦它们的感知接口，尚未系统覆盖接触规划、全身控制、视觉运动策略、触觉表征、可微碰撞或 deformable-object 建模。需要这些任务时应另建专题，不把VLA或控制论文一股脑计入BEV/OCC数量。

## 后续更新的方法

优先补会改变当前决策的证据：实际人形采集与闭环任务、近场细结构评测、真实位姿误差、开源权重与延迟记录。每新增论文先确认它解决什么问题，填写 [逐篇模板](templates/paper_note.md)，再更新索引和交接。
