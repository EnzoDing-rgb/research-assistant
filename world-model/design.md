# 世界模型综述 — 设计文档

> 状态：已确认，待执行
> 日期：2026-06-05
> 作者：丁冯德 + Claude Code

---

## 1. 项目定位

**纯文献综述。** 不提出新框架，不 sell 任何已有框架。读者读完后的目标：清晰、简洁地认知"世界模型"领域前沿发展到哪了，产生了哪些核心论文。

**锚定框架（不扩展）：** 李飞飞 2026-06-04 提出的三分类（Renderer / Simulator / Planner），仅作为组织文献的分类工具。

---

## 2. 受众定位

本科生，大一、大二能读懂。假设读者：
- 知道机器学习基本概念（训练、推理、神经网络）
- 没读过世界模型相关论文
- 不需要先修强化学习或机器人学

---

## 3. 范围边界

### 纳入
- AI/ML 领域的 World Models（视频生成、物理模拟、智能体决策）
- Atari、Minecraft 等游戏环境中的世界模型
- 自动驾驶中的世界模型（仅限感知/预测层面，不深入控制）

### 排除
- 扫地机器人、家用机器人、人形机器人的运动控制与硬件
- 认知神经科学的起源（海马体回放、新皮质层级预测）——仅在 §1 中用一段话提一句，不展开
- 机器人学中的运动学、动力学、SLAM

### 边界处理
Planner 类天然涉及机器人（VLA/VLM 动作模型）。处理方式：聚焦"智能体决策"——World Model 如何输出动作——使用 Atari、Minecraft 等游戏环境作为主要案例。机器人只作为 Planner 的自然载体被提及，不展开讨论机器人学细节。

---

## 4. 语言要求

### 输出语言
- 论文正文：**英文**
- 所有引用文献：**英文**（即便作者是中国人，引用其英文版本）

### 风格约束（强制执行）
1. **清晰简洁。** 避免花哨名词。必要术语（如 VLA、Sora）保留，其余用平实语言。
2. **禁止比喻。** 不许用任何比喻修辞。
3. **禁止双重否定。** 所有句子正向表述。
4. **本科生友好。** 每个核心概念在首次出现时用一句话解释。

---

## 5. 论文结构

```
§1 Introduction — 什么是世界模型、为什么现在火、本文范围
§2 Renderer — 视频生成模型作为世界渲染器（Sora, Genie, etc.）
§3 Simulator — 物理/几何世界模拟（最被低估但最关键）
§4 Planner — 从世界理解到动作决策（Atari, Minecraft）
§5 Open Problems & Future Directions
```

每章末尾附"核心论文表"：3-5 篇必读论文 + 一句话摘要 + 为什么重要。

---

## 6. 篇幅

目标 ~10 页（PDF），可接受 9-13 页。不凑页数，不又臭又长。
阅读时间目标：1-2 小时。

---

## 7. 工具链

### 执行引擎
- **ARS academic-paper** — Claude Code 可安装的学术论文技能（已安装）
  - Plan 模式：Socratic 对话，逐章规划
  - Full 模式：12-agent 写作流水线
  - 产出：Markdown + 可选 Pandoc → PDF
- **ARS deep-research** — 文献搜索（13-agent 研究团队，内置 Semantic Scholar 验证）
- **ARS reviewer** — 质量评审（EIC + 3 Reviewers + Devil's Advocate）
- **Ralph Loop** — 迭代修订（增强定向路由，最多 5 轮）

### 架构方法论（已内化到 social-research-assistant v2.0）
- **DeliAutoResearch** — 陈德里的层级化技能组设计
  - 我们没有它的源代码（它是设计文档，不是可安装软件）
  - 但三个核心模块已融入我们的流水线：弱点路由表 + 质量关卡 + 迭代环
  - 文献调研的 LQS 评分体系（Recall→Score→Classify→Upgrade）将在搜索阶段手动应用

### 格式
- **Markdown → Pandoc → PDF**，不用 LaTeX
- 图表：Python (matplotlib/seaborn) 生成 PNG，嵌入 Markdown
- 表格：Markdown table 格式

### 跨模型交叉验证
- 优先：GPT 5.4（需用户提供 API key + base URL）
- Fallback：多角色子 Agent 交叉验证（当前模型的不同系统提示词角色）

---

## 8. 引用标准

- 数量目标：40-60 篇（~10 页论文的合理引用密度）
- 来源：英文论文（arXiv 预印本 + 已接收会议/期刊论文）
- 验证：所有引用经 ARS 引用审计（Semantic Scholar / OpenAlex / Crossref / arXiv 四索引交叉核验）
- 格式：APA 7.0

---

## 9. 质量目标

| 维度 | 目标 |
|------|------|
| 清晰度 | 本科生读完能说出每章讲了什么 |
| 完整性 | 覆盖三类世界模型的主要代表工作 |
| 准确性 | 所有引用可验证，无幻觉引用 |
| 批判性 | 不仅列举，还有比较和局限性讨论 |
| 可读性 | 1-2 小时读完 |

评审分数目标：≥ 7.0/10（ARS reviewer 评分）

---

## 10. 已确认但不在本文档展开的事项

- 不提出新的世界模型分类框架
- 不讨论认知神经科学起源（仅一句提及）
- 不深入机器人运动控制/硬件
- 不用 LaTeX
- 不用比喻，不用双重否定
- 不又臭又长

---

## 11. 下一步

1. ARS deep-research：搜索世界模型相关文献，构建 references.bib
2. ARS academic-paper plan：Socratic 对话，逐章规划
3. ARS academic-paper full：12-agent 写作流水线
4. ARS reviewer full：EIC + 3 Reviewers + Devil's Advocate
5. Ralph Loop：定向路由修订
6. 交付：final-paper.md → Pandoc → PDF
