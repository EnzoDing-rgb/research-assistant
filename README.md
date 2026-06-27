# research-assistant

Claude Code 技能集合。包含两个独立技能：

- **/learn** — AI 主导的技术概念教学（从问题动机出发，层层建立直觉，不留悬空概念）
- **research-assistant-enzo** — 全流程学术研究助手 v4.0（6 阶段迭代环：从问题出发，找理论、搜文献、审质量、出报告）

---

## /learn

AI 主导的技术概念教学技能。支持 PPT 截图和纯文字提问。

**核心主张：** 用户基础有限时，AI 主动规划最优讲解路径。从「这东西解决什么问题」出发，逐层展开机制，每个新概念当场解释并建立联系。禁止生活化比喻，禁止堆术语，用通顺中文口语。

```bash
/learn Transformer 是什么
/learn 反向传播怎么理解
/learn [贴一张 PPT 截图]
```

详见 [learn.md](./learn.md)

---

# Academic Research Assistant v4.0

Claude Code 全流程学术研究技能。6 阶段迭代环：从问题出发，找理论、搜文献、审质量、出报告。覆盖社科/CS/STEM/人文。

## 它解决什么问题

做学术研究时，三个高频痛点：

- **找理论/技术路线靠运气。** 对 AI 说「我对 X 感兴趣，帮我找文献」→ AI 只能随机联想，因为它对 X 没有画面感。本技能用**锚点材料建立语境**——社科用深度报道/案例，CS 用 survey/SoK/related work——先让 AI 建立脉络，再从细节联想学术概念，最后用数据库按引用量验证
- **写出来的东西 AI 味重。** AI 自由发挥 → 假大空、不符合审稿标准。本技能把范文放在**初稿完成之后**做对照校准——范文不进主流程，不污染原始思考
- **纯理论和算法论文不好套流程。** 实证设计和数据图表两个阶段可根据论文类型自动跳过

## 安装

在 Claude Code 中：

```bash
claude plugins marketplace add EnzoDing-rgb/research-assistant
claude plugins install research-assistant@research-assistant
```

安装后重启 Claude Code，输入 `/research-assistant-enzo` 即可调用。

**推荐配置 MCP 文献数据库（增强 CS 文献覆盖）：**

```bash
# arXiv MCP：最新 preprint 搜索/下载/阅读
claude mcp add arxiv --scope user -- npx -y --package arxiv-toolkit arxiv-mcp

# Semantic Scholar MCP：引用图谱 + 推荐
claude mcp add semantic-scholar --scope user -- uvx semantic-scholar-mcp

# OpenAlex MCP：250M+ 论文广覆盖
claude mcp add openalex --scope user -- npx openalex-mcp
```

## 工作流程

```
1. 问题锚定与理论发现 → 2. 文献搜索 → 3. 实证设计 → 4. 数据图表 → 5. 同行评审与范文校准 → 6. 路由修订与交付
```

- Phase 1 锚点材料：社科用深度报道/案例，CS 用 survey/SoK/related work
- Phase 2 文献搜索：ARS deep-research（核心）+ arXiv / Semantic Scholar / OpenAlex（推荐 MCP）
- Phase 3（实证设计）和 Phase 4（数据图表）：理论/算法类论文自动跳过
- Phase 5：多角色同行评审 + 同类型顶会/顶刊范文论证结构对照
- 每阶段有质量关卡，发现问题按弱点路由表定向修复，非全文重写

## 依赖工具

| 工具 | 实际做什么 |
|------|-----------|
| Academic Research Skills | Claude Code 插件，提供文献搜索（调用 Semantic Scholar 等学术 API）和同行评审（多角色模拟审稿）能力 |
| Ralph Loop | Claude Code 插件，按指定方向反复迭代修改，直到问题清零（最多 5 轮） |

```bash
bash setup.sh  # 一键安装以上依赖
```

## 示例

| 项目 | 说明 |
|------|------|
| [examples/world-model/](./examples/world-model/) | 世界模型综述 — 14 页，39 篇引用 |
| [examples/tech-hiring/](./examples/tech-hiring/) | AI 替代与创造：中国技术招聘市场结构性变化（2023–2026） |

## 灵感来源

- 迭代环 + 弱点路由表架构：陈德里 DeliAutoResearch（2026）
- 语境锚点法：孙宇凡「AI 赋能理论框架三步法」
- 范文后置校准：孙宇凡「AI 仿写顶刊四步法」
- CS/STEM 锚点扩展 + 可组合文献数据库：社区贡献
- 多代理独立审计：Claude Code 多子 Agent 并行评审
