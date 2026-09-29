# 进度交接

最后更新：2026-09-29 · 第 1 个工作窗口。

## 一句话现状

已按用户指定 research-workflow 完成 30 篇物体 6D 位姿代表工作的中文调研库、知识地图、条件对比、学习路线和后续复现/评测规划；没有下载论文、数据或模型，也没有运行实验。

## 用户需求与当前假设

- 用户有传统轮式机器人感知经验，目前做人形机器人感知，想系统学习 6D 位姿估计。
- 要求当前目录建立 `related_work`，逐篇先总结再详细介绍，不下载论文。
- 默认研究人形操作中的**刚体物体位姿**，不是机器人基座定位或人体关节姿态。已提出范围、目标和传感器条件的可选澄清，完成本轮时尚未收到答复。
- 无指定会议、截止日期、硬件、算力、CAD 条件；路线按输入条件分别建议，不把默认 RGB-D+CAD 当成用户实际配置。

## 已完成

- [调研总入口](related_work/README.md)：30 篇索引及阅读入口。
- 每篇 `related_work/papers/<year>_<method>/README.md` + `metadata.json`，另有 [结构化总书目](related_work/bibliography.json)。
- 8 篇实例/精修/多视图、10 篇通用新物体、6 篇类别级、4 篇时序跟踪/重建、2 篇基准工作（FoundationPose 也涉及跟踪，统计时仅计一次）。
- 知识地图、方法比较、人形接口分析、八周学习路线、近期进展与检索边界。
- 数据候选与状态、复现计划、标准化评测草案、空实验结果表、真实需求/候选问题记录。
- 已核实 workflow 提交 `14c882df49a7991b9833f2ff416e4dfd38668827`；参考其 README、SKILL、模板和初始化脚本，在本项目按用户要求调整，未安装全局技能。

## 核验范围

逐篇核对一手题录/论文网页与作者项目或仓库。部分论文在线阅读方法正文，部分仅摘要、架构或 README 初读；`evidence_status` 和正文记录具体阅读深度。不是 30 篇逐式精读，不是完整实验复现。

交叉审阅纠正：localization 与 detection 的对象身份/数量条件、在线建图允许当前/历史观测、跟踪首帧坐标规范与 GT 泄漏、采集/执行时间差、BOP 毫米与逐帧内参；Any6D 的 GT mask 与 6DOPE-GS 的人工首帧条件已明确。

文件检查包括 30 份独立 metadata 的 JSON/必填字段、唯一 ID、对应笔记、开头总结、Markdown 内部链接及无 PDF/源码/权重文件。外部链接为检索时访问核验，不承诺之后持续可用；未对所有外链做批量长期可用性测试。

## 下次无需重查的差异

1. GDR-Net 的 arXiv 最新版与 GDRNPP 扩展不同；DeepIM 的后续期刊版也不同，原论文配置单独记录。
2. FoundationPose 新对象不微调位姿网络，但无 CAD 分支需要对象表示拟合。
3. FoundPose 官方仓库不含完整 featuremetric refinement；FreeZe 的官方 Code 链接未确认算法实现；6DOPE-GS 项目页代码标 Coming Soon。
4. Gen6D 原训练集已停止提供；预训练推理与从头训练可复现性不同。
5. FS-Net、AG-Pose 当前仓库与原论文存在版本/方法差异。
6. BundleSDF 仓库的在线分割封装与论文设定不同；GenPose tracking 存在人工对齐分割条件；ICG/CAPTRA 需要初始化。
7. 2026 动向仅抽查，不能据此声称最新 SOTA 全覆盖；grounding、相对位姿和绝对物体 SE(3) 不是相同任务。

## 下一步建议

先按用户实际相机、对象准备条件、材质/遮挡、算力和任务容差缩小到 2–3 个 baseline。优先完成一个方法的离线输入、坐标、mask、尺度检查，再运行冻结评测，不立即同时安装所有仓库。

默认有 RGB-D+CAD 时，从 FoundationPose 开始；其余条件按 [方法对比](related_work/02_方法对比与选型.md) 分流。实验前阅读 [复现计划](复现/README.md) 与 [评测协议](experiment/evaluation.md)，确定协议 v1，实际跑后再追加 [结果](experiment/results.md)。

研究问题只保留在候选阶段，等复现暴露稳定失败模式后再发展，不把推断写成新颖性或实机证据。

## 环境记录

本环境默认 shell 沙箱启动曾报 `bubblewrap: mountinfo path is not absolute`；获准的 `require_escalated` 命令可读写用户授权的当前目录。使用 `python3`，没有 `python` 命令。`apply_patch` 新增文件可用，更新时可能同样报沙箱错误；必要时用 Python 3 在当前目录精确修改。未修改系统环境或其他项目。

## 给下一窗口的第一句话

> 先读 AGENTS.md 和 handoff.md，再按我的实际相机与 CAD 条件读 related_work/02_方法对比与选型.md；从一个 baseline 的数据/坐标接口核验开始。保留“不下载论文”的要求，真实运行前说明计划，所有结果按 experiment/evaluation.md 记录，不把文献分数写成复现分数。
