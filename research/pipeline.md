# Pipeline — 8 阶段执行详情

---

## Phase 1: 问题锚定与理论发现

**核心问题：** AI 靠概率推断，不靠语境理解。直接说"我对 X 感兴趣，帮我找文献"——AI 只能随机联想，缺乏脉络。

**解法：** 用高质量锚点材料建立语境。不同学科锚点不同：
- **CS/STEM**：arXiv survey paper / related work section / technical report / 顶会 keynote / workshop position paper
- **社科**：深度报道 / 案例研究 / 政策文件
- **人文**：核心文本 / 评论文章 / 理论综述

**流程：**

1. **用户描述关注方向** — 不需要学术术语，用日常语言描述。CS："我想做 LLM agent 的 budget 控制"；社科："技术招聘市场结构变化"
2. **搜索锚点材料** — 按学科选锚点类型。CS：优先 survey/"SoK" paper / recent position paper；社科：搜深度报道/案例。不要求完全匹配，接近的场景即可建立脉络
3. **AI 提取语境** — 总结锚点材料中的关键问题、现有方法、open problems（CS）或行为者/条件/困境（社科）。这是建立脉络
4. **概念联想** — 基于锚点语境联想学术概念和技术路线。CS：从 open problems 找相关技术方向；社科：从细节联想学术概念。**聚焦概念，不直接跳到结论**
5. **数据库验证** — 通过 Semantic Scholar / Google Scholar 验证概念影响力，按引用量排序。先选宽泛高影响力方向，不过早收敛
6. **理论/技术地图生成** — 构建技术/理论网络：各方向关系、适用场景、核心假设、代表论文

**产出：** `research/theory-map.md`

**推荐工具：** WebSearch（搜锚点材料）、WebFetch（获取全文）、Semantic Scholar（验证影响力）

> Gate 1 → 锚点材料已找到、语境提取完整、概念有锚点细节支撑、数据库验证通过。

---

## Phase 2: 文献搜索

**核心引擎：** `academic-research-skills:deep-research` — 13-agent 研究团队，四索引交叉核验（Semantic Scholar + OpenAlex + Crossref + arXiv），PRISMA 系统综述模式。

**推荐配置（增强 CS 文献覆盖）：**

| MCP Server | 安装命令 | 用途 |
|------------|---------|------|
| arXiv MCP | `claude mcp add arxiv -- npx -y --package arxiv-toolkit arxiv-mcp` | 最新 preprint 搜索/下载/阅读 |
| Semantic Scholar MCP | `claude mcp add semantic-scholar -- uvx semantic-scholar-mcp` | 引用图谱/推荐/作者检索 |
| OpenAlex MCP | `claude mcp add openalex -- npx openalex-mcp` | 250M+ 论文广覆盖 |

**调用方式：**
```
# 主力：ARS 系统综述
Skill 工具:
  skill: "academic-research-skills:deep-research"
  args: "<研究问题 + Phase 1 理论地图中的概念 + 纳入标准>"

# 增强：arXiv 最新 preprint（配置 arXiv MCP 后可用）
直接使用 MCP 工具搜/读最新论文

# 增强：Semantic Scholar 引用追踪（配置 S2 MCP 后可用）
直接使用 MCP 工具查引用图谱和推荐
```

**产出：** `research/literature-review.md` + `research/references.bib`

> Gate 2 → 引用可验证、覆盖核心文献、时效性合格。

---

## Phase 3: 实证设计

**跳过条件：** 纯理论/思辨/概念分析/CS 算法理论/数学证明类论文 → 跳过。AI 判断：涉及实证数据收集（实验/benchmark/调查/访谈/二手数据）→ 运行；仅概念分析或数学/算法推导 → 跳过。

**流程：**
1. 假设陈述 — 基于 Phase 1-2 的 gap analysis
2. 方法选择 — 实验/准实验/调查/案例分析/计量经济学
3. 实验方案 — 变量定义、样本说明、数据收集方案、统计方法预先指定
4. 执行（如可行）— Python/R 脚本，实时监控
5. 结果记录 — `results.json` + `experiment_summary.md`

**产出：** `research/experiment-design.md` + `research/results.json`（如执行）

> Gate 3（仅运行此阶段时）→ 假设明确、方法恰当、变量定义清晰。

---

## Phase 4: 数据图表

**跳过条件：** 无可量化结果需可视化 → 跳过。AI 判断：Phase 3 产生了数据 or 用户有二手数据需图表呈现 → 运行；纯理论论证无图表需求 → 跳过。

**图表方式（选一）：**
1. Python matplotlib/seaborn/plotly → PNG/SVG
2. Markdown 表格 → 嵌入报告
3. 占位符 → `[Figure X: 描述]`，后续手动替换

**每张图表必须：** 承载非平凡洞见、标题含结论（不只描述）、正文引用

**产出：** `figures/` + 嵌入图表的报告草稿

> Gate 4（仅运行此阶段时）→ 图表有洞见、标题含结论、正文引用。

---

## Phase 5: 初稿撰写（PaperOrchestra 风格 5-Agent Drafting）

灵感来源：PaperOrchestra (Song et al., arXiv:2604.05018, 2026)。核心理念：先 outline 定结构，再并行拉图表+验文献，再单次综合写作成稿，最后迭代打磨。共 ~10-15 次 LLM 调用（vs PaperOrchestra 原版 ~60-70 次，轻量适配版）。

### 前置条件

进入 Phase 5 前确认：
- `research/literature-review.md` + `research/references.bib` 已就绪（Phase 2 产出）
- 如有实验数据：`research/results.json` + `research/experiment_summary.md` 已就绪（Phase 3-4 产出）
- 如有图表：`figures/` 目录已就绪（Phase 4 产出）
- 确认目标投稿 venue（如 NeurIPS / ICML / ACL / 无特定 venue → 通用学术写作）

### 5a: Outline Generation（1 次 LLM 调用）

基于所有已有材料生成论文大纲 `outline.json`：

**输入：**
- `literature-review.md` — related work 覆盖范围
- `experiment_summary.md` / `results.json` — 实验结果（如有）
- 目标 venue 信息

**Outline 结构：**
```json
{
  "title": "working title",
  "core_claim": "one-sentence contribution",
  "narrative_tension": "gap this paper fills",
  "figure_plan": [
    {"figure_id": "fig_xxx", "type": "plot|diagram", "data_source": "results.json|literature", "caption_hint": "..."}
  ],
  "section_plan": [
    {"section": "Introduction", "key_points": [...], "citation_hints": [...]},
    {"section": "Related Work", "clusters": [{"name": "...", "papers": [...], "limitation": "..."}]},
    {"section": "Method", "key_points": [...]},
    {"section": "Experiments", "subsections": [...], "tables": [...]},
    {"section": "Conclusion", "key_points": [...]}
  ]
}
```

> Gate 5a → Outline 包含所有必要 section、citation_hints 覆盖所有声称、figure_plan 与实验数据对应。

### 5b: 并行处理 — 图表生成 ∥ 文献审核（可并发）

启动 **两个独立子 Agent** 并行工作（Claude Code 支持多子 Agent 并发）：

**Sub-Agent A — 图表生成：**
- 按 `outline.json` 的 `figure_plan` 逐条生成图表
- 已有数据的 → 用 matplotlib/seaborn 渲染
- 无数据的 diagram → 用 Mermaid/ASCII 生成占位图，标记 `[Figure X: 描述]`
- 产出 `figures/` + `figures/captions.json`

**Sub-Agent B — 文献审核：**
- 逐条核验 `references.bib` 中每个 entry 的可验证性
- 检查 `literature-review.md` 中的引用覆盖是否遗漏关键 baseline
- 对每篇引用提取 abstract 关键信息，生成 `citation_notes.json`：`{citekey: {verified: bool, key_claim: "...", relevance: "..."}}`
- 产出 `citation_notes.json` + `gap_report.md`（遗漏文献列表）

> Gate 5b → 所有 figure 已生成或占位、citation_notes 覆盖 ≥90% 引用、gap_report 无 CRITICAL 遗漏。

### 5c: Section Writing（1 次综合 LLM 调用）

**一次性写入所有 section。** 不拆分为 per-section 调用——保持全文连贯性。

**输入：**
- `outline.json` — 结构蓝图
- `literature-review.md` — Related Work 素材
- `citation_notes.json` — 引用核验结果（确保每个 `\cite{}` 有据可查）
- `experiment_summary.md` + `results.json` — 实验数据（如有）
- `figures/` + `captions.json` — 图表
- 目标 venue 格式要求

**写作规则（内联自 PaperOrchestra Section Writing Agent）：**

| 规则 | 内容 |
|------|------|
| **反幻觉引用** | 只能 `\cite{}` 出现在 `references.bib` 中的 key。禁止编造引用。 |
| **反幻觉数字** | 所有数值必须直接源自 `results.json` 或 `experiment_summary.md`。禁止编造数字。 |
| **引用具体性** | 引用某篇论文时，从 `citation_notes.json` 中读取其 actual abstract，写具体的、有针对性的句子，而非泛泛的 "[A, B] proposed methods for X"。 |
| **图表忠实性** | 描述图表时，必须忠实于实际图像内容。不编造图表中不存在的数据趋势。 |
| **表格规范** | 使用 booktabs 风格（`\toprule`/`\midrule`/`\bottomrule`）。所有表格出现在 Conclusion 之前。 |
| **章节层级** | 如果 subsection X.1 存在，X.2 必须存在。不孤立 subsection。 |
| **保持已写 section** | Introduction 和 Related Work 在 Phase 2 中已写好的内容必须保留原文，仅调整一致性。 |
| **CS 论文语调** | 密集、客观、技术化。不写 "we believe" / "we think"，写 "we demonstrate" / "we observe"。 |

**产出：** `draft.md`（或 `draft.tex`，如用户有 LaTeX 模板）

> Gate 5c → 所有 section 已填充、无孤立 subsection、引用全部可查、图示已嵌入或占位。

### 5d: Content Refinement Loop（≤3 迭代）

对 `draft.md` 进行模拟同行评审 + 定向修改。灵感来源：PaperOrchestra Step 5 Content Refinement Agent。

**循环结构：**
```
for iter in 1..3:
    1. 模拟评审 → review.json（6 轴评分 + strengths + weaknesses）
    2. 如果 weaknesses 为空 → HALT（无待修复问题）
    3. 应用修改 → 定向修复 weaknesses
    4. 重新评分
    5. accept/revert 决策：
       - 总分上升 → ACCEPT，继续
       - 总分持平 + 子轴非负 → ACCEPT，继续
       - 总分下降 → REVERT 至上一版，HALT
       - 总分 ≥ 80/100 → HALT（已达标，无需过度打磨）
```

**6 轴评分维度：**
1. Scientific Depth — 科学深度
2. Technical Execution — 技术执行
3. Logical Flow — 逻辑流畅性
4. Writing Clarity — 写作清晰度
5. Evidence Presentation — 证据呈现
6. Academic Style — 学术规范

**Devil's Advocate 角色：**
每次评审中，一个子 Agent 扮演 DA，专注攻击核心 claim：
- 因果过声称（correlation ≠ causation）
- 基线公平性（baseline 是否被正确调优）
- 泛化过声称（in-domain → out-of-domain 的跳跃）
- Novelty 与 prior work 的重叠未承认

DA 发出的 CRITICAL 如果未被充分回应，覆盖 score 判定 → 强制 REVERT。

**Halt Rules（任一触发即停止）：**
1. 迭代次数到达 3
2. 总分下降（REVERT）
3. 无新 actionable weaknesses
4. 总分 ≥ 80（Accept 档位，提前终止）
5. DA CRITICAL 未被解决（强制 REVERT 后停止）

**产出：** `draft_final.md`（或 `.tex`）+ `refinement_log.md`（每轮评分历史 + 修改记录）

> Gate 5 → Outline 完整、所有 section 填充、引用可查、无数值幻觉、refinement 总分 ≥ 60（Major Revision 以上）。

---

## Phase 6: 同行评审与范文校准

**两部分并行：**

### 6a: 同行评审

**工具：** `academic-research-skills:ars-reviewer`

**调用方式：**
```
Skill 工具:
  skill: "academic-research-skills:ars-reviewer"
  args: "Review this research report. Full mode. Report path: <报告绝对路径>."
```

**评审团队：** EIC + Reviewer 1（方法论/实验设计）+ Reviewer 2（领域理论/related work 覆盖）+ Reviewer 3（数据/引用/可复现性审计）+ Devil's Advocate（前提攻击/contribution 质疑）

**独立审计增强：** 启动多角色子 Agent 并行评审（方法论专家 / 数据侦探 / 前提攻击者），结果汇总比对。

**多代理独立审计机制：**

Claude Code 多子 Agent 并行独立审计：
- 每个子 Agent 使用不同系统提示词，扮演不同角色
- 方法论专家 / 数据侦探 / 前提攻击者（Devil's Advocate）
- 各自独立评审，结果汇总比对
- 共享认知框架局限（frame-lock）通过角色差异化提示词缓解

**优势：**
- 零配置——无需额外 API key 或模型部署
- 用户当前配置的模型即用
- 多角色交叉审计覆盖率优于单一视角

### 6b: 范文校准（后置）

**核心原则：** 范文不进主生成流程。初稿完成后，找同类型顶会/顶刊范文做对照——范文是校准工具，不是思维模具。

**流程：**
1. **确定研究贡献类型** — 六选一：
   - A. 新系统/新方法（new system, algorithm, framework, or tool）
   - B. 实证/实验研究（empirical study, benchmark, measurement）
   - C. 理论/形式化（theory, formal proof, mathematical analysis）
   - D. 新兴现象理论建构（novel phenomenon conceptualization）
   - E. 跨学科创新（cross-disciplinary synthesis）
   - F. 批判/综述（critical review, meta-analysis, SoK）
2. **搜索匹配范文** — 按贡献类型搜 3-5 篇范文。CS：搜同类顶会/顶刊（ACL/ICML/NeurIPS/OSDI/PLDI 等）；社科：搜顶刊范文。不限子主题，只要求同类型
3. **拆解对照** — 提取范文的论证结构（不是内容），对照初稿：论证链条完整度？逻辑推进同深度？审稿人会接受的论证标准？
4. **输出差距报告** — 识别改进点，不自动改写

**评审评分标准（参考 NeurIPS 6-point scale）：**

| 维度 | 评审关注点 |
|------|-----------|
| **Quality** | 技术正确性、claim 是否有充分证据支撑 |
| **Clarity** | 写作清晰度、专家是否可复现 |
| **Significance** | 社区影响力、是否推进领域理解 |
| **Originality** | 新洞见（不要求新方法，新视角也算） |

评分：6=Strong Accept / 5=Accept / 4=Borderline Accept / 3=Borderline Reject / 2=Reject / 1=Strong Reject

**产出：** `research/review-report.md`（含评分 + CRITICAL/MAJOR/MINOR + 弱点路由标签 + 范文对照差距）

> Gate 6 → 所有已运行 Gate 通过、分数达标、范文对照无结构性缺陷。

---

## 弱点路由表

Phase 6 发现的问题按此表定向路由，不盲目重试全文。

| 评审发现 | 路由目标 | 操作 |
|---------|---------|------|
| "概念联想缺乏语境支撑 / 理论/技术选择随机" | Phase 1 | 重新搜索锚点材料，加强语境锚定 |
| "相关 work 覆盖不足 / missing key baselines" | Phase 2 | 补充文献搜索，查引用图谱找遗漏工作 |
| "引用覆盖不足 / 关键文献缺失" | Phase 2 | ARS deep-research 定向补充 |
| "引用来源不可验证" | Phase 2 | 逐条核验，无法验证的标注或替换 |
| "缺乏实证 / 实验方法不严谨" | Phase 3 | 补充实验设计或统计方法 |
| "数据表格不可比较 / 缺可视化" | Phase 4 | 重组图表、补充误差信息 |
| "章节结构混乱 / 逻辑跳跃" | Phase 5 | 重新生成 outline，重跑 section writing |
| "分析深度不足 / 论证薄弱" | Phase 7 | 增加批判性分析段落 |
| "论断过强 / 缺乏限定词" | Phase 7 | 降级为 hedge language |
| "与顶刊/顶会范文论证标准差距大" | Phase 7 | 对照范文论证结构增强 |
| "引用格式不统一 / 页数超标" | Phase 8 | 重新格式化 |

---

## Phase 7: 路由修订与交付

**工具：** Ralph Loop（增强定向路由）

**工作流：**
1. 读取 `review-report.md` 问题清单 + 范文差距报告
2. 按**弱点路由表**将问题分发到对应 Phase
3. 定向修复（非全文重写）
4. 修复后重新触发 Phase 6 评审
5. 最多 5 轮迭代
6. 所有 CRITICAL 清零 + 评审分数达标 → 进入 Phase 8

**调用方式：**
```
Skill 工具:
  skill: "ralph-loop:ralph-loop"
  args: "根据 review-report.md 中的评审意见和范文对照差距，
         按弱点路由表定向修复。
         每轮修复后重新评审。最多 5 轮。
         评审报告: <review-report.md 绝对路径>
         待修复报告: <报告绝对路径>"
```

> Gate 7 → 所有 CRITICAL 清零、评审分数达标、DA 无 standing CRITICAL。

---

## Phase 8: 终稿格式化

根据目标 venue 应用格式规范 + 最终校验。

### 8a: CS 顶会要求速查

| Conference | Page Limit | Camera-Ready | Key Requirement |
|------------|------------|-------------|-----------------|
| **NeurIPS 2025** | 9 pages | +0 | Mandatory checklist, lay summary |
| **ICML 2026** | 8 pages | +1 | Broader Impact Statement |
| **ICLR 2026** | 9 pages | +1 | LLM disclosure, reciprocal reviewing |
| **ACL 2025** | 8 pages (long) | varies | Limitations section mandatory |
| **AAAI 2026** | 7 pages | +1 | Strict style file adherence |
| **COLM 2025** | 9 pages | +1 | Language model focus |
| **通用学术** | 按目标期刊 | — | APA 7.0 / IEEE / Chicago |

**通用规则：** 参考文献不计入页数、附录无上限但审稿人无义务阅读、double-blind 需匿名化。

### 8b: 引用校验与反幻觉

**核心原则：AI 生成引用有 ~40% 错误率。绝不凭记忆写 BibTeX。**

引用校验流程：
1. 逐条读取 `references.bib` 中每个 key
2. 通过 Semantic Scholar API / CrossRef API 验证论文确实存在
3. 交叉核验：至少 2 个来源确认（Semantic Scholar + arXiv/CrossRef）
4. 逐个检查 `\cite{KEY}` 出现在 `references.bib` 中（无 orphan citation）
5. 逐个检查 `references.bib` 中每个 entry 都被引用（无 unused reference）

**失败处理：**
- 无法验证的引用 → 标记 `[CITATION NEEDED - verify]`，告知用户
- 不确定论文是否存在 → **绝不引用**，先搜索或标 placeholder
- 格式统一为 venue 要求（ACL → ACL style、ICML → ICML style、通用 → APA 7.0）

### 8c: 学术写作质量终检（Gopen & Swan 7 原则 + 社区实践）

**A. 结构层面（Gopen & Swan 读者期望原则）：**

| 原则 | 规则 | 检查 |
|------|------|------|
| 主谓靠近 | Subject 和 verb 不要隔太远 | 主语后有长插入语分隔动词？ |
| 强调位置 | 句末是读者自然关注的位置 | 关键数字/结论放在句末而非句首？ |
| 话题位置 | 句首放上下文，句末放新信息 | 每句话是否从已知过渡到未知？ |
| 旧先于新 | 熟悉信息先出现，新信息后出现 | 是否先 link back 再引入新内容？ |
| 一段一功能 | 每段只做一个点 | 是否有段落塞了 2+ 个独立观点？ |
| 动作在动词 | 用动词而非名词化 | "we analyzed" 而非 "we performed an analysis" |
| 语境先于内容 | 先设舞台再呈现 | 公式/图表前有一句解释？ |

**Abstract 5 句公式（Farquhar）：**
1. What you achieved: "We introduce/prove/demonstrate..."
2. Why hard/important
3. How you do it (含专业关键词，提升可发现性)
4. What evidence you have
5. Most remarkable number/result

删除万能开头："Large language models have achieved remarkable success..."——任何 ML 论文都能用这句话开头。

**B. 论证层面：**
- 每个 claim 是否有证据支撑（实验数据 / 引用 / 逻辑推导）
- 无 "could potentially maybe" 三连限定词堆砌
- 无不必要的 "our work" / "we believe"

**C. 语言层面（Lipton 选词原则 + Perez 微技巧）：**
- 精确：❌ "performance" → ✅ "accuracy" 或 "latency"
- 删多余限定：Drop "may" / "can" 除非真不确定
- 删多余强化：❌ "provides *very* tight approximation" → ✅ "provides tight approximation"
- 删填充词：删除 "actually" / "a bit" / "very" / "really" / "basically" / "quite" / "essentially"
- 少代词：❌ "This shows..." → ✅ "This result shows..."
- 无 AI 味堆砌："moreover" / "furthermore" / "additionally" 连续出现
- 无空洞评价："significantly outperforms" 无具体数字

**D. 图表层面：**

表格（booktabs 风格）：
- `\toprule` / `\midrule` / `\bottomrule`（不用竖线）
- Bold 每列最优值，标注方向符号（↑ higher=better, ↓ lower=better）
- 数值列右对齐，小数位一致

图：
- 矢量图（PDF/EPS）用于所有 plot 和 diagram
- 使用 colorblind-safe palette（Okabe-Ito 或 Paul Tol），验证灰度可读性（8% 男性色觉障碍）
- Caption 自包含（读者不看正文也能理解图）
- Caption 含结论（不是 "Accuracy vs epochs" 而是 "Model X achieves 2.3x faster convergence than baseline Y"）
- 正文引用每张图表、编号连续无跳号

**E. 引用层面：**
- "et al." 全文一致
- 无引用堆砌（一句 cite 5+ 篇 = 每篇都没说清为什么引用）
- 关键 baseline 引用原始论文非二手引用
- Related Work 按方法论聚类，不逐篇罗列
- 慷慨引用——审稿人很可能就是相关论文作者

### 8d: 常见问题诊断

| 症状 | 诊断 | 修复 |
|------|------|------|
| Abstract 万能开头 | 首句可 prepend 到任何 ML 论文 | 从具体贡献开始写 |
| Introduction 超 1.5 页 | 背景太多 | 拆分到 Related Work，front-load contribution |
| 实验缺乏明确 claim | 读者不知道为什么看这个实验 | 每个实验前加："This experiment tests whether [claim]..." |
| 读者反馈难理解 | 无导航句、术语不一致 | 加 "In this section, we show X"；全文统一术语 |
| 缺统计显著性 | 只有均值无分散度 | 加 error bars（标注 std dev/error）、运行次数、统计检验 |

### 8e: 投稿 Checklist 生成

根据目标 venue 生成对应的投稿 checklist：
- 页数是否合规（参考文献不计、附录不计）
- 匿名化是否完成（如 double-blind）
- 补充材料是否齐全
- 特定 venue 要求：NeurIPS checklist / ICML Broader Impact / ICLR LLM disclosure

**产出：** `final_report.md`（或 `final/paper.tex` + `final/paper.pdf`）+ `submission_checklist.md`

> Gate 8 → 引用全部可验证（0 placeholder）、页数合规、模板正确、checklist 全通过、写作质量 5 类检查通过。
