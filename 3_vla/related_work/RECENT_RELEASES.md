# 近期论文、版本与官方发布状态

**核验日期：2026-09-29。** 这是本轮针对主线模型的定向扫描，不是截至该日的穷尽综述。“未查到”仅表示本轮检索未确认；官方博客、模型卡、代码更新和论文分别标记。没有下载 PDF、论文源码、代码、数据或权重。

## 已有论文，但本轮未逐篇展开的后续工作

| 工作 | 首次论文日期 | 核验证据与性质 | 应怎样使用 |
|---|---|---|---|
| Knowledge Insulating Vision-Language-Action Models: Train Fast, Run Fast, Generalize Better | 2025-05-29 | [arXiv 2505.23705](https://arxiv.org/abs/2505.23705)，已核对摘要；属于论文 | 补读动作专家梯度怎样影响 VLM 知识；当前 openpi 的 π0.5 引用了它，不要混同 4 月 π0.5 原论文。 |
| Gemini Robotics 1.5: Pushing the Frontier of Generalist Robots with Advanced Embodied Reasoning, Thinking, and Motion Transfer | 2025-10-02 | [arXiv 2510.03342](https://arxiv.org/abs/2510.03342)，已核对摘要；[官方发布](https://deepmind.google/blog/gemini-robotics-15-brings-ai-agents-into-the-physical-world/)为 2025-09-25 | 后续读运动迁移、推理与动作交替；不要把 1.5 能力回填给 2025 年 3 月版。 |
| π*0.6: a VLA That Learns From Experience | 2025-11-18 | [arXiv 2511.14759](https://arxiv.org/abs/2511.14759)，已核对摘要和提交史；属于论文 | 扩展到真实部署经验、干预与优势条件强化学习 RECAP；先掌握模仿学习主线再读。不能只凭论文存在认定完整训练数据与权重公开。 |
| SONIC: Supersizing Motion Tracking for Natural Humanoid Whole-Body Control | 2025（本轮未进一步核对首日） | [官方仓库引用的 arXiv 2511.07820](https://arxiv.org/abs/2511.07820)、[官方代码](https://github.com/NVlabs/GR00T-WholeBodyControl) | 属于全身控制相邻基础；本轮只核对官方代码和引用，不据此声称精读。2026 年部署更新不改变论文年份。 |

## 2026 与后续版本：核验到什么就记录什么

| 项目/版本 | 日期口径 | 论文还是发布 | 已核验事实与研究边界 |
|---|---|---|---|
| DreamZero | 论文首次提交 2026-02-17 | 有论文，已写[逐篇笔记](papers/2026_dreamzero/README.md) | [arXiv](https://arxiv.org/abs/2602.15922)、[官方项目](https://dreamzero0.github.io/)、[代码](https://github.com/dreamzero0/dreamzero)三方对应。按 WAM 相邻分支收录；任务进度与成功率不可混比，论文速度不等于公开默认配置速度。 |
| Gemini Robotics-ER 1.6 | 模型卡发布 2026-04-20 | 本轮核验到官方模型卡；未以独立 VLA 论文收录 | [官方模型卡](https://deepmind.google/models/model-cards/gemini-robotics-er-1-6/)明确它是基于 Gemini 3.0 Flash 的 VLM，输出文本。ER 模型不能直接等同低层电机动作 VLA。 |
| GR00T N1.5 / N1.6 | 作为历史版本存在；另有 2026-01-08 英文技术博客 | 版本、代码与系统发布；本轮未确认各有独立论文 | [N1.6 官方技术博客](https://developer.nvidia.com/blog/building-generalist-humanoid-capabilities-with-nvidia-isaac-gr00t-n1-6-using-a-sim-to-real-workflow/)介绍 VLA、控制和仿真工作流；[WBC 官方仓库](https://github.com/NVlabs/GR00T-WholeBodyControl)区分下肢 RL、上肢 IK 的解耦控制。不能把系统全身能力直接归因于 VLA 独自承担全部控制。 |
| GR00T N1.7 + SONIC | 当前主分支；WBC 仓库记录 2026-05-07 VLA 工作流更新 | 可核验代码和集成发布；不作为 N1 原论文的实验结果 | [当前 GR00T 仓库](https://github.com/NVIDIA/Isaac-GR00T)已采用新视觉语言主干；[WBC 更新](https://github.com/NVlabs/GR00T-WholeBodyControl)包含 G1 数据采集、微调 N1.7、接 SONIC 部署。阅读时分别记录 VLA 输出表示与控制器解码。 |
| π0.7 | 本次未可靠核对完整发布日期 | 官方报告线索，阅读深度仅搜索索引 | 搜索引擎能索引到[官方报告地址](https://www.pi.website/download/pi07.pdf)，但[官方页面](https://www.pi.website/pi07)本次访问失败。为遵守不下载论文，本轮未读取 PDF，也不据片段写完整解析、参数或结论。等待可读官方 HTML/摘要后补充。 |

## 搜索边界与下一轮优先级

检索使用论文题名及官方域名，主要覆盖 Physical Intelligence、NVIDIA、Google DeepMind、Hugging Face/LeRobot 的系列更新，并交叉核对 arXiv。2026 论文展开一篇 DreamZero，是因为本轮能取得明确论文、官方项目、代码与方法正文；这不意味着其他 2026 工作不重要。

本轮官方 LeRobot 文档导航出现 MolmoAct2、LingBot-VA、VLA-JEPA 等名称，但没有继续完成逐篇一手证据核验，因此不据名称生成“重要论文”条目。[官方文档入口](https://huggingface.co/docs/lerobot/smolvla)

下一轮建议先补齐 Knowledge Insulation、π*0.6 与 Gemini Robotics 1.5 的方法和评测，再沿真实研究问题检索：动作表示、未见动作泛化、真实环境强化学习、VLA 与全身控制器接口。对于新预印本，记录日期、评测平台、对照配置与公开资源，避免只因发布时间新就提高学习优先级。
