# research-assistant

Claude Code 技能集合。包含两个独立技能：

- **/research** — 全流程学术研究助手 v5.0（8 阶段迭代环 + PaperOrchestra 风格 5-agent 初稿撰写）
- **/learn** — AI 主导的技术概念教学（从问题动机出发，层层建立直觉，不留悬空概念）

---

## /research

8 阶段学术研究管线。CS/STEM + 社科 + 人文全覆盖。

```
1. 问题锚定 → 2. 文献搜索 → 3. 实证设计 → 4. 数据图表
   → 5. 初稿撰写(PaperOrchestra) → 6. 同行评审+范文校准
   → 7. 路由修订 → 8. 终稿格式化
```

### 安装

```bash
claude plugins marketplace add EnzoDing-rgb/research-assistant
claude plugins install research-assistant@research-assistant
```

安装后重启 Claude Code，输入 `/research` 即可调用。

**推荐配置 MCP 文献数据库（增强 CS 文献覆盖）：**

```bash
claude mcp add arxiv --scope user -- npx -y --package arxiv-toolkit arxiv-mcp
claude mcp add semantic-scholar --scope user -- uvx semantic-scholar-mcp
claude mcp add openalex --scope user -- npx openalex-mcp
```

### 核心机制

- **语境锚点法：** CS 用 survey/SoK，社科用深度报道/案例——先让 AI 建立脉络再联想学术概念
- **范文后置校准：** 范文不进主生成流程，初稿完成后对照论证结构——校准工具，不是思维模具
- **5-Agent 初稿撰写：** Outline → 并行[图表, 文献审核] → Section Writing → Content Refinement（PaperOrchestra 风格）
- **理论/算法论文：** 自动跳过实证设计和数据图表阶段
- **8 道质量关卡 + 弱点路由表：** 发现问题定向修复，不盲目重试全文

### 依赖

```bash
bash setup.sh  # 安装 ARS + Ralph Loop
```

### 示例

| 项目 | 说明 |
|------|------|
| [examples/world-model/](./examples/world-model/) | 世界模型综述 — 14 页，39 篇引用 |
| [examples/tech-hiring/](./examples/tech-hiring/) | AI 替代与创造：中国技术招聘市场结构性变化（2023–2026） |

---

## /learn

AI 主导的技术概念教学技能。支持 PPT 截图和纯文字提问。

从「这东西解决什么问题」出发，逐层展开机制，每个新概念当场解释并建立联系。禁止生活化比喻，禁止堆术语，用通顺中文口语。

```bash
/learn Transformer 是什么
/learn [贴一张 PPT 截图]
```

### 灵感来源

- 迭代环 + 弱点路由表：陈德里 DeliAutoResearch（2026）
- 语境锚点法 + 范文后置校准：孙宇凡
- 5-Agent Drafting：PaperOrchestra (Song et al., arXiv:2604.05018)
- 多代理独立审计：Claude Code 多子 Agent 并行评审
