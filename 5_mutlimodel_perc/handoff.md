# 进度交接

最后更新：2026-09-29。当前用户目标已完成为可继续维护的首轮调研库。

## 用户最终范围

不做SLAM。研究RGB、RGB-D、LiDAR、IMU、关节编码器相关多模态感知，并专门学习其与强化学习的联系。不下载论文PDF或LaTeX，结果留在本工作区。

## 已完成

41篇先总结后详解的中文笔记：17篇核心/必要基线、12篇基础与系统补充、9篇其他方向拓展、3篇排除的SLAM/里程计归档。统一分类见related_work/papers.json。DenseFusion补RGB-D对应融合，PointPainting/TransFusion/BEVFusion补RGB-LiDAR，LocoTransformer/BeamDojo/DexPoint等补感知RL，TRANSIC/RialTo等注明教师蒸馏，DP3为纯IL对照。

领域地图、10周学习路线、强化学习专题、核心比较、逐篇来源与代码状态、术语、检索记录、书目、复现方案、数据/仿真候选和测评设计均已按最新范围重写。交叉审查及结构核验记录见related_work/validation.md。

## 没有做的事

没有下载论文/源码/数据/模型，没有安装或运行论文仓库，没有训练或机器人实验。结果登记为空是有意保留真实状态。部分条目仅摘要/官方说明，部分全文HTML定向阅读，不声称41篇全部逐页精读。未确定硬件、算力、投稿或期限。

## 下一步

先读related_work/README.md、02_学习路线.md和08_强化学习与多模态感知.md。按研究兴趣和可用资源，从深度+本体的模拟运动、点云+本体操作RL、RGB-D/RGB-LiDAR监督融合三条线选一条。先跑原始或教学baseline，核对传感器来源与特权信息，冻结experiment/evaluation.md中的具体任务及预算，再追加真实结果。

不要重新把SLAM作为主线；BeamDojo等上游依赖保留为固定接口，不是本课题研究目标。旧触觉/音频/语言材料仅作拓展。追加文献时同步更新统一元数据、索引与书目。
