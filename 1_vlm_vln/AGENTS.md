# AGENTS.md —— 项目总纲

> 每个新窗口第一个读本文件；读完再读 `related_work/README.md`。

## 在做什么

- 项目：**VLM / VLN 领域调研**（多模态大模型 + 视觉语言导航）
- 一句话：为从零进入多模态大模型（VLM / MM-LLM）与视觉语言导航（VLN）方向做准备，按 research-workflow 的方式完成第一轮 related work 调研。
- 当前阶段：**抓文献 / 读文献**。尚未进入"复现 baseline → 提假设"阶段。

## 目录说明

```
vlm_vln/
├── AGENTS.md              项目总纲（本文件）
├── handoff.md             进度交接（调研进行到哪、下一步）
├── brainstorm.md          问题和假设的讨论记录（倒序）
├── related_work/          文献调研结果（核心）
│   ├── README.md          总览 + 领域地图 + 阅读指南
│   ├── benchmarks.md      VLM 评估基准清单
│   ├── download-papers.sh 批量下载论文 PDF
│   ├── multimodal-llm/    多模态大模型调研（4 个阶段）
│   └── vln/               视觉语言导航调研（数据集 / 经典 / LLM 时代）
├── 复现/                  baseline 复现报告（后续建立）
├── experiment/            实验记录（后续建立）
└── DataSet/               数据说明（后续建立）
```

## 硬规矩

1. **文献条目格式统一**（见 `related_work/README.md` 的模板），新增论文必须带经过验证的 arXiv ID，禁止凭记忆编 ID。
2. **不自造术语**。所有方法名、指标名（SR、SPL、nDTW 等）使用领域已有定义。
3. **区分事实与观点**：笔记中"方法/结论"必须来自论文；"对本方向的启示"允许主观，需标注。
4. **调研笔记只增不改**。发现错误时新增"勘误"条目，不要覆盖原记录（对应 workflow 的"每版实验都留着"原则）。
5. 复现关键 baseline（如 R2R Seq2Seq、LLaVA）之前，不基于论文数字下结论。

## 领域标准术语（供后续 brainstorm 使用）

- VLM / MLLM / MM-LLM：视觉语言模型 / 多模态大语言模型
- Instruction tuning：指令微调；Visual instruction tuning：视觉指令微调
- VLN：Vision-and-Language Navigation；VLN-CE：连续环境下的 VLN
- VLA：Vision-Language-Action model（视觉-语言-动作模型）
- R2R / RxR / REVERIE / SOON：VLN 主流 benchmark
- SR / SPL / nDTW：成功率 / 加权重径长度成功率 / 归一化动态时间规整距离
