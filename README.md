# AI 替代与创造：中国技术招聘市场的结构性变化（2023–2026）

> 最终报告：[final-report.md](./final-report.md)
> 生成日期：2026-06-01
> 研究助手版本：Social Research Assistant v2.0

---

## 项目结构

```
.
├── final-report.md               # 最终交付报告（可分享）
├── README.md                     # 本文件
├── research/                     # 研究工作流产出
│   ├── spec.md                   # Phase 1: 研究规格
│   ├── research-report.md        # Phase 2: 初版研究报告
│   └── review-report.md          # Phase 5: 质量评审报告
├── setup.sh                      # 环境依赖安装脚本
├── social-research-assistant.md  # 社科研究助手技能（v2.0 迭代环架构）
├── skills/                       # 技能文件
└── .claude-plugin/               # Claude Code 插件配置
```

## 研究流程（v2.0 迭代环）

```
研究设计 → 文献搜索 → 实验设计 → 图表&结构 → 同行评审 → 路由修订 → 交付
   ↑           ↑           ↑            ↑           │
   └───────────┴───────────┴────────────┴───────────┘
                    弱点路由表（定向修复，非盲目重试）
```

| 阶段 | 内容 | 工具 | 产出 |
|------|------|------|------|
| Phase 1 — 研究设计 | 问题拆解 + 纳入/排除标准 + 假设 | 手动 / OpenSpec | `research/spec.md` |
| Phase 2 — 文献搜索 | 多源搜索 + 引用验证 | ARS deep-research | `research/literature-review.md` |
| Phase 3 — 实验设计 | 假设 + 方法 + 执行 | Python/R 脚本 | `research/experiment-design.md` |
| Phase 4 — 图表 & 结构 | 可视化 + 章节逻辑 | Python / Markdown | 图表 + 报告草稿 |
| Phase 5 — 同行评审 | EIC + 3 Reviewers + Devil's Advocate + 跨模型验证 | ARS reviewer + GPT 5.4 | `research/review-report.md` |
| Phase 6 — 路由修订 | 弱点路由表定向修复（最多 5 轮） | Ralph Loop（增强） | 修订版报告 |
| Phase 7 — 交付 | 完整报告输出 | 手动 | `final-report.md` |

## 核心发现

| 指标 | 数据 | 来源 |
|------|------|------|
| AI 岗位增速（2025 同比） | +74.1% | BOSS直聘 |
| AI 岗位增速（2026 春招） | +172% | BOSS直聘 / 脉脉 |
| AI 岗占新经济岗位比例 | 2.78% → 22.03% | 脉脉 |
| 程序员转 AI 开发比例 | 25.7% | 脉脉 |
| AI 科学家平均月薪 | ~133,000 元 | 脉脉 |
| 传统软件开发需求变化 | −25% | 翰德 |

## 数据来源

- BOSS直聘 ECHO2026 年度合作伙伴大会
- 脉脉高聘《2026 春招职场洞察报告》
- 智联招聘 × 北大国发院《2026 人力资源管理趋势报告》
- 翰德《2026 人才趋势报告》

## 研究局限

详见 [final-report.md 附录 C](./final-report.md#附录c研究方法与可信度说明)。

## v2.0 架构亮点

- **迭代环 + 弱点路由表** — 评审发现的问题自动路由到对应子技能定向修复，而非盲目全文重试
- **跨模型交叉验证** — GPT 5.4 可用时启用独立审计；不可用时 Fallback 到多角色子 Agent
- **质量管理关卡** — 4 道关卡，不通过不进入下一阶段（灵感来源：陈德里 DeliAutoResearch）
- **GPT Researcher 暂时搁置** — 因演示中 100% 幻觉引用率，v2.0 默认使用 ARS deep-research 替代。保留重新启用路径。
