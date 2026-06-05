---
name: social-research-assistant
description: 社科研究助手 v2.0 — 当用户说"用社科研究助手"、"帮我做个研究"、"文献调研"、"系统综述"、"学术质量检查"等研究相关请求时，加载此技能。迭代环架构：研究设计 → 文献搜索 → 实验设计 → 图表结构 → 同行评审 → 路由修订 → 交付。内置质量关卡 + 弱点路由表 + 跨模型交叉验证。
---

# Social Research Assistant v2.0

社科研究全流程 AI 助手。v2.0 从线性流水线重构为**迭代环架构**——评审发现的问题自动路由回对应子技能重做，而非盲目重试。

> 灵感来源：DeliAutoResearch（陈德里，DeepSeek）的层级化技能组 + 弱点路由表 + 质量管理关卡体系。

---

## 触发方式

当用户说以下任意一句话时，技能触发：

- **"用社科研究助手"**
- "帮我做个社科研究" / "帮我做文献调研" / "帮我做系统综述"
- "检查这篇报告的质量 / 学术诚信"
- 其他明显与研究相关的请求

**触发后，回复用户：**

> **社科研究助手 v2.0 就绪。** 输入你的研究问题，我带你走迭代环：
> 1. 研究设计 → 2. 文献搜索 → 3. 实验设计 → 4. 图表 & 结构 → 5. 同行评审 → 6. 路由修订 → 7. 交付
> 每阶段结束等你确认。发现的问题自动路由回对应子技能重做。

---

## 架构：迭代环 + 弱点路由

```
                        ┌──────────────────────────────────┐
                        │        Phase 5: 同行评审           │
                        │   ARS Reviewer + 跨模型交叉验证     │
                        └──────────────┬───────────────────┘
                               │ 发现问题？
                    ┌──────────┴──────────┐
                    ▼                     ▼
            ┌──────────────┐      ┌──────────────┐
            │  Gate 跳过？  │      │ 弱点路由表    │
            │ → 进入交付    │      │ 自动分发到    │
            └──────────────┘      │ 对应子技能    │
                                  └──┬───┬───┬──┘
                                     │   │   │
                         ┌───────────┘   │   └───────────┐
                         ▼               ▼               ▼
                  ┌──────────┐  ┌──────────────┐  ┌──────────┐
                  │文献搜索   │  │实验设计       │  │图表/结构  │
                  │(Phase 2) │  │(Phase 3)     │  │(Phase 4) │
                  └──────────┘  └──────────────┘  └──────────┘
                         │               │               │
                         └───────────────┴───────────────┘
                                         │
                                         ▼
                              ┌──────────────────┐
                              │ Phase 6: 路由修订  │
                              │ Ralph Loop（定向） │
                              └──────────────────┘
                                         │
                                         ▼
                              ┌──────────────────┐
                              │ Phase 7: 交付     │
                              └──────────────────┘
```

**关键区别（v1.0 → v2.0）：**
- v1.0：审完用 Ralph Loop 盲目重试，不知道找哪个子技能改
- v2.0：评审结果按弱点路由表分发到对应子技能，定向修复后再审

---

## 质量管理关卡

每道关卡不通过，不能进入下一阶段。关卡阈值不做硬性数值要求，但必须全部绿灯。

| 关卡 | 位置 | 检查项 |
|------|------|--------|
| **Gate 1: 文献** | Phase 2→3 | 引用来源可验证、覆盖领域核心文献、时效性满足研究需求、关键主张有文献支撑 |
| **Gate 2: 实验** | Phase 3→4 | 研究假设明确、统计方法预先指定、控制变量合理、样本/数据来源清晰 |
| **Gate 3: 结构 & 图表** | Phase 4→5 | 章节逻辑连贯、段落间有过渡、每张图表承载非平凡洞见、图表在正文中被引用 |
| **Gate 4: 终审** | Phase 5→6 或 7 | 所有 Gate 1-3 通过、同行评审分数达标、先前已修复问题无回归 |

---

## 弱点路由表

同行评审发现的问题按此表路由到对应子技能，而非盲目重试。

| 评审发现 | 路由目标 | 操作 |
|---------|---------|------|
| "引用覆盖不足 / 关键文献缺失" | 文献搜索 | ARS deep-research 定向补充搜索 |
| "引用来源不可验证" | 文献搜索 | 逐条核验，无法验证的标注或替换 |
| "缺乏实证研究 / 实验" | 实验设计 | 设计实验方案并执行 |
| "实验方法不严谨 / 缺统计检验" | 实验设计 | 补充统计方法、增加试验次数 |
| "章节结构混乱 / 逻辑跳跃" | 结构 & 逻辑 | 重组章节 + 增加过渡段落 |
| "分析缺乏深度 / 论证薄弱" | 结构 & 逻辑 | 增加批判性分析段落 |
| "论断过强 / 缺乏限定词" | 结构 & 逻辑 | 降级为 hedge language |
| "数据表格不可比较" | 图表 | 重组表格 + 增加对比列 |
| "缺少可视化 / 图表" | 图表 | 新增图表 |
| "无误差信息 / 缺标准差" | 图表 | 补充 ± std / 置信区间 |

---

## 跨模型交叉验证

**核心原则：** 关键质量检查不能只靠一个模型自己审自己。必须引入第二个模型做独立验证。

### 策略

```
检测环境变量:
  GPT_5_4_API_KEY 存在且可调用?
    ├── 是 → 使用 GPT 5.4 执行交叉验证
    └── 否 → Fallback: 使用当前 Claude Code 模型（DeepSeek V3 Pro）的不同子 Agent
              + 不同的系统提示词角色（方法论专家 / 数据侦探 / 前提攻击者）
```

### 实现

**GPT 5.4 可用时：**
- Phase 5 同行评审的 integrity verification（Stage 2.5/4.5）使用 GPT 5.4
- ARS 环境变量设置：`ARS_CROSS_MODEL=1`，base URL 和 API key 从 `GPT_5_4_API_KEY` / `GPT_5_4_BASE_URL` 读取
- 两个独立模型串通概率极低 → 交叉验证可信度显著提升

**Fallback（GPT 5.4 不可用时）：**
- 仍使用当前模型，但通过**不同角色提示词**启动多个子 Agent
- Reviewer 1（方法论专家）≠ Reviewer 2（领域理论家）≠ Reviewer 3（数据侦探）≠ Devil's Advocate（前提攻击者）
- 这是"戴上不同眼镜"策略——同一模型但不同认知框架，能发现不同类别的问题
- 局限性：共享同一认知框架（frame-lock），无法完全替代跨模型验证

**启动时检测逻辑：**
```bash
# 检测 GPT 5.4 可用性
if curl -s -f -o /dev/null -H "Authorization: Bearer $GPT_5_4_API_KEY" "$GPT_5_4_BASE_URL/models"; then
    echo "GPT 5.4 可用，启用跨模型交叉验证"
    export ARS_CROSS_MODEL=1
else
    echo "GPT 5.4 不可用，使用多角色子 Agent Fallback"
fi
```

---

## 子技能详情

全部写在本文件中，不拆分为多个文件。

---

### 子技能 1：研究设计（Research Design）

**位置：** Phase 1
**工具：** 手动撰写（辅助：OpenSpec 可选）

**产出 `research/spec.md`，包含：**
- 研究问题拆解（主问题 → 子问题）
- 纳入/排除标准
- 数据来源清单
- 分析方法说明
- 假设（如有实证研究）
- 质量门禁标准

**Gate 入口：** 无（Phase 1 是入口）
**Gate 出口：** 用户确认 spec 后才能进入 Phase 2

---

### 子技能 2：文献搜索（Literature Search）

**位置：** Phase 2
**工具：** ARS deep-research（替代 v1.0 的 GPT Researcher）

**调用方式：**
```
Skill 工具:
  skill: "academic-research-skills:deep-research"
  args: "<研究问题 + spec.md 中的纳入标准 + 数据源要求>"
```

**为什么不用 GPT Researcher：**
> **状态：暂时搁置，非永久移除。** 在演示研究中，GPT Researcher 产生的参考文献 100% 为幻觉引用（Phase 3 引用审计结论）。可能原因包括：(1) DuckDuckGo 搜索引擎的限制；(2) DeepSeek 模型在学术引用生成上的不足；(3) GPT Researcher 配置未优化。如果未来发现 ARS deep-research 在某些场景覆盖不足，可以重新启用 GPT Researcher 作为补充引擎。重新启用的入口点见本文末尾"GPT Researcher 重新启用指南"。

**ARS deep-research 优势：**
- 13-agent 研究团队（bibliography → synthesis → field analysis → report compiler）
- 内置 Semantic Scholar API 引用验证（v3.11.0 四索引交叉核验：S2 + OpenAlex + Crossref + arXiv）
- PRISMA 系统综述模式
- 引用幻觉率远低于 GPT Researcher

**产出：** `research/literature-review.md` + `research/references.bib`
**Gate 出口（Gate 1）：** 引用来源可验证、覆盖核心文献、时效性合格

---

### 子技能 3：实验设计（Experiment Design）

**位置：** Phase 3（文献搜索完成后）
**说明：** 实证研究不可省略。纯文献综述可跳过此阶段。

**流程：**
1. **假设陈述** — 基于文献搜索的 gap analysis，明确研究假设
2. **方法选择** — 确定研究范式（实验/准实验/调查/案例分析/计量经济学）
3. **实验方案** — 变量定义、样本说明、数据收集方案、统计方法预先指定
4. **执行**（如可行）— Python/R 脚本执行，实时监控
5. **结果记录** — `results.json` + `experiment_summary.md`

**产出：** `research/experiment-design.md` + `research/results.json`（如执行）
**Gate 出口（Gate 2）：** 假设明确、方法恰当、变量定义清晰

---

### 子技能 4：图表 & 结构（Figures, Tables & Structure）

**位置：** Phase 4
**说明：** 图表生成与结构整理可并行进行。

#### 4a：图表（Figures & Tables）

**LaTeX 不是必须的。** 图表适配器支持以下任一方式：
1. **Python 图表**（推荐）— matplotlib / seaborn / plotly 生成 PNG/SVG
2. **Markdown 表格** — 直接嵌入报告
3. **占位符** — 标注 `[Figure X: 描述]` / `[Table X: 描述]`，后续手动替换

每张图表必须：承载非平凡洞见、标题含结论（不只描述）、正文引用。

#### 4b：结构 & 逻辑（Structure & Logic）

- 章节架构设计
- 段落间逻辑链 + 过渡
- 摘要-结论对齐
- 批判性分析段落（非纯描述）
- 术语一致性

**产出：** `figures/` + 嵌入图表的报告草稿
**Gate 出口（Gate 3）：** 结构连贯、图表有洞见、引用到位

---

### 子技能 5：同行评审（Peer Review）

**位置：** Phase 5
**工具：** ARS reviewer + 跨模型交叉验证

**调用方式：**
```
Skill 工具:
  skill: "academic-research-skills:ars-reviewer"
  args: "Review this research report. Full mode. Report path: <report 绝对路径>."
```

**评审团队：** EIC（主编） + Reviewer 1（方法论） + Reviewer 2（领域理论） + Reviewer 3（数据/引用审计） + Devil's Advocate（前提攻击）

**交叉验证增强：**
- 若 GPT 5.4 可用：integrity verification 阶段用 GPT 5.4 独立审计
- 若不可用：Fallback 到多角色子 Agent（见跨模型交叉验证章节）

**产出：** `research/review-report.md`（含评分 + CRITICAL/MAJOR/MINOR 问题清单 + 弱点路由标签）
**Gate 出口（Gate 4）：** 所有 Gate 1-3 通过 + 评审分数达标 + 无回归

---

### 子技能 6：路由修订（Routed Revision）

**位置：** Phase 6
**工具：** Ralph Loop（增强：定向路由而非盲目重试）

**工作流：**
1. 读取 `review-report.md` 中的问题清单
2. 按**弱点路由表**将每个问题分发到对应子技能
3. 子技能执行定向修复（而非全文重写）
4. 修复完成后重新触发 Phase 5 评审
5. 重复直到所有 CRITICAL 清零 + 评审分数达标
6. 最多 5 轮迭代（v1.0 是 3 轮）

**调用方式：**
```
Skill 工具:
  skill: "ralph-loop:ralph-loop"
  args: "根据 review-report.md 中的评审意见，
         按弱点路由表定向修复：
         - 引用问题 → 重新搜索文献
         - 实验问题 → 重新设计/补充实验
         - 结构问题 → 重组章节
         - 图表问题 → 重新生成图表
         每轮修复后重新评审。
         最多 5 轮。
         评审报告路径: <review-report.md 绝对路径>
         待修复报告路径: <report 绝对路径>"
```

**Ralph Loop 增强说明：**
v1.0 的 Ralph Loop 对每个问题"尝试修复 → 检查 → 不通过换策略重试"，但不知道找谁修。
v2.0 通过弱点路由表告知 Ralph Loop 每个问题对应哪个子技能，实现定向修复。

---

### 子技能 7：交付（Delivery）

**位置：** Phase 7
**工具：** 手动撰写

**产出 `final-report.md`，包含：**
- 执行摘要
- 正式章节（第一章、第二章...）
- 方法说明
- 研究发现
- 研究局限
- 附录（数据来源清单、可复现性说明、跨模型验证记录）

---

## 你也可以只做某一步

| 你说 | 助手做什么 |
|------|-----------|
| "帮我搜一下 X 主题的文献" | 直接跑 Phase 2（ARS deep-research） |
| "帮我设计一个实验" | 直接跑 Phase 3 |
| "检查一下这篇报告的质量" | 直接跑 Phase 5（ARS reviewer + 跨模型验证） |
| "这篇写得不行，按评审意见改" | 直接跑 Phase 6（路由修订） |
| "生成最终报告" | 直接跑 Phase 7 |

---

## 首次使用：检查依赖

```bash
bash setup.sh
```

安装 ARS + Ralph Loop。OpenSpec 可选（研究设计阶段手动撰写也够用）。

---

## 工具箱（v2.0）

| 工具 | 用途 | 状态 |
|------|------|------|
| **Academic Research Skills** | 文献搜索（deep-research）+ 同行评审（reviewer） | 核心引擎 |
| **Ralph Loop** | 路由修订迭代 | 增强定向路由 |
| **OpenSpec** | 研究设计（可选） | 辅助 |
| **GPT 5.4**（可选） | 跨模型交叉验证 | 有 API key 时启用 |

**已移除（v2.0）：** ~~GPT Researcher~~ → 暂时搁置，见下方说明。

---

## GPT Researcher 重新启用指南

**状态：暂时搁置，非永久移除。**

GPT Researcher 在 v1.0 演示中产生 100% 幻觉引用，因此 v2.0 默认不使用它。但如果未来以下情况发生，可以考虑重新启用：

**场景 1：** ARS deep-research 对特定领域（如中文社会科学文献）覆盖不足
**场景 2：** GPT Researcher 升级后改善了引用准确性
**场景 3：** 换了更好的搜索引擎（如 Tavily API 替代 DuckDuckGo）

**重新启用方法：**
1. 确认 GPT Researcher 已安装：`pip list | grep gpt-researcher`
2. 在 Phase 2 时，将搜索引擎从 ARS deep-research 切换为 GPT Researcher
3. 搜索完成后，务必跑 Phase 5 的引用审计（ARS reviewer）逐条验证

**原调用代码保留如下：**
```bash
export OPENAI_API_KEY="<key>"
export OPENAI_BASE_URL="https://api.deepseek.com/v1"
export RETRIEVER="duckduckgo"

python -c "
from gpt_researcher import GPTResearcher
import asyncio, os

async def main():
    os.environ['RETRIEVER'] = 'duckduckgo'
    os.environ['FAST_LLM'] = 'deepseek-chat'
    os.environ['SMART_LLM'] = 'deepseek-chat'
    os.environ['STRATEGIC_LLM'] = 'deepseek-chat'
    
    researcher = GPTResearcher(
        query='<用户研究问题>',
        report_type='research_report'
    )
    await researcher.conduct_research()
    report = await researcher.write_report()
    print(report)

asyncio.run(main())
" > research-report.md
```

---

## 适用 / 不适用

**适用：** 文献综述、系统综述、实证研究（含实验设计）、投稿前完整性审计、灰色文献搜集

**不适用：** 高度原创理论建构、高度敏感的定性研究、替代人工同行评审

---

## 质量原则

1. **每阶段确认。** 用户说"继续"之前不能进下一阶段。
2. **溯源清晰。** 所有数据点标注来源和可信度。
3. **因果克制。** 不加控制变量时不作因果断言。
4. **交叉验证。** 关键检查不能用单一模型自己审自己。
5. **定向修复。** 评审发现的问题按弱点路由表分发，不盲目重试。
6. **工具真实调用。** 不要手动模拟工具行为——必须 invoke 对应 Skill。
7. **错误透明。** 工具调用失败时报告具体错误，不假装成功。

---

## 概念来源

| 概念 | 来源 |
|------|------|
| 迭代环 + 弱点路由表 + 质量关卡 | 陈德里 DeliAutoResearch (2026) |
| 多 Agent 交叉验证 | GPT Researcher + ARS |
| Ralph Loop | 官方 Claude Code 插件 |
| Devil's Advocate 让步门槛 | ARS v3.0 |
| 三索引交叉核验 | ARS v3.11.0 |
| 三角验证 | Denzin 1978 |
