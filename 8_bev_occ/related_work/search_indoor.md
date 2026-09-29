# 室内、数据与世界模型检索记录

日期：2026-09-29。以下查询用于发现候选，之后打开原始论文HTML、正式页和官方仓库交叉核验；不下载PDF/source。

| 已执行查询或定向打开 | 筛选结果 |
|---|---|
| EmbodiedOcc EmbodiedScan semantic occupancy embodied robot official | 纳入EmbodiedScan、EmbodiedOcc，明确不同基准 |
| humanoid robot occupancy perception BEV RoboOcc 2025 2026 | RoboOcc、Humanoid Occupancy、Humanoid-OmniOcc；后两者交由机器人线详读 |
| 3D occupancy prediction embodied indoor 2025 2026 arxiv | 纳入SliceOcc、EmbodiedOcc++；未核验的第三方新方法不列核心 |
| RoboOcc arxiv occupancy 2025 | arXiv2504.14604，已读方法，代码未确认正式发布 |
| OpenOccupancy large scale benchmark github arxiv 2023 | arXiv2303.03991、官方数据文档；HTML正文访问失败，笔记降级标注 |
| SliceOcc conference 2025 ICRA | 未取得可靠录用依据，按2025预印本记录 |
| Occupancy world model robots RoboOccWorld github | arXiv2505.05512；未确认官方可运行代码，不用第三方集成说明替代 |
| SemanticKITTI NYUv2 ScanNet nuScenes occupancy official dataset | 核对原始数据与派生占用任务，交由dataset.md汇总 |

## 已写的八篇

[EmbodiedScan](papers/embodiedscan/README.md)、[OpenOccupancy](papers/openoccupancy/README.md)、[EmbodiedOcc](papers/embodiedocc/README.md)、[SliceOcc](papers/sliceocc/README.md)、[EmbodiedOcc++](papers/embodiedocc_plus/README.md)、[RoboOcc](papers/roboocc/README.md)、[OccWorld](papers/occworld/README.md)、[RoboOccWorld](papers/robooccworld/README.md)。

## 主来源读取与限制

- EmbodiedScan：CVPR正式页、arXiv2312.16170 HTML、作者主页及InternRobotics仓库。旧OpenRobotLab链接已跳转；当前仓库中的后续MMScan不归为原论文。
- EmbodiedOcc：arXiv2412.04380v2 HTML和YkiWu官方仓库。最初尝试的Tsinghua-MARS-Lab路径无效，未作为证据。
- SliceOcc：arXiv2501.16684v1 HTML与NorthSummer仓库。仓库根主要展示子目录，未声称运行链完整。
- EmbodiedOcc++：arXiv2504.09540v1 HTML与PKUHaoWang仓库，仓库已注明ACM MM2025与代码发布。
- RoboOcc / RoboOccWorld：读arXiv2504.14604v1 / 2505.05512v1的任务与方法；代码“将发布”不等同于确认发布。
- OccWorld：arXiv2311.16038 HTML与wzzheng/OccWorld官方仓库。特定v2 HTML最初失败，无版本HTML可访问；登记实际读取入口。
- OpenOccupancy：原始摘要与官方README、prepare_data.md；未获得所试HTML正文。来源级别已写入笔记。

## 2026补查与排除

直接打开GEM-Occ arXiv2607.05543与PanoMMOcc arXiv2603.13108核验近期方向，并由机器人线补方法解析。GaussianFormer-2、OccAny由OCC线核验，根agent复开CVF时出现403，故使用已获得的来源记录并保留在扩展阅读，不编造额外全文结论。

没有采用二手网站的“人形已全面解决”“统一SOTA”等表述；未将只做新视角/视觉生成的所有模型泛化为OCC方法。未来可补的分支见 EXTENDED_READING.md。
