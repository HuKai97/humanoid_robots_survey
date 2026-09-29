# 阶段 2 · 视觉指令微调浪潮（2023）

> 2023 年 GPT-4 发布后，社区用"指令微调"把 LLM 的对话能力复制到多模态：**用 GPT-4 合成图文对话数据 + 简单投影层 + 端到端微调**，催生了开源 VLM 爆发的第一波。

### 1. GPT-4 / GPT-4V · 《GPT-4 Technical Report》+ GPT-4V(ision) System Card
- **出处**：arXiv `2303.08774`（GPT-4 技术报告）· OpenAI；GPT-4V 系统卡见 [GPTV_System_Card.pdf](https://cdn.openai.com/papers/GPTV_System_Card.pdf)
- **一句话**：闭源多模态标杆。GPT-4 首次展示强大的图文推理；GPT-4V（2023-09）将视觉能力开放，定义了"多模态 LLM 应该什么样"。
- **方法**：未公开细节；已知是端到端多模态 Transformer，具备 OCR、细粒度定位、图表/文档理解、GUI 操作能力。
- **关键结论**：多模态能力随规模自然涌现；视觉指令跟随、图文交错推理成为行业目标线。
- **局限**：闭源、不可复现、幻觉问题存在；系统卡明确警示其空间定位等能力不可靠。
- **对本方向的启示**：整个开源生态（LLaVA-1.5 "逼近 GPT-4V"、InternVL 1.5 "closing the gap"）都把它当对标线；VLN 社区也把它当零样本规划器（NavGPT、DiscussNav）。

### 2. LLaVA · 《Visual Instruction Tuning》
- **出处**：arXiv `2304.08485` · NeurIPS 2023 (Oral) · UW-Madison / Microsoft
- **一句话**：用 GPT-4 把 COCO 图像转成 15.8 万条多轮图文对话，简单线性投影 + 端到端微调，开源 VLM 的开山之作。
- **方法**：CLIP-ViT-L 视觉塔 + 线性投影层 + Vicuna LLM；**数据先行**：GPT-4 合成三种指令数据（对话/细节描述/复杂推理）；两阶段训练（先对齐投影层，再联合微调）。
- **关键结论**：仅 158K 指令数据即获得 GPT-4 约 85% 的对话质量（GPT-4 打分）；ScienceQA 上 92.53%（当时 SOTA）。
- **局限**：合成数据噪声大、视觉编码器分辨率低（224²），后续被 LLaVA-1.5 全面取代。
- **对本方向的启示**：**数据工程 > 架构**的开端；"用强模型合成指令数据"成为所有后续工作（含 VLN 的指令生成）的标准配方。

### 3. MiniGPT-4 · 《MiniGPT-4: Enhancing Vision-Language Understanding with Advanced Large Language Models》
- **出处**：arXiv `2304.10592` · KAUST
- **一句话**：Q-Former + 单层投影把视觉接进冻结的 Vicuna，只用一张 3090 训出可用的多模态对话模型。
- **方法**：BLIP-2 的 Q-Former 视觉编码 + 可训练单线性层 + 冻结 Vicuna；两阶段：先大规模对齐（图文对），再用**精挑的小数据集**（约 3500 条高质量样本）微调第二层。
- **关键结论**：小数据高质量微调即可解锁多模态对话，显著降低复现门槛。
- **局限**：幻觉明显、视觉细节能力弱；作为研究原型价值大于生产价值。
- **对本方向的启示**：证明"冻结 LLM + 少量对齐数据"路线可行，对 VLN 这种预算有限的方向有直接参考意义。

### 4. mPLUG-Owl · 《mPLUG-Owl: Modularization Empowers Large Language Models with Multimodality》
- **出处**：arXiv `2304.14178` · DAMO Academy
- **一句话**：模块化两阶段训练：先训视觉抽象模块（视觉特征重参数化），再用 LoRA 微调 LLM，兼顾效果与成本。
- **方法**：视觉抽象器压缩 token + LoRA 训练 LLM 的多模态能力 + 指令微调（含观察-思考-行动类数据）；支持图文对话。
- **关键结论**：模块化让视觉编码器与 LLM 可独立升级/替换；LoRA 大幅降低训练成本。
- **局限**：第一代模型 OCR 与细粒度定位弱。
- **对本方向的启示**："视觉 token 压缩"是 VLM 核心工程问题之一，VLN 视频流（Navid）同样需要这个能力。

### 5. InstructBLIP · 《InstructBLIP: Towards General-purpose Vision-Language Models with Instruction Tuning》
- **出处**：arXiv `2305.06500` · ICLR 2024 · Salesforce
- **一句话**：Q-Former 以指令为条件提取视觉特征，在 26 个数据集上做视觉指令微调，零样本泛化能力强。
- **方法**：指令感知 Q-Former（instruction-aware visual feature extraction）；26 个数据集（13 类任务）构建指令微调混合；平衡不同任务的采样。
- **关键结论**：零样本泛化全面超越 BLIP-2；数据混合（任务多样性）对指令微调效果影响巨大。
- **局限**：多数据集混合的"污染"问题难界定；训练工程复杂。
- **对本方向的启示**：指令感知的视觉特征提取 → VLN 中"按指令提取导航相关视觉信息"的思想来源之一。

### 6. LLaVA-1.5 · 《Improved Baselines with Visual Instruction Tuning》
- **出处**：arXiv `2310.03744` · UW-Madison / Microsoft
- **一句话**：只用学术数据集 + 一个 MLP 投影层，就在十多个 benchmark 上刷到开源 SOTA，成为社区默认 baseline。
- **方法**：CLIP-ViT-L@336 + 双层 MLP 连接器 + Vicuna-7B/13B；**数据配方**：120 万条学术数据（VQA、OCR、区域级描述、对话混合）；简单回复格式（"是的/不"）提升多项任务。
- **关键结论**：架构极简却超越多数复杂设计；证明此前开源模型的差距主要来自**数据与分辨率**而非架构。
- **局限**：与 GPT-4V 在复杂推理、细粒度定位上仍有明显差距。
- **对本方向的启示**：本调研最重要的方法论样本——**先做好数据与评测，再谈架构**。VLN 社区的 LLaVA-1.5 骨干极其常见（Navid、NaVILA 等）。

### 7. LLaVA-NeXT（LLaVA-1.6）· 官方技术博客
- **出处**：2024-01 · 官方博客 [LLaVA-NeXT 博客](https://llava-vl.github.io/blog/2024-01-30-llava-next/)（无独立 arXiv 论文）
- **一句话**：动态高分辨率（anyres）+ 更高质量数据，针对性补齐 OCR、推理与世界知识短板。
- **方法**：把高分辨率图像按网格切片 + 全局缩略图拼成多图输入（anyres）；引入高质量文档/图表/OCR 数据 + 更丰富的任务格式。
- **关键结论**：分辨率与数据质量的针对性提升带来能力阶跃，OCR 能力大幅增强。
- **对本方向的启示**：动态分辨率成为后续主流（Qwen2-VL 原生动态分辨率、MiniCPM-V 切片编码）；对 VLN 的细粒度视觉理解（读门牌、看小物体）有直接价值。

### 8. LLaVA-OneVision · 《LLaVA-OneVision: Easy Visual Task Transfer》
- **出处**：arXiv `2408.03326` · 2024
- **一句话**：单图、多图、视频统一在一个模型与训练流程里，实现视觉任务的"简单迁移"。
- **方法**：统一视觉表示（anyres 单图 + 多图 + 视频帧序列）；大规模混合数据（单图/多图/视频）+ 从单图能力逐步扩展的多阶段训练。
- **关键结论**：一个模型覆盖三种模态输入，跨模态迁移能力显著；开源权重成为众多具身/导航工作的骨架。
- **局限**：训练数据规模大、训练流程复杂，独立复现成本高。
- **对本方向的启示**：视频统一建模 → 直接对接 VLN 的连续帧观测输入（Navid、NaVILA 的思路同源）。

### 阶段小结
- 数据侧：**GPT-4 合成指令（LLaVA）→ 学术数据混合（LLaVA-1.5）→ 高质量文档/OCR 数据（LLaVA-NeXT）**。
- 架构侧：投影层（LLaVA）vs 指令感知 Q-Former（InstructBLIP）并存，最终简单投影成为主流。
- 对 VLN 的意义：这一波提供了开箱即用的 VLM 骨干与"指令数据配方"，是 2024 年 VLN 转向 LLM/VLM 的前提。
