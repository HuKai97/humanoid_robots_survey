# 人形机器人操作：物体 6D 位姿估计调研

面向从传统轮式机器人感知转入人形机器人感知的读者。默认主线是**被操作物体的刚体 6D 位姿**，并解释机器人自身定位、人体姿态和抓取规划的边界。传感器/CAD 条件尚未由用户指定，选型建议均按条件给出。

本库包含 **30 篇代表性工作的独立中文解析**，覆盖经典方法到 2025 年；另有 2026 动向初读。每篇先总结，再介绍输入先验、方法、证据、局限、人形应用推断和学习/复现检查点。核验日期：2026-09-29。

## 从这里开始

1. [问题定义与知识地图](01_问题定义与知识地图.md)：先弄清估计对象、坐标系和方法分类。
2. [方法对比与选型](02_方法对比与选型.md)：按 RGB/RGB-D、CAD/参考图像和时间条件选择。
3. [人形机器人落地要点](03_人形机器人落地要点.md)：标定、同步、遮挡、跟踪与操作接口。
4. [八周学习路线](04_八周学习路线.md)：每周读什么、做什么、产出什么。
5. [近期进展与检索记录](05_近期进展与检索记录.md)：2025–2026 动向、纳入范围和证据边界。
6. [复现计划](../复现/README.md)、[评测协议](../experiment/evaluation.md)、[数据清单](../dataset.md)：准备后续工程验证。

建议第一轮重点理解 PoseCNN、DenseFusion、PVNet、NOCS、GDR-Net、MegaPose、FoundationPose、BOP；关注跟踪时加 ICG/BundleSDF，关注手物交互时加 HOT3D。P0/P1/P2 是学习优先级，不是性能排名。

## 文献索引

点击方法名进入“先总结、后详解”的独立笔记。论文和代码均保留链接；“未确认算法代码”不等于没有项目网页。题录完整信息和输入条件见 [bibliography.json](bibliography.json)，每篇还保留独立 metadata。

| 方法 | 年份 / 会场 | 优先级 | 论文 | 官方实现或工具 |
|---|---|---|---|---|
| [BOP](papers/2018_bop/README.md) | 2018 · ECCV 2018 | P0 | [论文](https://arxiv.org/abs/1808.08319) | [入口](https://github.com/thodan/bop_toolkit) |
| [DeepIM](papers/2018_deepim/README.md) | 2018 · ECCV | P1 | [论文](https://openaccess.thecvf.com/content_ECCV_2018/html/Yi_Li_DeepIM_Deep_Iterative_ECCV_2018_paper.html) | [入口](https://github.com/liyi14/mx-DeepIM) |
| [PoseCNN](papers/2018_posecnn/README.md) | 2018 · RSS | P1 | [论文](https://arxiv.org/abs/1711.00199v3) | [入口](https://github.com/yuxng/PoseCNN) |
| [CDPN](papers/2019_cdpn/README.md) | 2019 · ICCV | P1 | [论文](https://openaccess.thecvf.com/content_ICCV_2019/html/Li_CDPN_Coordinates-Based_Disentangled_Pose_Network_for_Real-Time_RGB-Based_6-DoF_Object_ICCV_2019_paper.html) | [入口](https://github.com/LZGMatrix/CDPN_ICCV2019_ZhigangLi) |
| [DenseFusion](papers/2019_densefusion/README.md) | 2019 · CVPR | P0 | [论文](https://arxiv.org/abs/1901.04780) | [入口](https://github.com/j96w/DenseFusion) |
| [NOCS](papers/2019_nocs/README.md) | 2019 · CVPR 2019 | P0 | [论文](https://arxiv.org/abs/1901.02970) | [入口](https://github.com/hughw19/NOCS_CVPR2019) |
| [PVNet](papers/2019_pvnet/README.md) | 2019 · CVPR | P1 | [论文](https://arxiv.org/abs/1812.11788) | [入口](https://github.com/zju3dv/pvnet) |
| [CASS](papers/2020_cass/README.md) | 2020 · CVPR 2020 | P2 | [论文](https://arxiv.org/abs/2001.09322) | [入口](https://github.com/densechen/CASS) |
| [CosyPose](papers/2020_cosypose/README.md) | 2020 · ECCV | P0 | [论文](https://arxiv.org/abs/2008.08465) | [入口](https://github.com/yannlabb/cosypose) |
| [CAPTRA](papers/2021_captra/README.md) | 2021 · ICCV 2021 | P1 | [论文](https://arxiv.org/abs/2104.03437) | [入口](https://github.com/HalfSummer11/CAPTRA) |
| [DualPoseNet](papers/2021_dualposenet/README.md) | 2021 · ICCV 2021 | P2 | [论文](https://arxiv.org/abs/2103.06526) | [入口](https://github.com/Gorilla-Lab-SCUT/DualPoseNet) |
| [FFB6D](papers/2021_ffb6d/README.md) | 2021 · CVPR | P1 | [论文](https://arxiv.org/abs/2103.02242) | [入口](https://github.com/ethnhe/FFB6D) |
| [FS-Net](papers/2021_fs_net/README.md) | 2021 · CVPR 2021 | P1 | [论文](https://arxiv.org/abs/2103.07054) | [入口](https://github.com/DC1991/FS_Net) |
| [GDR-Net](papers/2021_gdr_net/README.md) | 2021 · CVPR | P0 | [论文](https://arxiv.org/abs/2102.12145v1) | [入口](https://github.com/THU-DA-6D-Pose-Group/GDR-Net) |
| [Gen6D](papers/2022_gen6d/README.md) | 2022 · ECCV 2022 | P1 | [论文](https://arxiv.org/abs/2204.10776) | [入口](https://github.com/liuyuan-pal/Gen6D) |
| [ICG](papers/2022_icg/README.md) | 2022 · CVPR 2022 | P0 | [论文](https://arxiv.org/abs/2203.05334) | [入口](https://github.com/DLR-RM/3DObjectTracking/tree/master/ICG) |
| [MegaPose](papers/2022_megapose/README.md) | 2022 · CoRL 2022; PMLR proceedings published 2023 | P0 | [论文](https://arxiv.org/abs/2212.06870) | [入口](https://github.com/megapose6d/megapose6d) |
| [OnePose](papers/2022_onepose/README.md) | 2022 · CVPR 2022 | P1 | [论文](https://arxiv.org/abs/2205.12257) | [入口](https://github.com/zju3dv/OnePose) |
| [OnePose++](papers/2022_onepose_plus_plus/README.md) | 2022 · NeurIPS 2022; arXiv posted 2023 | P1 | [论文](https://arxiv.org/abs/2301.07673) | [入口](https://github.com/zju3dv/OnePose_Plus_Plus) |
| [BundleSDF](papers/2023_bundlesdf/README.md) | 2023 · CVPR 2023 | P1 | [论文](https://arxiv.org/abs/2303.14158) | [入口](https://github.com/NVlabs/BundleSDF) |
| [GenPose](papers/2023_genpose/README.md) | 2023 · NeurIPS 2023 | P1 | [论文](https://arxiv.org/abs/2306.10531) | [入口](https://github.com/Jiyao06/GenPose) |
| [AG-Pose](papers/2024_ag_pose/README.md) | 2024 · CVPR 2024 | P1 | [论文](https://arxiv.org/abs/2403.19527) | [入口](https://github.com/Leeiieeo/AG-Pose) |
| [FoundationPose](papers/2024_foundationpose/README.md) | 2024 · CVPR 2024 Highlight | P0 | [论文](https://arxiv.org/abs/2312.08344) | [入口](https://github.com/NVlabs/FoundationPose) |
| [FoundPose](papers/2024_foundpose/README.md) | 2024 · ECCV 2024 | P1 | [论文](https://arxiv.org/abs/2311.18809) | [入口](https://github.com/facebookresearch/foundpose) |
| [FreeZe](papers/2024_freeze/README.md) | 2024 · ECCV 2024 | P1 | [论文](https://arxiv.org/abs/2312.00947) | 未确认算法代码，见笔记 |
| [GigaPose](papers/2024_gigapose/README.md) | 2024 · CVPR 2024 | P1 | [论文](https://arxiv.org/abs/2311.14155) | [入口](https://github.com/nv-nguyen/gigapose) |
| [SAM-6D](papers/2024_sam6d/README.md) | 2024 · CVPR 2024 | P0 | [论文](https://arxiv.org/abs/2311.15707) | [入口](https://github.com/JiehongLin/SAM-6D) |
| [6DOPE-GS](papers/2025_6dope_gs/README.md) | 2025 · ICCV 2025（arXiv 初版 2024） | P1 | [论文](https://arxiv.org/abs/2412.01543) | 未确认算法代码，见笔记 |
| [Any6D](papers/2025_any6d/README.md) | 2025 · CVPR 2025 | P1 | [论文](https://arxiv.org/abs/2503.18673) | [入口](https://github.com/taeyeopl/Any6D) |
| [HOT3D](papers/2025_hot3d/README.md) | 2025 · CVPR 2025 | P0 | [论文](https://arxiv.org/abs/2411.19167) | [入口](https://github.com/facebookresearch/hot3d) |

## 本轮完成与未完成

已完成：代表文献一手来源检索、中文初读解析、任务条件对比、学习路线、数据选择和复现/评测规划。部分论文已在线阅读方法正文，部分仅到摘要/架构/README，逐篇明确记录阅读深度。

未执行：论文 PDF/LaTeX 下载、数据和权重下载、环境安装、代码运行、实机验证。论文成绩不当作本项目结果；没有编造可比跑分表。正式选型仍需实际传感器、对象条件和任务预算。

## 与 research-workflow 的对应

采用 [skJack/research-workflow](https://github.com/skJack/research-workflow)（参考提交 `14c882df49a7991b9833f2ff416e4dfd38668827`）的文件职责与“文献 → baseline → 假设 → 实验”节奏。按用户“不下载论文”的要求，将每篇 `paper.pdf + source/` 改为 `README.md + metadata.json` 与原文链接。未执行上游抓论文脚本，未安装全局技能。

项目总纲见 [AGENTS.md](../AGENTS.md)，状态见 [handoff.md](../handoff.md)，后续新增论文可用 [解析模板](templates/论文解析模板.md)。
