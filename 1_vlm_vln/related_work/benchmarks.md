# VLM 通用评测基准清单

> 用于后续复现/对比 VLM 时快速定位"该跑哪些分"。VLN 自身的评测在 `vln/01-datasets.md`。排序按能力维度分组。

## 1. 基础图文问答

### 1.1 TextVQA · 《Towards VQA Models That Can Read》
- arXiv `1904.08920` · CVPR 2019
- 场景文字问答：必须"读图里的字"才能答对（店铺招牌、路标等）。
- 意义：OCR 能力的第一块试金石；对 VLN（读房间号、标识）同源。

### 1.2 DocVQA · 《DocVQA: A Dataset for VQA on Document Images》
- arXiv `2007.00398` · 2020
- 文档图像问答（12,767 页工业文档）。
- 意义：文档理解基准，Qwen2.5-VL / InternVL 竞争的重点场景。

### 1.3 ChartQA · 《ChartQA: A Benchmark for Question Answering about Charts with Visual and Logical Reasoning》
- arXiv `2203.10244` · ACL 2022 Findings
- 图表（柱状/折线/饼图）上的数值推理问答。
- 意义：视觉 + 数值逻辑推理的组合测试。

## 2. 推理与知识

### 2.1 ScienceQA · 《Learn to Explain: Multimodal Reasoning via Thought Chains for Science Question Answering》
- arXiv `2209.09513` · NeurIPS 2022
- 约 21K 道带图表的科学多选题 + 讲解（lecture/explanation）。
- 意义：CoT 解释生成的经典评测；LLaVA 论文的主打指标（92.53%）。

### 2.2 MMMU · 《MMMU: A Massive Multi-discipline Multimodal Understanding and Reasoning Benchmark for Expert AGI》
- arXiv `2311.16502` · CVPR 2024
- 30 个大学学科、11.5K 专家级多模态题（图表/公式/图像混合）。
- 意义：目前公认最难的"专家级"多模态推理评测，VLM 能力的上限标尺。

### 2.3 MathVista · 《MathVista: Evaluating Mathematical Reasoning of Foundation Models in Visual Contexts》
- arXiv `2310.02255` · ICLR 2024
- 6K+ 视觉数学推理题（几何、图表数学等）。
- 意义：视觉 + 数学推理的专门评测，被 Qwen/InternVL/GPT 系列普遍报告。

## 3. 综合能力板

### 3.1 MMBench · 《MMBench: Is Your Multi-modal Model an All-around Player?》
- arXiv `2307.06281` · 2023
- 3K 道单选题，覆盖 20 个能力维度（感知、推理、OCR 等）。
- 意义：开箱即用、无 API 依赖的全面"体检"，中文社区使用极广（MMBench-CN）。

### 3.2 SEED-Bench · 《SEED-Bench: Benchmarking Multimodal LLMs with Generative Comprehension》
- arXiv `2307.16125` · CVPR 2024
- 19K 题、12 个评测维度，生成式作答 + LLM 自动判分。
- 意义：生成式评测（不只选择题）的代表框架。

## 使用建议（按 workflow 的"测评写死"原则）

- 复现/对比 VLM 前，在 `experiment/evaluation.md` 中**先写死**要报的 benchmark 与协议，避免"临时挑好看的指标"。
- 快速体检：MMBench（全面）+ TextVQA（OCR）+ MMMU（上限）。
- 与 VLN 相关的选配：GQA/SpatialBench 类空间推理评测（见 Cambrian-1 的 CV-Bench，arXiv `2406.16860` 配套），导航导向的研究建议加测空间关系能力。
