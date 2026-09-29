# 阶段 3 · 规模化与工程化（2023–2025）

> 2024 年的竞争焦点：更强的视觉编码器、任意分辨率、更长的多模态上下文、以及**"到底什么决定能力"的认知**（Cambrian-1 给出关键答案）。

### 1. Qwen-VL / Qwen2-VL / Qwen2.5-VL 系列 · 《Qwen-VL》/《Qwen2-VL》/《Qwen2.5-VL Technical Report》
- **出处**：arXiv `2308.12966`（Qwen-VL）· `2409.12191`（Qwen2-VL）· `2502.13923`（Qwen2.5-VL）· Alibaba
- **一句话**：从"能定位的开源商业级 VLM"（Qwen-VL）到"任意分辨率 + 视频 + 文档 + GUI Agent"（Qwen2.5-VL）的三代演进，是目前开源最完整的 VLM 家族。
- **方法**：
  - Qwen-VL：定位编码器（bounding box 文本化，支持指代与定位）、双语数据、三阶段训练；
  - Qwen2-VL：**NaViT 式原生动态分辨率**（不切图，patch 级变长处理）+ 时间维度视频建模；
  - Qwen2.5-VL：动态分辨率 + 超长文档解析（页级文本/布局理解）+ 视觉 Agent（GUI 操作）能力。
- **关键结论**：动态分辨率与长上下文是 VLM 能力的两个主要杠杆；开源自述多项 benchmark 达到或超越 GPT-4o 级别。
- **局限**：模型规模大、部署门槛高；定位与 agent 能力在真实场景仍需适配。
- **对本方向的启示**：动态分辨率 + GUI/Agent 能力使其成为具身导航的常用规划骨干；VLN 中"看图找路"与 GUI 操作在方法上有可迁移性。

### 2. InternVL 系列 · 《InternVL》/《InternVL 1.5》/《InternVL 2.5》
- **出处**：arXiv `2312.14238`（InternVL）· `2404.16821`（InternVL 1.5：How Far Are We to GPT-4V?）· `2412.05271`（InternVL 2.5）· 上海 AI Lab / 清华等
- **一句话**：把 CLIP 的视觉塔放大到 60 亿参数（InternViT-6B），证明**视觉编码器规模**是 VLM 能力的关键变量，1.5 版本在开源侧逼近 GPT-4V。
- **方法**：InternViT-6B（CLIP 对比预训练 + 生成对齐）+ QLLaMA；像素重排（pixel shuffle）压缩视觉 token 数；大规模图文/OCR/文档/多图数据。
- **关键结论**：视觉编码器从 3 亿参数级提到 60 亿参数级带来显著能力跃升；1.5 在 OCR、文档、多图任务上全面缩小与 GPT-4V 的差距。
- **局限**：视觉塔巨大导致显存/推理成本高，端侧不可用。
- **对本方向的启示**：对 VLN 的直接提示——导航的瓶颈很可能在**视觉理解（细粒度、空间、多视角）**，而不是语言模型大小；InternViT 是导航骨干的常见选择。

### 3. CogVLM · 《CogVLM: Visual Expert for Pretrained Language Models》
- **出处**：arXiv `2311.03079` · 2023 · 清华 / 智谱
- **一句话**：不冻结 LLM，在每层注入"视觉专家"模块做深度融合，试图突破浅层对齐的天花板。
- **方法**：每个 Transformer 层增加视觉专家（QKV 矩阵 + MLP），图像特征与文本隐藏状态在每层交叉；高分辨率（490²）输入。
- **关键结论**：深层融合在多项 benchmark 上优于同期浅层对齐方案（BLIP-2/LLaVA 系早期版本）。
- **局限**：结构侵入式、训练与推理开销大、扩展困难，未成主流。
- **对本方向的启示**：路线之争的对照组；其失败反衬"简单架构 + 大数据"路线的正确性。

### 4. DeepSeek-VL · 《DeepSeek-VL: Towards Real-World Vision-Language Understanding》
- **出处**：arXiv `2403.05525` · 2024 · DeepSeek
- **一句话**：以"真实世界场景"（图表、OCR、网页、代码）为目标的实用型 VLM，混合高低分辨率视觉编码器。
- **方法**：混合视觉编码器（SigLIP-L@384 语义 + SAM-B@1024 高分辨率细节，两路 token 拼接）；三阶段训练（对齐 / 多任务联合 / 指令微调）；真实场景数据为主。
- **关键结论**：OCR 与图表理解达到当时开源前列；证明"面向场景的数据设计"比堆通用图文对更有效。
- **局限**：模型代际更新快，单代影响力有限。
- **对本方向的启示**：高低分辨率双路编码的工程思路 → VLN 中"全景语义 + 局部细节"的双流观测设计可借鉴。

### 5. MiniCPM-V · 《MiniCPM-V: A GPT-4V Level MLLM on Your Phone》
- **出处**：arXiv `2408.01800` · 2024 · 面壁智能 / 清华
- **一句话**：把 GPT-4V 级别能力塞进 8B 端侧模型，OCR 尤其强。
- **方法**：SigLIP 视觉塔 + 自适应视觉编码（切片式高分辨率）+ OCR 专项数据与跨模态共享；端侧部署优化。
- **关键结论**：8B 规模在 OCR 等 benchmark 上追平 GPT-4V，验证"效率"路线可行。
- **局限**：复杂推理仍不及更大模型；端侧约束限制了数据规模。
- **对本方向的启示**：**真机部署**的 VLN/VLA 对端侧 VLM 有硬需求（如机器人板载算力），MiniCPM-V 是重要候选骨架。

### 6. Cambrian-1 · 《Cambrian-1: A Fully Open, Vision-Centric Exploration of Multimodal LLMs》
- **出处**：arXiv `2406.16860` · NeurIPS 2024 (Oral) · NYU / Stanford
- **一句话**：以"视觉为中心"重新审视 VLM 设计，核心结论——**视觉能力才是 MLLM 的瓶颈，语言模型规模没那么重要**。
- **方法**：SVA（Spatial Vision Aggregator：把空间归纳偏置引入多视觉编码器 token 聚合，来自 SDPA 的设计移植）；多视觉编码器组合（CLIP/SigLIP/DINOv2/ConvNeXt 等）；构建含空间 grounding 的指令数据；提出 CV-Bench 评测空间关系理解。
- **关键结论**：视觉编码器与连接器的选择对性能影响远大于 LLM 规模；"越强的视觉塔 + 越多样的视觉塔"持续带来收益。
- **局限**：多视觉塔带来推理成本；CV-Bench 等评测仍以 2D 图像空间关系为主。
- **对本方向的启示**：**本项目最重要的参考之一**。VLN 正是"空间理解密集型"任务——按 Cambrian-1 的结论，导航模型应该把钱花在视觉（多视角、深度、空间关系），而非更大的语言模型。

### 7. Idefics2 · 《What matters when building vision-language models?》
- **出处**：arXiv `2405.02246` · 2024 · Hugging Face
- **一句话**：Flamingo 理念的开源务实复刻 + 系统性消融：什么设计要素真正重要？
- **方法**：SigLIP 视觉塔 + 感知分辨率池化（Perceiver Resampler）；The Cauldron（50 个数据集混合的指令微调集）；全 LoRA 训练 8B 模型。
- **关键结论**：数据集选择与分辨率池化是主要杠杆；小模型 + 好数据可接近大模型效果。
- **局限**：论文重点是消融而非 SOTA。
- **对本方向的启示**：难得的"工程消融报告"，可当作设计 VLN-VLM 骨干时的检查清单（视觉编码器？分辨率？数据混合？）。

### 阶段小结
| 结论 | 出处 |
|---|---|
| 视觉编码器规模是能力关键 | InternVL、Cambrian-1 |
| 数据配方 > 架构花样 | LLaVA-1.5、Idefics2 |
| 动态分辨率是标配 | LLaVA-NeXT、Qwen2-VL |
| 端侧可行（8B 级） | MiniCPM-V |
| 闭源对标线：GPT-4V/GPT-4o | OpenAI |
