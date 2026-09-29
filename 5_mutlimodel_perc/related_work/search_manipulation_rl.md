# 视觉/点云与本体感知结合 RL 的操作分支检索

日期：2026-09-29。遵循更新范围：不以 SLAM 为研究目标，重点 RGB-D/点云与关节等本体信息；不扩展触觉、音频主线。本轮只浏览官方网页、arXiv 摘要/HTML和作者仓库说明，未下载 PDF、LaTeX、代码、数据或模型。

## 选择结果

| ID | 工作 | 为什么纳入 | RL 的实际位置 |
|---|---|---|---|
| 37 | TRANSIC，2024 | 跨仿真/真实、不同观测与动作空间的迁移，点云+关节/末端状态 | PPO训练特权教师；视觉学生和真实纠正残差是IL |
| 38 | RialTo，2024 | 真实场景数字孪生用于增强操作鲁棒性 | PPO+BC在特权状态空间；点云学生通过蒸馏得到 |
| 39 | DexPoint，2022首次公开 | 点云+本体直接RL，合成手部几何是清晰的融合实例 | 直接PPO；奖励访问仿真接触真值，部署不用触觉 |
| 40 | DP3，2024 | 共同点云/本体输入的非RL对照 | 纯IL；RL只可能是仿真示范专家的训练方式 |

只纳入一篇纯IL对照。DexPoint满足直接多源RL需求，因此没有用单视觉 DrQ-v2 替代；PerAct未另加，避免语言条件和纯IL对照挤占本轮范围。

## 查询与原始证据

1. 查询 `TRANSIC sim-to-real policy transfer corrective imitation point cloud reinforcement learning 2024`。核验[摘要](https://arxiv.org/abs/2405.10315)、[v1 HTML](https://arxiv.org/html/2405.10315v1)、[项目](https://transic-robot.github.io/)、[作者仓库](https://github.com/transic-robot/transic)。重点读 §3、附录 A.3/A.4/B.2/B.4，确认教师特权状态、学生本体字段、点云预处理、动作空间蒸馏和门控残差监督。网站含后续展示，笔记方法以 v1 为准，不跨版本拼结果。
2. 查询 `RialTo real-to-sim-to-real robust policies reinforcement learning point cloud 2024`。核验[摘要](https://arxiv.org/abs/2403.03949)、[v1 HTML](https://arxiv.org/html/2403.03949v1)、[项目](https://real-to-sim-to-real.github.io/RialTo/)、[仓库](https://github.com/real-to-sim-to-real/RialToPolicyLearning)。重点读 §III 与 IX/X，确认逆向蒸馏含义、PPO+BC、稀疏成功奖励、点云编码后拼接本体状态。不同版本/项目的任务数量不一致，故不转录综合数字。
3. 查询 `point cloud proprioception reinforcement learning manipulation` 找到 DexPoint。核验[PMLR](https://proceedings.mlr.press/v205/qin23a.html)、[HTML](https://arxiv.org/html/2211.09423)、[项目](https://yzqin.github.io/dexpoint/)、[官方仓库](https://github.com/yzqin/dexpoint-release)。原项目旧代码URL重定向至 release 仓库。确认首次2022、CoRL 2022、PMLR 2023；不能混淆。观察到作者把输入叫四类，但本库将目标条件与模型生成点明确区分于原始传感器模态。
4. 查询 `3D Diffusion Policy DP3 simple point cloud robot learning arxiv 2024 official`。核验[摘要](https://arxiv.org/abs/2403.03954)、[v1 HTML](https://arxiv.org/html/2403.03954v1)、[项目](https://3d-diffusion-policy.github.io/)、[仓库](https://github.com/YanjieZe/3D-Diffusion-Policy)。重点读方法、仿真专家来源、真实遥操作及checkpoint评测规则。v1与后续摘要的综合改善数字不同，不拼接。仅RL专家提供数据不代表学生DP3在做RL。

## 重要边界和检索不足

- 四篇均非全身人形直接证据，也没有联合实测 RGB、LiDAR、IMU和关节编码器全部模态。主要覆盖深度派生点云与本体操作；不能把点云都写成LiDAR。
- RialTo 用场景重建创建仿真资产，不意味着用户需转做 SLAM；离线扫描并非本轮核心研究输出。
- TRANSIC/RialTo 的点云学生并非直接奖励训练，分析“RL怎样结合感知”时必须保留蒸馏层。DexPoint actor/critic接收同类特征，不因奖励可读真值就冒称非对称演员评论家。
- 尚未逐表复核各论文全部数值、GPU预算及当前依赖兼容性；已在笔记明确不作复现成功或资源保证。
- 真实和仿真数据预算、可见物体比例、标定误差、测试物体/场景划分需要在未来实验前固定。本轮四篇采用不同任务和预算，不作跨论文成功率排名。
- 发现[后续 iDP3](https://arxiv.org/abs/2410.10803)有全尺寸人形操作主张，但其结果不属于原版DP3；本轮未增加第二篇纯IL核心笔记。
