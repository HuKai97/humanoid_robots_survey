# 现代导航与 VLA 背景检索记录

- 检索日期：2026-09-29。
- 目标：为 VLN 初学者补齐语义地图、模块化语言导航、LLM/VLM 导航、视频导航与动作模型背景。
- 边界：八篇代表作；本记录不是截至检索日所有论文的穷尽搜索，也不形成实时 SOTA 排名。
- 行为：只在线读取摘要、网页 HTML、官方项目及代码 README；未下载 PDF、LaTeX、数据、模型，未安装或训练。

## 查询与取舍

| 查询关键词 | 入选项及理由 | 核查路径 |
|---|---|---|
| `VLMaps Visual Language Maps robot navigation official project` | VLMaps：学习语言特征落地到几何地图 | arXiv 2210.05714 → vlmaps.github.io → vlmaps/vlmaps；额外读取作者机构技术说明 |
| `LM-Nav robotic navigation language pretrained models official`、`LM-Nav github lm_nav` | LM-Nav：学习语言/图文/导航模型模块组合 | arXiv 2207.04429 → 官方 Google Sites → 页面 Code 链接指向 blazejosinski/lm_nav；核对 PMLR 年份 |
| `NavGPT NavGPT-2 official github paper` | NavGPT：理解文字化感知、历史摘要与零样本决策的边界 | arXiv 2305.16986 HTML → GengzeZhou/NavGPT |
| `NavGPT-2 github` | NavGPT-2：与 NavGPT 对照学习经过训练的 VLM 表征及拓扑动作网络 | arXiv 2407.12366v1 HTML → GengzeZhou/NavGPT-2 |
| `NaVid Video-based VLM Plans the Next Step Navigation official`、`NaVid Video navigation github` | NaVid：直接关联 RGB 视频 VLN-CE 与轮式实机迁移 | arXiv 2402.15852v2 HTML → pku-epic.github.io/NaVid → jzhzhang/NaVid-VLN-CE |
| `VLFM Vision Language Frontier Maps Zero Shot Semantic Navigation github` | VLFM：重要 ObjectNav 语义探索背景，明确与路径 VLN 区分 | arXiv 2312.03275v1 HTML → 当前官方 rai-opensource/vlfm README |
| `Uni-NaVid A Video-based Vision-Language-Action Model for Unifying Embodied Navigation Tasks`、`Uni-NaVid github` | Uni-NaVid：多任务视频导航、在线历史压缩、四足平台接口 | arXiv 2412.06224v2 HTML → PKU-EPIC 项目 → jzhzhang/Uni-NaVid、共享 VLN-CE 评测仓库 |
| `OpenVLA official arxiv 2024` | OpenVLA：保留为 P2 操作 VLA 背景，不当作导航成果 | arXiv 2406.09246v3 HTML → openvla.github.io → openvla/openvla |

## 证据中的关键差异

1. **年份分开记录。** VLMaps 首投 2022、ICRA 2023；LM-Nav 首投与会议为 2022，而 PMLR 卷出版为 2023；NavGPT 首投 2023、AAAI 2024；VLFM 首投 2023、ICRA 2024；Uni-NaVid 首投 2024、RSS 2025。
2. **NaVid 版本不能混用。** 本次 HTML v2 与现项目页的数据数量表述不完全一致；当前公开 NaVid 检查点 README 又说明使用 R2R/RxR 训练数据及 Uni-NaVid 训练策略。笔记不把它当作原版 R2R→RxR 泛化成绩。
3. **RGB-only 的限定层级。** NaVid v2 附录写明 TurtleBot 4 使用激光里程计进行运动跟踪；Uni-NaVid v2 附录写明 GO2 的本地控制使用 LiDAR。高层模型输入与整机传感器必须分开描述。
4. **零样本的限定任务。** LM-Nav 使用已训练模型与环境拓扑图；VLFM 的语义导航不训练新参数，但模拟执行层有训练过的 PointNav 策略。
5. **公开版本与论文版本。** Uni-NaVid 官方 README 说明公开数据/训练路径受到许可影响，ObjectNav 数据未沿用 L3MVN 方法，不能预设公开权重完整复现所有论文任务。
6. **维护与历史依赖。** VLFM README 写明代码没有积极维护承诺；NaVid 评测 README 使用旧 Habitat 栈；NavGPT 与 LM-Nav 含历史 API 模型名。当前调研只记录来源，不测试可安装性或服务可用性。

## 来源访问限制与排除

- VLFM 的 `https://arxiv.org/html/2312.03275v2` 本次返回内部错误；改读可访问的 v1，并在笔记标明版本。
- `https://naoki.io/portfolio/vlfm/` 返回错误；`https://naoki.io/vlfm` 返回空白重定向。正文不声称读过该项目页，使用 arXiv HTML 与作者官方仓库交叉核对。
- NaVid 的通用关键词出现同名个人、卫星等无关搜索结果，全部排除。
- 搜索结果中的第三方 DeepWiki、博客、汇编或仓库镜像只用于发现线索，不作为论文事实依据。官方链接通过作者项目或论文核对。
- 搜索偶然返回 Qwen-RobotNav 等后续工作；本子任务不据搜索摘要扩展成新论文解析，交由整体调研的新工作线处理。
- 未统一摘抄各种“提升百分比”。只在 NavGPT-2 笔记记录官方 XL 检查点的两个明确指标，并保留离散 R2R 任务条件。其余采用定性实验范围描述，避免跨基准直接比较。

## 后续可补证据

每篇剩余工作是检查最终出版版本与仓库指定提交的一致性、逐表复核目标设置、阅读动作执行实现。上述任务需要在实际选择 baseline 后按需开展，当前没有伪称完成全文精读或实机复现。
