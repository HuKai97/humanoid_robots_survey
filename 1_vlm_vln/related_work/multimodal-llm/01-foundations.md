# 阶段 1 · 基础：视觉编码器与图文对齐范式（2020–2023）

> 本阶段的成果决定了后面所有 VLM 的"原材料"：视觉编码器（ViT/CLIP）与把视觉接进语言模型的对齐范式（Perceiver/Q-Former/投影）。

### 1. ViT · 《An Image is Worth 16x16 Words: Transformers for Image Recognition at Scale》
- **出处**：arXiv `2010.11929` · ICLR 2021 · Google Brain
- **一句话**：把图像切成 16×16 的 patch 当 token，纯 Transformer 干掉卷积，确立了视觉 Transformer 范式。
- **方法**：Patch embedding + 位置编码 + 标准 Transformer encoder；在 ImageNet-21k / JFT-300M 大数据预训练后迁移，才能超过 CNN。
- **关键结论**：大数据 + 大模型下 ViT 超越 ResNet；自注意力天然适合建模全局关系，且可以无缝与文本 token 拼接。
- **局限**：需要海量数据才收敛；无语言语义，只能做视觉任务。
- **对本方向的启示**：几乎所有 VLM 的视觉塔都是 ViT 变体（CLIP-ViT、SigLIP 等）；VLN 的视觉编码也普遍使用 ViT。

### 2. CLIP · 《Learning Transferable Visual Models From Natural Language Supervision》
- **出处**：arXiv `2103.00020` · ICML 2021 · OpenAI
- **一句话**：用 4 亿图文对做对比学习，让图像和文本共享语义空间，实现零样本视觉分类与检索。
- **方法**：双塔（ViT/ResNet 视觉塔 + Transformer 文本塔）+ 对比损失（N×N 图文对匹配）；预训练后用 prompt 即可做任何分类任务。
- **关键结论**：零样本能力在 30+ 数据集上接近甚至超越有监督 ResNet-50；prompt 工程对效果影响显著。
- **局限**：对比学习只学"匹配"不学"生成"；对细粒度理解（空间关系、计数、OCR）弱。
- **对本方向的启示**：CLIP-ViT 是 LLaVA/InternVL 等的视觉塔初始化来源；CLIP 的"弱视觉理解"正是后续 VLM 和 VLN 要补的短板。

### 3. Flamingo · 《Flamingo: a Visual Language Model for Few-Shot Learning》
- **出处**：arXiv `2204.14198` · NeurIPS 2022 · DeepMind
- **一句话**：冻结视觉编码器和冻结 70B 语言模型，仅训练少量"胶水"模块，得到 few-shot 极强（对话式）的多模态模型。
- **方法**：Perceiver Resampler 把可变长视觉特征压缩成固定 token 数；在 LLM 每层插入门控交叉注意力（gated x-attn dense）；图文交错数据预训练。
- **关键结论**：仅训练约 1/4 参数量即可在 few-shot 图文任务上大幅超越当时的专用模型；交错图文支持对话。
- **局限**：训练流程复杂（Resampler + 多层交叉注意力），开源复现难度大；生成能力弱于后来的 LLaVA 系。
- **对本方向的启示**：模块化冻结路线代表（与 BLIP-2 呼应）；"把可变长视觉压缩为固定 token"的思想被 Q-Former、Navid 的视频流处理沿用。

### 4. BLIP · 《BLIP: Bootstrapping Language-Image Pre-training for Unified Vision-Language Understanding and Generation》
- **出处**：arXiv `2201.12086` · ICML 2022 · Salesforce
- **一句话**：统一理解与生成的多任务框架，并用 CapFilt 自举清洗网络图文数据。
- **方法**：MED 结构（图像-文本对比 ITC / 图文匹配 ITM / 语言建模 LM 三任务联合）；CapFilt：BLIP 生成 caption + 过滤器去噪 web 数据，再回炉训练。
- **关键结论**：数据自举显著提升图文检索与生成；说明**训练数据质量**是多模态效果的隐形主导变量。
- **局限**：仍是"预训练模型"，不具备指令跟随对话能力。
- **对本方向的启示**：CapFilt 是"用模型清洗/合成数据"的经典范式，与 LLaVA 用 GPT-4 合成指令、SpatialVLM 用 VLM 合成空间 QA 一脉相承。

### 5. BLIP-2 · 《BLIP-2: Bootstrapping Language-Image Pre-training with Frozen Image Encoders and Large Language Models》
- **出处**：arXiv `2301.12597` · ICML 2023 · Salesforce
- **一句话**：用 Q-Former 把冻结的视觉编码器与冻结的 LLM 桥接起来，只训练桥接层，是"低成本多模态化 LLM"的范式之作。
- **方法**：Q-Former（可学习 query token 交叉注意力提取视觉信息，压缩为 32 个 token）；两阶段训练——先视觉-语言表示学习（冻结 LLM），再视觉-语言生成学习。
- **关键结论**：冻结双方只训 Q-Former，参数量极小却能在 VQA、图文生成上超越更大模型；对 LLM 无侵入，可替换。
- **局限**：Q-Former 训练收敛不易；理解深度受限于冻结 LLM 的既有能力。
- **对本方向的启示**：算力不足时把 VLN 观测/指令接进 LLM 的低成本路线；Navid、MapGPT 等导航工作的 VLM 骨干多为此类冻结/轻训结构。

### 阶段小结
| 范式 | 代表 | 视觉→语言接口 | 冻结策略 |
|---|---|---|---|
| 对比学习 | CLIP | 共享空间（无生成） | 双方全训 |
| 重采样器 | Flamingo | Perceiver Resampler + 门控交叉注意力 | 冻结双方，训胶水层 |
| 可学习查询 | BLIP-2 | Q-Former（32 query token） | 冻结双方，训 Q-Former |
