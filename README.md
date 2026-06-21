# 社科研究助手 v3.0

Claude Code 全流程学术研究技能。6 阶段迭代环：从现象出发，找理论、搜文献、审质量、出报告。

## 它解决什么问题

做社科研究时，三个高频痛点：

- **找理论靠运气。** 对 AI 说「我对 X 有趣，帮我找理论」→ AI 只能随机联想，因为它对 X 没有画面感。本技能用**深度报道做语境锚点**——先让 AI 读一篇具体报道建立脉络，再从细节出发联想学术概念，最后用 Google Scholar 按引用量验证
- **写出来的东西 AI 味重。** AI 自由发挥 → 假大空、不符合审稿标准。本技能把范文放在**初稿完成之后**做对照校准——范文不进主流程，不污染原始思考
- **纯理论和文科论文不好套流程。** 实证设计和数据图表两个阶段可根据论文类型自动跳过

## 安装

在 Claude Code 中：

```bash
claude plugins marketplace add EnzoDing-rgb/research-assistant
claude plugins install research-assistant@research-assistant
```

安装后重启 Claude Code，输入 `/research-assistant-enzo` 即可调用。

## 工作流程

```
1. 问题锚定与理论发现 → 2. 文献搜索 → 3. 实证设计 → 4. 数据图表 → 5. 同行评审与范文校准 → 6. 路由修订与交付
```

- Phase 3（实证设计）和 Phase 4（数据图表）：纯理论/文科论文自动跳过
- Phase 5：除常规同行评审外，额外对照同类型顶刊范文的论证标准做校准
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
- 语境锚点法（深度报道→概念联想）：孙宇凡「AI 赋能理论框架三步法」
- 范文后置校准（贡献类型匹配→论证对照）：孙宇凡「AI 仿写顶刊四步法」
