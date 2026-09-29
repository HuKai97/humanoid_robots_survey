# Handoff

最后更新：2026-09-29，首次调研交付。

## 一句话现状

已按 research-workflow 建立人形机器人 BEV/OCC 调研资料库：37篇逐篇解析、体系综述、学习路线、数据说明和后续复现/实验骨架；本次任务已完成。

## 用户背景与已确定约束

- 用户有传统轮式机器人感知经验，现做人形机器人感知。
- 希望尽量完整学习，兼顾行走、导航与操作。
- 传感器、计算平台、时间目标均未定，不假设特定机器人或GPU。
- 用户明确不下载论文；本轮未下载PDF、LaTeX、实现代码、数据或权重。
- 每篇解析先总结后详细介绍；事实、推断、资源状态和实际阅读范围分开。
- 参考 https://github.com/skJack/research-workflow 的目录职责；未安装远程skill或执行远程脚本。

## 已完成并检查

- 37个 papers/*/README.md，覆盖几何建图、BEV、SSC/OCC、室内在线、直接人形/四足、任务语义、世界模型。
- related_work/README.md 为入口，00_START_HERE.md 面向轮式背景，PAPER_INDEX.md 为完整目录。
- SURVEY.md、COMPARISON.md、GLOSSARY.md、LEARNING_ROADMAP.md。
- 四份 search_*.md 和 METHODOLOGY.md 记录检索、消歧与阅读证据。
- dataset.md、DataSet/README.md 只记录数据候选与准备要求。
- 复现/ 包含计划和报告模板；experiment/ 包含未冻结测评草案与未运行登记；brainstorm.md仅列待检验问题。
- 本地链接、索引覆盖、文件结构与未下载约束已机械检查；实际结果见 related_work/QUALITY_CHECK.md。
- 独立审阅修正齐次点符号、相机外参指代、Gaussian透明度泛化、OccNeRF错误候选链接，并补静态场景限制。

## 重要证据边界

1. 不声称37篇均已全文精读。逐篇列出HTML方法/摘要/项目文档级证据，经典少数论文留全文细查。
2. 所有算法实验未执行；没有模型成绩、训练成功、运行时延或上机安全性结论。
3. BEVFusion采用MIT版本；SparseOcc采用Liu/ECCV版，另有Tang/CVPR同名工作。
4. Humanoid Occupancy包含人戴采集；OneOcc含真实四足和模拟人视角，均不能统称真人形数据。
5. Humanoid Occupancy单帧并非所有对照领先，多帧也非越多越好；表格口径见逐篇。
6. 近期代码多为coming soon；GEM-Occ有部分官方数据包说明，仍不能宣称完整复现链。
7. Occ3D/OpenOccupancy/OpenOcc、EmbodiedScan/EmbodiedOcc-ScanNet/OccWorld-ScanNet分别处理。
8. 2026增补是定向检索，不是穷尽文献清单；不做跨数据协议SOTA排名。

## 下一步建议（本次未执行）

用户可以先读00_START_HERE和领域地图，再读P0论文。若继续做项目，先根据实际传感器/平台选择一个几何baseline与一个室内学习baseline，冻结数据、坐标、mask、评价和时域，再开展代码和数据准备。没有新授权时继续遵守不下载论文要求。

## 环境记录

默认shell和部分apply_patch调用曾因“mountinfo path is not absolute”无法启动；最后用经审查允许的exec_command require_escalated执行仅限本目录的Python读写。未改变系统配置或编辑工作区外文件。此问题不是文献或算法失败。

## 给下一个窗口的入口

先读AGENTS.md和本文件，再按用户当前任务打开related_work/README.md。调研已交付；继续学习、逐篇深读或复现时从现有材料接续，保留来源与未验证边界，不要重新生成整库。
