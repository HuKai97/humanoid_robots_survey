# 补充基准、综述与平台检索记录

日期：2026-09-29。执行范围：主调研整合。没有下载论文文件。

## 关键查询与纳入理由

| 查询/来源 | 结果与处理 |
|---|---|
| `REVERIE benchmark remote embodied visual referring expression official` | 纳入 REVERIE：补足导航终点与目标物体定位的区别；核对 CVPR2020，首发2019 |
| `SOON Scenario Oriented Object Navigation official` | 纳入 SOON：目标描述与任意起点；正式为 CVPR2021，不采纳初始记忆中的 ICCV |
| `Vision-and-Language Navigation survey foundation models` | 纳入 2407.07035 的 HTML v2：用于环境/人类/智能体框架 |
| `humanoid vision language navigation benchmark 2025 2026` | 发现 HumanoidVLN/TANGO/VLN-PE，交由人形专题回溯原论文；不使用新闻报道作为实验事实证据 |
| `vision language navigation survey 2026 real world evaluation` | 纳入 2607.09792：核对 §V-A 轮式平台与不同传感器，避免把结果当架构控制实验 |
| Habitat-Lab/Sim、Isaac Lab 官方 README | 核对平台职责与维护/版本现状，未安装验证 |

## 已使用的一手来源

- [REVERIE arXiv](https://arxiv.org/abs/1904.10151)、[CVPR 正式页](https://openaccess.thecvf.com/content_CVPR_2020/html/Qi_REVERIE_Remote_Embodied_Visual_Referring_Expression_in_Real_Indoor_Environments_CVPR_2020_paper.html)、[官方代码](https://github.com/YuankaiQi/REVERIE)。
- [SOON arXiv](https://arxiv.org/abs/2103.17138)、[作者项目](https://scenario-oriented-object-navigation.github.io/)、[官方代码](https://github.com/ZhuFengdaaa/SOON)。CVF HTML 访问曾失败，作者项目提供 CVPR 正式引用；检索返回的正文片段只按实际看到的内容使用。
- [2024 综述 HTML](https://arxiv.org/html/2407.07035v2)、[2026 综述 HTML](https://arxiv.org/html/2607.09792v1)。
- [SPL 评测建议](https://arxiv.org/abs/1807.06757)、[ObjectNav 评测建议](https://arxiv.org/abs/2006.13171)。
- [Habitat-Lab](https://github.com/facebookresearch/habitat-lab)、[Habitat-Sim](https://github.com/facebookresearch/habitat-sim)、[场景说明](https://github.com/facebookresearch/habitat-sim/blob/main/DATASETS.md)。
- [Isaac Lab](https://github.com/isaac-sim/IsaacLab)、[官方安装说明](https://isaac-sim.github.io/IsaacLab/develop/source/setup/installation/index.html)。
- [GRUTopia 旧地址](https://github.com/OpenRobotLab/GRUtopia) 当前重定向到 [InternUtopia](https://github.com/InternRobotics/InternUtopia)。

## 取舍与复核

没有将聚合排行榜的“best”数字写入总表，也未用博客为新论文的人形实机能力背书。两篇综述用于组织阅读与方法学提醒，不代替所有原论文证据。独立复核修正了 R2R val_seen 划分措辞、SDTW 的失败记零定义、第一视角与全景的关系、VLFM 官方入口及 2026 综述的 TASE 接收备注。
