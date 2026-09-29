# handoff.md —— 进度交接

> 每个窗口结束前更新；新窗口第二个读（先读 AGENTS.md）。

## 进度：进行到哪了

- [x] 按 research-workflow 建立项目骨架（AGENTS.md + related_work/ 结构）。
- [x] 第一轮 related work 调研完成：
  - VLM 侧：基础 → 指令微调 → 规模化 → 具身 VLA 四阶段，31 篇论文条目。
  - VLN 侧：数据集（8）→ 经典方法（12）→ LLM/VLM 时代（10），30 篇论文条目。
  - 全部 arXiv ID 已通过 arXiv API 逐一验证（2026-09-23）。
- [ ] 论文 PDF 尚未批量下载（跑 `bash related_work/download-papers.sh`）。
- [ ] 未精读任何单篇；未复现 baseline。

## 下一步（建议顺序）

1. 下载 PDF 并精读 5 篇枢纽论文：BLIP-2、LLaVA-1.5、ETPNav、Navid、PaLM-E。
2. 在 `brainstorm.md` 记录感兴趣的问题与假设（gap 清单见 `vln/README.md`）。
3. 复现入门 baseline：LLaVA-1.5（VLM 侧）或 R2R Seq2Seq（VLN 侧），复现报告放 `复现/`。
4. 按需扩展调研：2025 后新工作、VLA（OpenVLA/π0 等）、导航基础模型。

## 踩过的坑（供后续窗口避雷）

- **arXiv ID 不能凭记忆**：本调研初版 ID 有约 1/3 记错（如 VLN survey 实为 `2203.12667` 而非 2108.09644），已全部用 API 验证。新增论文必须验证。
- **arXiv API 访问**：需带浏览器 UA，否则 406；连续请求会 429，间隔 ≥3s 或加重试。
- **LLaVA-NeXT 无独立 arXiv 论文**（官方博客形式），条目中未给假 ID。
- 用户目标是"从零进入 VLM/VLN"，当前阶段重点是**读得懂、可复现**，不要急于提 idea。

## 2026-09-27 · BLIP 精读完成（追加进度）

- 新建 [BLIP 超详细精读](related_work/multimodal-llm/01-foundations/blip.md)，覆盖 MED、ITC / ITM / LM 推导、CapFilt、训练配置、全部下游任务、关键消融、官方代码、VLM / VLN 联系及自测问答。
- 已核对 arXiv `2201.12086` 与 ICML / PMLR 正式版；正文采用正式版口径，单列本地 arXiv v2 的 VG 文本统计、视频比较基线和附录编号差异。
- 笔记标明论文事实、实现补充、教学推导与个人分析，保留阶段概览原文，并在新笔记中追加精读限定。
- 本次完成文献精读与文档核对，未运行模型训练或 baseline 复现。本条补充上方初始交接中“未精读任何单篇”的旧状态。
