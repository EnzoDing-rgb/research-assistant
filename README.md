# Social Research Assistant

社科研究全流程 AI 助手。**不造新工具——编排现有最佳开源项目为一套研究工作流。**

> 站在 201K+ Stars 的肩膀上。一键安装，四个工具齐备。

## 一键安装

```bash
# 1. 装插件
/plugin marketplace add enzoding/social-research-assistant
/plugin install social-research-assistant

# 2. 装依赖（自动安装全部）
bash setup.sh
```

## 工具箱

### 需要安装的

| 工具 | 用途 | 安装 | Stars |
|------|------|------|-------|
| [OpenSpec](https://github.com/Fission-AI/OpenSpec) | 规格驱动研究设计 | `npm install -g @fission-ai/openspec` | 46K+ |
| [GPT Researcher](https://github.com/assafelovic/gpt-researcher) | 自主深度搜索 + 自动报告 | `pip install gpt-researcher` | 26.6K+ |
| [Academic Research Skills](https://github.com/Imbad0202/academic-research-skills) | 引用审计 + 多 Agent 交叉评审 | `/plugin install academic-research-skills` | 14.7K+ |
| [Ralph Loop](https://github.com/anthropics/ralph-wiggum) | 自主迭代——不通过就重来 | `/plugin install anthropics/ralph-wiggum` | 官方 |

### 内置命令（无需安装）

| 命令 | 用途 | 来源 |
|------|------|------|
| `/goal` | 目标驱动实现——流水线的执行引擎 | Claude Code 内置 |

## 工作流

```
/spec → /research → /review → /revise → /ship
 定标准    搜文献      验质量      自主迭代    交付
```

- `/spec` — OpenSpec：研究规格定义（问题 + 纳入标准 + 质量门禁）
- `/research` — GPT Researcher：多源并行搜索
- `/review` — ARS：引用审计 + 多 Agent 交叉评审
- `/revise` — Ralph Loop：不通过就自动换策略重来
- `/goal` — Claude Code 内置：逐个实现研究任务
- `/ship` — 交付最终报告 + 验证追溯

## 设计哲学

> You can outsource your thinking, but you cannot outsource your understanding.

**AI 干脏活：** 搜文献、验引用、交叉比对、迭代修订
**你做判断：** 定问题、选方法、写结论

## 适用场景

- 文献综述 / 系统综述
- 研究计划质量检查
- 投稿前完整性审计
- 跨方法对比分析
- 灰色文献搜集

## License

MIT
