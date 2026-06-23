---
name: research-assistant-enzo
description: Academic Research Assistant v4.0 — 6-phase iterative loop: problem anchoring & theory discovery → literature search → empirical design → data/figures → peer review & template calibration → revision & delivery. CS/STEM + social sciences + humanities. Flexible entry, AI judges starting point. Multi-agent independent audit for quality verification.
---

# Academic Research Assistant v4.0

全学科研究助手。v4.0 升级：社科/CS/STEM 平等支持 + 可组合文献数据库（arXiv / Semantic Scholar / OpenAlex MCP）。

核心机制：

- **语境锚点法（Phase 1）**：不直接从抽象主题联想。社科用深度报道/案例做锚点；CS 用 survey/SoK/related work。有锚点 → 有脉络 → 文献搜索有根有据
- **范文后置校准（Phase 5）**：范文不进主生成流程。初稿完成后，找同类型顶会/顶刊范文对照论证结构——校准工具，不是思维模具
- **灵活跳转**：AI 按用户输入判断入口。理论/算法类论文实证设计和数据图表自动跳过
- **可组合文献源**：ARS deep-research（四索引交叉核验）为核心引擎；推荐配置 arXiv / Semantic Scholar / OpenAlex MCP 增强覆盖

---

## 触发方式

用户提到研究相关请求时触发。触发后回复：

> **学术研究助手 v4.0 就绪。** 说说你的研究想法，我判断从哪里开始：
> 1. 问题锚定与理论发现 → 2. 文献搜索 → 3. 实证设计 → 4. 数据图表 → 5. 同行评审与范文校准 → 6. 路由修订与交付
> 已有材料可以说一声，跳过已完成的步骤。
> 推荐：配置 arXiv / Semantic Scholar / OpenAlex MCP 增强 CS 文献覆盖。

---

## 架构

```
Phase 1: 问题锚定与理论发现
  锚点材料（CS: survey/SoK; 社科: 深度报道）→ 语境提取 → 概念联想 → 验证 → 理论/技术地图
         │
         ▼
Phase 2: 文献搜索
  ARS deep-research（核心）+ arXiv / Semantic Scholar / OpenAlex（推荐 MCP）
         │
         ▼
Phase 3: 实证设计  ◀── 理论/算法/形式化论文可跳过
  假设 → 方法 → 变量 → 数据收集方案
         │
         ▼
Phase 4: 数据图表  ◀── 无可量化结果可跳过
  matplotlib/seaborn 图表 + 表格
         │
         ▼
Phase 5: 同行评审与范文校准
  ARS reviewer（5 角色） + 多代理独立审计 + 顶刊/顶会范文对照
         │
    ┌────┴────┐
    ▼         ▼
  通过      发现问题 → 弱点路由表分发 → Phase 6
         │
         ▼
Phase 6: 路由修订与交付
  定向修复（最多 5 轮）→ 最终报告
```

---

## 质量管理关卡

每道关卡不通过不能进入下一阶段。关卡不做硬性数值阈值，但必须全部绿灯。

| 关卡 | 位置 | 检查项 |
|------|------|--------|
| **Gate 1: 锚定** | Phase 1→2 | 锚点材料已找到（CS: survey/SoK/related work; 社科: 深度报道）、语境提取完整、概念联想有锚点细节支撑、数据库验证通过 |
| **Gate 2: 文献** | Phase 2→3/5 | 引用来源可验证、覆盖核心文献、时效性满足需求 |
| **Gate 3: 实证** | Phase 3→4 | （仅运行实证设计时）假设明确、方法预先指定、变量定义清晰 |
| **Gate 4: 图表** | Phase 4→5 | （仅运行数据图表时）每张图表承载非平凡洞见、标题含结论、正文引用 |
| **Gate 5: 终审** | Phase 5→6 | 所有已运行 Gate 通过、评审分数达标、范文对照无结构性缺陷 |

---

## 弱点路由表

Phase 5 发现的问题按此表定向路由，不盲目重试全文。

| 评审发现 | 路由目标 | 操作 |
|---------|---------|------|
| "概念联想缺乏语境支撑 / 理论/技术选择随机" | Phase 1 | 重新搜索锚点材料（CS: survey/SoK; 社科: 深度报道），加强语境锚定 |
| "相关 work 覆盖不足 / missing key baselines" | Phase 2 | 补充文献搜索，查引用图谱找遗漏工作 |
| "引用覆盖不足 / 关键文献缺失" | Phase 2 | ARS deep-research 定向补充 |
| "引用来源不可验证" | Phase 2 | 逐条核验，无法验证的标注或替换 |
| "缺乏实证 / 实验方法不严谨" | Phase 3 | 补充实验设计或统计方法 |
| "数据表格不可比较 / 缺可视化" | Phase 4 | 重组图表、补充误差信息 |
| "章节结构混乱 / 逻辑跳跃" | Phase 6 | 重组章节、增加过渡 |
| "分析深度不足 / 论证薄弱" | Phase 6 | 增加批判性分析段落 |
| "论断过强 / 缺乏限定词" | Phase 6 | 降级为 hedge language |
| "与顶刊/顶会范文论证标准差距大" | Phase 6 | 对照范文论证结构增强 |

---

## 多代理独立审计

关键质量检查不能单一代理自审。启动多个独立子 Agent，戴不同眼镜交叉验证。

**机制：**

Claude Code 多子 Agent 并行独立审计：
- 每个子 Agent 使用不同系统提示词，扮演不同角色
- 方法论专家 / 数据侦探 / 前提攻击者（Devil's Advocate）
- 各自独立评审，结果汇总比对
- 共享认知框架局限（frame-lock）通过角色差异化提示词缓解

**优势：**
- 零配置——无需额外 API key 或模型部署
- 用户当前配置的模型即用
- 多角色交叉审计覆盖率优于单一视角

---

## Phase 详情

### Phase 1: 问题锚定与理论发现

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
**Gate 出口（Gate 1）：** 锚点材料已找到、语境提取完整、概念有锚点细节支撑、数据库验证通过

**推荐工具：** WebSearch（搜锚点材料）、WebFetch（获取全文）、Semantic Scholar（验证影响力）

---

### Phase 2: 文献搜索

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
**Gate 出口（Gate 2）：** 引用可验证、覆盖核心文献、时效性合格

---

### Phase 3: 实证设计

**跳过条件：** 纯理论/思辨/概念分析/CS 算法理论/数学证明类论文 → 跳过。AI 判断：涉及实证数据收集（实验/benchmark/调查/访谈/二手数据）→ 运行；仅概念分析或数学/算法推导 → 跳过。

**流程：**
1. 假设陈述 — 基于 Phase 1-2 的 gap analysis
2. 方法选择 — 实验/准实验/调查/案例分析/计量经济学
3. 实验方案 — 变量定义、样本说明、数据收集方案、统计方法预先指定
4. 执行（如可行）— Python/R 脚本，实时监控
5. 结果记录 — `results.json` + `experiment_summary.md`

**产出：** `research/experiment-design.md` + `research/results.json`（如执行）
**Gate 出口（Gate 3，仅运行此阶段时）：** 假设明确、方法恰当、变量定义清晰

---

### Phase 4: 数据图表

**跳过条件：** 无可量化结果需可视化 → 跳过。AI 判断：Phase 3 产生了数据 or 用户有二手数据需图表呈现 → 运行；纯理论论证无图表需求 → 跳过。

**图表方式（选一）：**
1. Python matplotlib/seaborn/plotly → PNG/SVG
2. Markdown 表格 → 嵌入报告
3. 占位符 → `[Figure X: 描述]`，后续手动替换

**每张图表必须：** 承载非平凡洞见、标题含结论（不只描述）、正文引用

**产出：** `figures/` + 嵌入图表的报告草稿
**Gate 出口（Gate 4，仅运行此阶段时）：** 图表有洞见、标题含结论、正文引用

---

### Phase 5: 同行评审与范文校准

**两部分并行：**

#### 5a: 同行评审

**工具：** `academic-research-skills:ars-reviewer`

**调用方式：**
```
Skill 工具:
  skill: "academic-research-skills:ars-reviewer"
  args: "Review this research report. Full mode. Report path: <report 绝对路径>."
```

**评审团队：** EIC + Reviewer 1（方法论/实验设计）+ Reviewer 2（领域理论/related work 覆盖）+ Reviewer 3（数据/引用/可复现性审计）+ Devil's Advocate（前提攻击/contribution 质疑）

**独立审计增强：** 启动多角色子 Agent 并行评审（方法论专家 / 数据侦探 / 前提攻击者），结果汇总比对。

#### 5b: 范文校准（后置）

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

**产出：** `research/review-report.md`（含评分 + CRITICAL/MAJOR/MINOR + 弱点路由标签 + 范文对照差距）
**Gate 出口（Gate 5）：** 所有已运行 Gate 通过、分数达标、范文对照无结构性缺陷

---

### Phase 6: 路由修订与交付

**工具：** Ralph Loop（增强定向路由）

**工作流：**
1. 读取 `review-report.md` 问题清单 + 范文差距报告
2. 按**弱点路由表**将问题分发到对应 Phase
3. 定向修复（非全文重写）
4. 修复后重新触发 Phase 5 评审
5. 最多 5 轮迭代
6. 所有 CRITICAL 清零 + 评审分数达标 → 生成最终报告

**调用方式：**
```
Skill 工具:
  skill: "ralph-loop:ralph-loop"
  args: "根据 review-report.md 中的评审意见和范文对照差距，
         按弱点路由表定向修复。
         每轮修复后重新评审。最多 5 轮。
         评审报告: <review-report.md 绝对路径>
         待修复报告: <report 绝对路径>"
```

**最终交付 `final-report.md`：**
- 执行摘要
- 正式章节
- 方法说明
- 研究发现
- 研究局限
- 附录（数据来源清单、可复现性说明、多代理审计记录、范文对照摘要）

---

## 灵活入口

AI 根据用户输入智能判断从哪个 Phase 开始。不需要用户声明模式。

| 用户说 | AI 判断 |
|--------|---------|
| "我想研究 X，不知道怎么入手" | Phase 1 开始 |
| "帮我针对 Y 方向做 literature review" | Phase 1→2（先确认锚点） |
| "我有个研究 idea，已有 related work" | Phase 2 开始 |
| "帮我搜 X 主题最新论文" | Phase 2 only |
| "文献综述/related work 写完了，怎么设计实验" | Phase 3 |
| "实验结果/benchmark 跑完了，帮我做图/表" | Phase 4 |
| "草稿写完了，帮我审一下" | Phase 5 |
| "rebuttal/审稿意见回来了，帮我改" | Phase 6 |
| "检查这篇论文的学术质量" | Phase 5 only |

AI 判断原则：
- 用户描述了具体方向但无锚点/理论框架 → Phase 1
- 用户有方向框架但缺文献覆盖 → Phase 2
- 用户明确提到"已有 related work/literature review" → 跳过 Phase 2
- 纯理论/算法/形式化/思辨论文 → 自动跳过 Phase 3-4
- 不确定时，问用户确认，不猜测

---

## 首次使用：检查依赖

```bash
bash setup.sh
```

安装 ARS + Ralph Loop。

**推荐 MCP 配置（增强 CS 文献覆盖）：**

```bash
# arXiv MCP：最新 preprint 搜索/下载/阅读
claude mcp add arxiv --scope user -- npx -y --package arxiv-toolkit arxiv-mcp

# Semantic Scholar MCP：引用图谱 + 推荐
claude mcp add semantic-scholar --scope user -- uvx semantic-scholar-mcp

# OpenAlex MCP：250M+ 论文广覆盖
claude mcp add openalex --scope user -- npx openalex-mcp
```

---

## 工具箱

| 工具 | 用途 | 安装方式 |
|------|------|----------|
| **Academic Research Skills** | 文献搜索 + 同行评审 | `bash setup.sh`（必须） |
| **Ralph Loop** | 路由修订迭代 | `bash setup.sh`（必须） |
| **arXiv MCP** | 最新 preprint 搜索/下载/阅读 | `claude mcp add ...`（推荐） |
| **Semantic Scholar MCP** | 引用图谱/推荐/作者检索 | `claude mcp add ...`（推荐） |
| **OpenAlex MCP** | 250M+ 论文广覆盖 | `claude mcp add ...`（可选） |

---

## GPT Researcher 重新启用指南

**状态：暂时搁置，非永久移除。** v1.0 演示中产生 100% 幻觉引用，v2.0 起默认不用。若未来 ARS deep-research 对特定领域覆盖不足或 GPT Researcher 升级改善引用准确性，可重新启用。

**重新启用：**
1. 确认安装：`pip list | grep gpt-researcher`
2. Phase 2 切换搜索引擎为 GPT Researcher
3. 搜索后务必跑 Phase 5 引用审计逐条验证

---

## 适用 / 不适用

**适用：** CS/STEM/社科/人文论文全流程、文献综述、系统综述/SoK、投稿前完整性审计、灰色文献搜集、技术报告

**不适用：** 替代人工同行评审（顶会/顶刊最终决定）、需机构伦理审查的高度敏感研究

---

## 质量原则

1. **每阶段确认。** 用户说"继续"前不进入下一阶段
2. **语境优先。** AI 找理论前必须先有语境锚点。禁止直接从抽象主题跳理论联想
3. **范文后置。** 范文不进主生成流程。初稿完成后再对照校准
4. **溯源清晰。** 所有数据点标注来源和可信度
5. **因果克制。** 不加控制变量时不作因果断言
6. **独立审计。** 关键检查不靠单一代理自审，多角色子 Agent 并行交叉验证
7. **定向修复。** 评审发现按弱点路由表分发，不盲目重试
8. **工具真实调用。** 不手动模拟工具行为，必须 invoke 对应 Skill
9. **错误透明。** 工具调用失败报告具体错误，不假装成功

---

## 概念来源

| 概念 | 来源 |
|------|------|
| 迭代环 + 弱点路由表 + 质量关卡 | 陈德里 DeliAutoResearch (2026) |
| 语境锚点法 | 孙宇凡 "AI赋能理论框架三步法" |
| 范文后置校准 | 孙宇凡 "AI仿写顶刊四步法" |
| CS/STEM 锚点扩展（survey/SoK）+ 贡献类型 | 社区贡献 |
| 可组合文献数据库（arXiv/S2/OpenAlex MCP） | 社区贡献 |
| 多代理独立审计 | Claude Code 多子 Agent 并行评审 |
| Ralph Loop | Claude Code 官方插件 |
| Devil's Advocate 让步门槛 | ARS v3.0 |
| 四索引交叉核验 | ARS v3.11.0 |
