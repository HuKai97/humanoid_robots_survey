# 感知运动与强化学习专项检索

日期：2026-09-29。按用户最新范围补充：不做SLAM，主线为RGB/RGB-D/LiDAR与IMU/关节编码器相关本体输入，特别区分RL、模仿学习与教师学生蒸馏。本批选择3篇四足启发和1篇直接人形工作；不是全面覆盖或最新排名。

## 检索与选文

|检索线索|核验后条目|为什么进入本批|学习范式|
|---|---|---|---|
|Learning Vision-Guided Quadrupedal Locomotion Across Challenging Terrain|33 LocoTransformer：Learning Vision-Guided Quadrupedal Locomotion End-to-End with Cross-Modal Transformers|更正不准确候选题名及年份；有明确深度/本体融合与仅单模态、拼接对照|直接端到端PPO；首次2021，ICLR 2022|
|Extreme Parkour depth proprioception RL|34 Extreme Parkour with Legged Robots|用RL特权几何教师，随后蒸馏深度动作及方向|PPO/ROA＋DAgger；2023|
|Robot Parkour Learning soft dynamics constraints|35 Robot Parkour Learning|区分探索课程收益与视觉融合收益，并展示多技能教师到学生|两阶段PPO＋视觉监督蒸馏；2023|
|BeamDojo LiDAR sparse footholds humanoid|36 BeamDojo|G1实体人形，LiDAR高程—本体输入演员，面向脚掌面积的奖励与双评论家|两阶段PPO课程；无必需视觉蒸馏；2025|

## 本轮实际读取的原始入口

- 33：[摘要](https://arxiv.org/abs/2107.03996)、[v3 HTML](https://arxiv.org/html/2107.03996v3)、[作者页](https://rchalyang.github.io/LocoTransformer/)、[官方仓库](https://github.com/Mehooz/vision4leg)。重点读方法、演员/价值共享结构、奖励、附录本体向量与真实机器人设置。
- 34：[摘要](https://arxiv.org/abs/2309.14341)、[v1 HTML](https://arxiv.org/html/2309.14341v1)、[作者页](https://extreme-parkour.github.io/)、[官方训练代码网页](https://github.com/chengxuxin/extreme-parkour/blob/main/legged_gym/legged_gym/envs/base/legged_robot.py)。重点读阶段1/2、特权朝向、深度蒸馏、部署延迟；在线查看`compute_observations`以避免漏记足接触。
- 35：[摘要](https://arxiv.org/abs/2309.05665)、[v1 HTML](https://arxiv.org/html/2309.05665v1)、[作者页](https://robot-parkour.github.io/)、[官方仓库](https://github.com/ZiwenZhuang/parkour)。重点读软硬动力学两阶段、DAgger、CNN—GRU输入和消融。
- 36：[摘要](https://arxiv.org/abs/2502.10363)、[v3 HTML](https://arxiv.org/html/2502.10363v3)、[作者页](https://why618188.github.io/beamdojo/)。重点读高程输入、两组奖励、双评论家、真实LiDAR/IMU管线和限制；作者页未给出可确认的完整代码入口，`code_url`留空。

以上是全文HTML定向阅读，不标记为每个公式逐项复核。没有下载PDF、LaTeX源码、代码仓库或数据，没有运行训练或机器人实验。

## 需要保留的证据边界

1. **传感器和策略输入不同。** 图像通常预处理，IMU提供的姿态/重力方向经过解算，LiDAR先变为高程；奖励中的真实速度/接触/地形不等于部署演员能读取。
2. **不是所有融合策略都由RL直接训练。** 33是直接RL，34/35的重要视觉训练步骤是监督蒸馏，36的两阶段是地形课程而非教师学生。
3. **双评论家不是非对称演员评论家。** 36按回报分组学习两个价值函数；评论家是否比演员多看某些状态，需要另核对完整配置，不能推断。
4. **真实观测可能超出主模态清单。** 34公开训练实现含足接触标志；在未核验硬件来源及部署观测删减前，不能宣传只依赖深度/IMU/编码器。
5. **固定上游，不转向SLAM。** 36原系统依赖FAST-LIO与地形重建；本调研只研究高程/本体怎样服务感知RL及其误差影响，地图接口应固定。
6. **版本须冻结。** 33仓库还包含MMDR；34当前默认分支并未与论文提交固定。公开仓库存在不代表已通过本地复现，也不代表当前训练配置等同论文版本。

## 延伸线索：仅摘要/项目页核验，未新增详细笔记

- [TAGA: Terrain-aware Active Gaze Learning for Generalizable Agile Humanoid Locomotion](https://arxiv.org/abs/2606.05880)：已打开官方摘要页，适合下一轮看主动视角与人形感知运动。未逐项核验奖励、实机观测和消融，因此不进入本批性能比较。
- [RPL: Learning Robust Humanoid Perceptive Locomotion on Challenging Terrains](https://arxiv.org/abs/2602.03002)：已读[作者项目页](https://rpl-humanoid.github.io/)，其路线是地形专家到多深度相机Transformer学生，涉及多视角覆盖、速度条件与侧向遮挡。项目页代码仍标注Coming Soon，未当作可用复现基线。
- [Learning Vision-Based Bipedal Locomotion for Challenging Terrain](https://arxiv.org/abs/2309.14594)：检索到深度历史加本体预测局部高程的双足线索；未详细阅读，保留后续连接四足与人形的候选。

## 配套交付

- `metadata_perceptive_rl.json`：33—36标准元信息及`learning_paradigm`、`rl_role`、`train_observations`、`deploy_observations`。
- `annotations_humanoid_rl.json`：为旧21—28补充同样四个RL字段和范围说明，未改写旧笔记，供总矩阵合并。
- 建议阅读：33先学直接融合RL → 22理解退化模态互补 → 34/35区分教师和视觉学生 → 36看LiDAR人形奖励与课程 → 27/28看直接人形视觉全身交互与历史检索。
