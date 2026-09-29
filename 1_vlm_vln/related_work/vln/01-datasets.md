# VLN 数据集与基准（2018–2021）

> 所有方法都跑在这些 benchmark 上。指标定义见 `README.md`，此处补充数据细节与各自解决的问题。

### 1. R2R · 《Vision-and-Language Navigation: Interpreting visually-grounded navigation instructions in real environments》
- **出处**：arXiv `1711.07280` · CVPR 2018 · Georgia Tech 等
- **一句话**：VLN 的开山 benchmark，基于 Matterport3D 真实室内扫描，定义任务、数据划分与全部核心指标。
- **数据**：90 栋房子的 3D 扫描构建导航图；7,189 条最短路径、约 21.5K 条英文指令（训练 14K / val-seen / val-unseen / test）；全景（36 视角 RGB-D）离散动作空间。
- **关键设计**：val-unseen（未见过的新房子）是核心评测维度；同时给出 Seq2Seq baseline（注意力编码器-解码器）。
- **对本方向的启示**：读 R2R = 读 VLN 的"语言说明书"；后续所有 benchmark 都是对它的变体（更长、更口语、目标物化）。

### 2. R4R · 《Stay on the Path: Instruction Fidelity in Vision-and-Language Navigation》
- **出处**：arXiv `1905.12255` · CVPR 2019
- **一句话**：把多条 R2R 最短路径拼接成更长路径，要求智能体"按指令走"，解决最短路径导致指令过短、任务过简的问题。
- **数据**：训练集约 23 万条拼接指令，路径长度显著增加。
- **关键设计**：覆盖度指标（CLS/nDTW）衡量对指令的忠实度，而非只看终点。
- **对本方向的启示**：提醒研究者"到达"之外还要"听指令"，SPL/nDTW 的组合评测由此固化。

### 3. CVDN · 《Vision-and-Dialog Navigation》
- **出处**：arXiv `1907.04957` · CoRL 2019 · USC
- **一句话**：导航 + 多轮对话：导航者可以向 Oracle 提问，考察主动交互能力。
- **数据**：2,050 段人-人导航对话，Oracle 提供"下一步去哪"的真值监督。
- **关键设计**：目标进度（goal progress）指标衡量对话中的逐步逼近。
- **对本方向的启示**：VLN 与对话系统的交叉；主动提问/求助是真实导航的必要能力，LLM 时代重新变得重要。

### 4. REVERIE · 《REVERIE: Remote Embodied Visual Referring Expression in Real Indoor Environments》
- **出处**：arXiv `1904.10151` · CVPR 2020
- **一句话**：把终点从"位置"升级为"物体"——听远程指代（"客厅沙发上的遥控器"）找到具体物体。
- **数据**：约 21.7K 条远程指代指令，目标为 4,140 个物体实例；评测含实例定位（成功率 RGS / 定位成功率 RGSPL）。
- **对本方向的启示**：目标物体导航（ObjectNav）的基准来源；"物体级理解 + 导航"至今是 VLM 具身应用的热点。

### 5. RxR · 《Room-Across-Room: Multilingual Vision-and-Language Navigation with Dense Spatiotemporal Grounding》
- **出处**：arXiv `2010.07954` · ECCV 2020 · Google
- **一句话**：多语言（英/印地/泰卢固语）+ 更长、更"口语化"的指令 + 每个词的时间戳 grounding 监督。
- **数据**：1.6 万余条指令，平均路径更长、指令更绕（带路式描述）。
- **关键设计**：nDTW 作为主要指标（强调路径忠实度）。
- **对本方向的启示**：多语言 + 细粒度 grounding 的评测框架；2024 年的 VLM 方法（如 VLN-Copilot 类）开始转战 RxR 的难分布。

### 6. SOON · 《SOON: Scenario Oriented Object Navigation with Graph-based Exploration》
- **出处**：arXiv `2103.17138` · CVPR 2021
- **一句话**：对象为中心、按"场景图"组织指令，强化对目标物体的逐步定位要求。
- **数据**：指令按场景层次（房间 → 家具 → 物体）组织；评测强调物体 grounding。
- **对本方向的启示**：指令结构化 + 目标 grounding；场景图表示后被 LLM 时代的规划（MapGPT 等）以在线地图形式继承。

### 7. VLN-CE / R2R-CE · 《Waypoint Models for Instruction-guided Navigation in Continuous Environments》
- **出处**：arXiv `2110.02207` · ICCV 2021 · Intel Labs
- **一句话**：把 R2R 指令搬到**连续环境**（Habitat 模拟器），智能体不再是"图上跳点"，而要预测 waypoint 并真实移动。
- **数据**：R2R 指令 + Habitat 连续空间（Matterport3D/Gibson 场景重建）；动作 = 朝向 + 距离（waypoint 预测）。
- **关键设计**：与离散 R2R 的直接可比性；暴露低层控制难题（碰撞、定位误差）；指标同 R2R（SR/SPL/nDTW）。
- **对本方向的启示**：**当前 VLN 主战场**。离散指标到顶后，社区整体转向 VLN-CE；"waypoint 预测 + 低层控制器"成为标配架构，也是真实机器人迁移的中间态。

### 8. HM3D · 《Habitat-Matterport 3D Dataset (HM3D): 1000 Large-scale 3D Environments for Embodied AI》
- **出处**：arXiv `2109.08238` · 2021 · Matterport / FAIR
- **一句话**：1000 个高质量室内 3D 扫描环境，为具身 AI（含 VLN-CE）提供规模化的通用环境库。
- **数据**：1000 个场景、语义标注、Habitat 仿真支持；比 Matterport3D 更全、更多样。
- **对本方向的启示**：现代 VLN-CE 训练/评测的默认环境底座之一；环境多样性是泛化的关键变量。

### 数据层小结
| 演进维度 | 代表工作 |
|---|---|
| 任务难度（更长/更口语） | R4R、RxR |
| 目标形式（物体/对话） | REVERIE、CVDN、SOON |
| 环境形式（离散 → 连续） | VLN-CE、HM3D |
| 语言形式（多语言） | RxR |
