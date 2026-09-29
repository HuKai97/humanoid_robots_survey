# 基础与定位检索记录

日期：2026-09-29。检索为代表性定向检索，不是系统综述或完整引文统计。

| 查询／入口 | 核验结果 | 处理 |
|---|---|---|
| State Estimation for Legged Robots Consistent Fusion Leg Kinematics IMU Bloesch RSS 2012 | RSS论文页与ETH机构记录吻合 | 纳入01；不是人形实验证据 |
| Contact-Aided Invariant Extended Kalman Filtering Robot State Estimation Hartley 2018 arxiv | 2018原版与2019扩展版 | 合并为02，避免重复计数 |
| VINS Mono 1708.03852 | 预印本与HKUST官方仓库 | 纳入03；区分原论文与仓库后加功能 |
| ORB SLAM3 2007.11898 official github | UZ-SLAMLab为官方上游，搜索还返回fork | 纳入04，只把上游作为代码来源 |
| FAST LIO2 2107.06829 official github | 进一步找到FAST-LIVO2三模态工作 | 05选FAST-LIVO2；FAST-LIO2只作延伸 |
| ManiWAV Learning Robot Manipulation from In the Wild Audio Visual Data | 摘要、HTML、作者页与官方仓库 | 纳入06，分类为感知与策略衔接 |

上述每项的精确URL与证据范围见对应note.md及metadata_foundations.json。搜索返回过PDF索引摘要；未主动下载PDF或LaTeX，也未将PDF文件保存到工作区。方法解析以已打开网页为基础，未核验的实验数值不写。

补充资源核验：Modern Robotics官网和MIT Underactuated Robotics课程目录已打开；EuRoC原页面已迁移，需要使用ETH新数据目录；ScanNet旧站首次访问超时，改核验作者仓库。未尝试绕过受限内容。
