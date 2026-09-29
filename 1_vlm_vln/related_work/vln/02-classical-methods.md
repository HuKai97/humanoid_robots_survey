# VLN 经典方法（2018–2023）

> 第一代（注意力 + RL + 数据增广）与第二代（Transformer 记忆 + 拓扑图）。这些方法的"零件"（全景动作空间、环境 dropout、拓扑图）至今仍在 VLM 时代的方法中被复用。

### 1. Seq2Seq · 《Vision-and-Language Navigation: ...》（R2R baseline）
- **出处**：arXiv `1711.07280` · CVPR 2018
- **一句话**：R2R 自带 baseline：注意力编码器-解码器，动作 = 全景视角选择。
- **方法**：LSTM 编码指令；解码时对全景 36 视角做视觉注意力，输出下一个导航点。
- **关键结论**：人类在 val-unseen 上远高于模型（人 ≈ 86% vs 模型 ≈ 20% 级），早期模型主要败在泛化。
- **对本方向的启示**：读懂 baseline 就理解了 VLN 的最小闭环（指令理解 → 视觉选择 → 动作）。

### 2. Speaker-Follower · 《Speaker-Follower Models for Vision-and-Language Navigation》
- **出处**：arXiv `1806.02724` · NeurIPS 2018
- **一句话**：合成新指令解决数据稀缺：Speaker 从路径反生成指令，Follower 执行。
- **方法**：Speaker-Follower 双模型；全景动作空间（36 视角）而不是 3D 坐标动作；用 Speaker 在未标注路径上自动生成大量指令训练 Follower。
- **关键结论**：数据增广带来当时最大幅度的 SR 提升，成为经典配方。
- **对本方向的启示**：**用模型合成训练数据**是 VLN 的第一性工具（后续 PREVALENT、EnvDrop、NavRAG 一脉相承）。

### 3. RCM · 《Reinforced Cross-Modal Matching and Self-Supervised Imitation Learning for Vision-and-Language Navigation》
- **出处**：arXiv `1811.10092` · CVPR 2019 (Oral)
- **一句话**：把"走"与"听"对齐：跨模态匹配奖励 + 自监督模仿，用强化学习训练。
- **方法**：跨模态 grounding 奖励（轨迹与指令的匹配度）；模仿 Speaker 生成数据做自监督；RL（A2C）+ 模仿联合。
- **关键结论**：强化学习 + grounding 奖励显著提升泛化；Oral 级别的经典方法。
- **对本方向的启示**：奖励设计是 VLN 的长期课题——LLM 时代变成了"LLM 打分/反思"（NavGPT 反思、NavCoT 自训练）。

### 4. EnvDrop · 《Learning to Navigate Unseen Environments: Back Translation with Environmental Dropout》
- **出处**：arXiv `1904.04195` · NAACL 2019
- **一句话**：两个朴实有效的技巧：回译（path→instr→path）+ 环境 dropout（随机屏蔽视觉特征），大幅提升新环境泛化。
- **方法**：back-translation 用未标注路径扩数据；environmental dropout 在模仿学习时概率性地丢弃视觉输入，强迫模型多依赖语言。
- **关键结论**：envdrop 简单却通用，被后续多数方法沿用为标配组件。
- **对本方向的启示**：**防止视觉过拟合**（只盯画面不听话）——这个坑在 VLM 导航时代依然存在。

### 5. PREVALENT · 《Towards Learning a Generic Agent for Vision-and-Language Navigation via Pre-training》
- **出处**：arXiv `2002.10638` · CVPR 2020
- **一句话**：VLN 的 BERT 时刻：环境无关的大规模预训练 + 下游微调，统一了那几年的方法范式。
- **方法**：图文指令-动作轨迹预训练（masked language/vision + 动作预测 + 指令-路径匹配）；预训练数据含合成指令与路径。
- **关键结论**：预训练模型迁移到 R2R/R4R 等任务普遍提点，"先预训练再微调"成为 VLN 标配。
- **对本方向的启示**：VLN 的"预训练-微调"范式在 LLM 时代演变为"通用 VLM 预训练 + 导航微调"（Navid、NaVILA 即此逻辑）。

### 6. RecBERT · 《A Recurrent Vision-and-Language BERT for Navigation》
- **出处**：arXiv `2011.13922` · NAACL 2021
- **一句话**：把导航轨迹当句子：单流 BERT 编码指令+动作+视觉序列，加时间倒序增广。
- **方法**：transformer 建模轨迹序列；time-reversed 轨迹增广；单流（跨模态同流）融合。
- **关键结论**：单流序列建模 + 增广在当时 R2R 取得前列成绩。
- **对本方向的启示**："轨迹即序列"的表示被 HAMT、以及后来的视频流方法（Navid）放大沿用。

### 7. Airbert · 《Airbert: In-domain Pretraining for Vision-and-Language Navigation》
- **出处**：arXiv `2108.09105` · ICCV 2021
- **一句话**：域内判别式预训练（in-domain discriminative pretraining），在室内 R2R 与室外数据上判别图像-文本匹配。
- **方法**：跨模态匹配判别预训练（类似 CLIP 但在导航域内）；室内室外联合。
- **关键结论**：域内对比/匹配预训练对导航任务提点明显，优于通用图文预训练。
- **对本方向的启示**：**通用预训练 ≠ 域内预训练**的早期证据；如今对应"通用 VLM vs 导航微调"的张力。

### 8. HAMT · 《History Aware Multimodal Transformer for Vision-and-Language Navigation》
- **出处**：arXiv `2110.13309` · NeurIPS 2021
- **一句话**：历史感知：把整条历史轨迹分层记忆，让决策不再只看当前画面。
- **方法**：层次历史编码（全轨迹 / 片段 / 单步三层记忆）+ 多模态 Transformer；历史信息参与动作决策。
- **关键结论**：记忆机制在长程导航上提点显著；长期记忆成为后续标配。
- **对本方向的启示**：VLN 的历史依赖本质——LLM 时代的上下文窗口天然适合做长记忆（NavGPT、MC-GPT 直接受益）。

### 9. DUET · 《Think Global, Act Local: Dual-scale Graph Transformer for Vision-and-Language Navigation》
- **出处**：arXiv `2202.11742` · ECCV 2022
- **一句话**：双尺度拓扑图（细粒度局部图 + 粗粒度全局图）分离"看路"与"规划"，实现长程高效导航。
- **方法**：从观测增量构建局部图与全局图；全局规划（粗）+ 局部执行（细）；图 Transformer 融合。
- **关键结论**：长程任务（R4R/RxR）上大幅领先；粗-细解耦成为构图类方法的模板。
- **对本方向的启示**：拓扑图路线代表（与 ETPNav、MapGPT 同宗）；"在线建图"思想被 MapGPT 等 LLM 方法继承。

### 10. LANA · 《LANA: A Language-Capable Navigator for Instruction Following and Generation》
- **出处**：arXiv `2303.08409` · CVPR 2023
- **一句话**：动作空间随指令自适应生成：不是"选一个固定候选"，而是按指令"生成"导航动作。
- **方法**：语言驱动的动作生成（基于指令动态合成动作候选）；理解与生成双向（还能反写路径描述）；跨数据集训练。
- **关键结论**：R2R/RxR 多项 SOTA；"按需生成动作"比"从固定候选里挑"表达力更强。
- **对本方向的启示**：动作空间的设计哲学（离散选择 vs 生成）在 VLM 时代被 NaVILA 的"动作 token"重新演绎。

### 11. ETPNav · 《ETPNav: Evolving Topological Planning for Vision-and-Language Navigation in Continuous Environments》
- **出处**：arXiv `2304.03047` · ICLR 2024
- **一句话**：面向 VLN-CE：自组织演进的拓扑图 + 跨尺度规划 + 自校正，连续环境导航的代表性框架。
- **方法**：在线构建可演进的拓扑图（节点=waypoint 候选）；图上做分层规划（全局路线 + 局部执行）；路径失败时自我校正（回退重规划）。
- **关键结论**：在 R2R 与 R2R-CE 上均取得当时 SOTA，首次把 VLN-CE 的 SR 拉到与离散可比的新高度。
- **对本方向的启示**：拓扑图 + 自校正的完整范式；其"规划与执行循环"被 LLM 时代方法（MC-GPT、MapGPT）显式化。

### 12. LAW · 《Language-Aligned Waypoint (LAW) Supervision for Vision-and-Language Navigation in Continuous Environments》
- **出处**：arXiv `2109.15207` · EMNLP 2021
- **一句话**：VLN-CE 早期的关键数据方法：用最短路径做语言对齐的 waypoint 监督，缓解连续环境的稀疏监督问题。
- **方法**：在连续环境中沿最短路径定义语言对齐的 waypoint 监督信号，用于训练定位与导航模块。
- **关键结论**：语言对齐监督显著提升连续环境 SR，成为 VLN-CE 的数据标配之一。
- **对本方向的启示**：连续环境"监督从哪来"是核心工程问题——VLM 时代靠"合成数据 + 通用骨干"部分缓解。

### 经典方法小结：被 VLM 时代继承的五个零件
1. 全景动作空间 / 候选选择（Speaker-Follower → 候选动作列表喂给 LLM）
2. 环境 dropout / 防视觉过拟合（EnvDrop）
3. 预训练-微调（PREVALENT → 通用 VLM 微调）
4. 历史记忆（HAMT → LLM 上下文窗口）
5. 拓扑图与在线建图（DUET、ETPNav → MapGPT、MC-GPT）
