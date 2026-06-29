# CS/STEM 学科配置

---

## Phase 1 锚点材料

**锚点类型（优先级从高到低）：**
1. arXiv survey paper / "SoK" paper — 最优先，直接给领域全景
2. Recent position paper / workshop keynote — 前沿方向
3. 顶会 related work section — 标准基线
4. Technical report / 行业白皮书 — 工程实践视角
5. 顶会 tutorial / 课程讲义 — 体系化知识

**搜索策略：** `"<topic> survey" site:arxiv.org` / `"<topic> SoK"` / Semantic Scholar 按引用量排序。

---

## Phase 3-4 跳过规则

**自动跳过 Phase 3-4（理论/算法类）：**
- 纯算法设计与复杂度分析（不涉及 benchmark 实验）
- 形式化验证 / 数学证明 / type system
- 编程语言理论 / 逻辑
- 理论机器学习（learning theory bound）

**必须运行 Phase 3-4（实证类）：**
- Benchmark / 实验评估
- 系统实现 + 性能测量
- 用户研究 / A/B test
- 数据驱动的经验研究

---

## Phase 6 评审标准

参考 NeurIPS 6-point scale：

| 分数 | 含义 | 标准 |
|------|------|------|
| 6 | Strong Accept | 技术正确、实验扎实、contribution 清晰、推进领域理解 |
| 5 | Accept | 质量高、有小瑕疵可修复 |
| 4 | Borderline Accept | 够格但不算突出 |
| 3 | Borderline Reject | 有洞见但实验不足 or 贡献不够 |
| 2 | Reject | 方法有缺陷 or 贡献太薄 |
| 1 | Strong Reject | 技术错误、已知方法重打包 |

**四维评审：**
- **Quality** — 技术正确性、claim 是否有充分证据支撑
- **Clarity** — 写作清晰度、专家是否可复现
- **Significance** — 社区影响力、是否推进领域理解
- **Originality** — 新洞见（不要求新方法，新视角也算）

---

## Phase 8 顶会模板

| Conference | Page Limit | Camera-Ready | Key Requirement |
|------------|------------|-------------|-----------------|
| **NeurIPS 2025** | 9 pages | +0 | Mandatory checklist, lay summary |
| **ICML 2026** | 8 pages | +1 | Broader Impact Statement |
| **ICLR 2026** | 9 pages | +1 | LLM disclosure, reciprocal reviewing |
| **ACL 2025** | 8 pages (long) | varies | Limitations section mandatory |
| **AAAI 2026** | 7 pages | +1 | Strict style file adherence |
| **COLM 2025** | 9 pages | +1 | Language model focus |

**通用规则：** 参考文献不计入页数、附录无上限但审稿人无义务阅读、double-blind 需匿名化。

---

## CS 论文语调

- 密集、客观、技术化
- 不写 "we believe" / "we think"，写 "we demonstrate" / "we observe"
- 不写万能开头 "Large language models have achieved remarkable success..."
- Introduction front-load contribution，不铺陈背景
- Related Work 按方法论聚类，不逐篇罗列
- 关键 baseline 引用原始论文非二手引用
