#!/usr/bin/env bash
set -euo pipefail

# ============================================================
# Academic Research Assistant v5.0 — 一键安装脚本
# 安装所有依赖工具到当前环境（仅 Claude Code）
# 如部分工具安装失败，不影响其他工具，可稍后重试
# ============================================================

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

log()  { echo -e "${GREEN}[✓]${NC} $1"; }
warn() { echo -e "${YELLOW}[!]${NC} $1"; }
fail() { echo -e "${RED}[✗]${NC} $1"; }

echo ""
echo "=============================================="
echo " Academic Research Assistant v5.0 — 依赖安装"
echo "=============================================="
echo ""

# ---- 0. 检查 Claude Code ----
echo "--- 基础环境检查 ---"
if command -v claude &>/dev/null; then
    log "Claude Code 已安装"
else
    fail "未检测到 Claude Code CLI。请先安装: npm install -g @anthropic-ai/claude-code"
    exit 1
fi

# ---- 1. OpenSpec (npm, 可选) ----
echo ""
echo "--- [1/3] OpenSpec — 规格驱动研究设计（可选）---"
if command -v openspec &>/dev/null; then
    log "OpenSpec 已安装: $(openspec --version 2>&1)"
else
    echo "  正在安装 OpenSpec..."
    if npm install -g @fission-ai/openspec@latest &>/dev/null; then
        log "OpenSpec 安装完成"
    else
        warn "安装失败。手动安装: npm install -g @fission-ai/openspec"
    fi
fi

# ---- 2. Academic Research Skills (Claude plugin) ----
echo ""
echo "--- [2/3] Academic Research Skills — 文献搜索 + 学术质量门禁 ---"
if claude plugin list 2>/dev/null | grep -q "academic-research-skills"; then
    log "Academic Research Skills 已安装"
else
    echo "  正在添加 marketplace 并安装..."
    claude plugin marketplace add Imbad0202/academic-research-skills 2>/dev/null || true
    if claude plugin install academic-research-skills 2>/dev/null; then
        log "Academic Research Skills 安装完成"
    else
        warn "安装失败。手动运行:"
        echo "    claude plugin marketplace add Imbad0202/academic-research-skills"
        echo "    claude plugin install academic-research-skills"
    fi
fi

# ---- 3. Ralph Loop (Claude plugin, 官方 marketplace) ----
echo ""
echo "--- [3/3] Ralph Loop — 路由修订迭代引擎 ---"
if claude plugin list 2>/dev/null | grep -q "ralph-loop"; then
    log "Ralph Loop 已安装"
else
    echo "  正在安装 Ralph Loop（来自官方 marketplace）..."
    if claude plugin install ralph-loop 2>/dev/null; then
        log "Ralph Loop 安装完成"
    else
        warn "安装失败。手动运行: claude plugin install ralph-loop"
    fi
fi

# ---- 跨模型交叉验证配置提示 ----
echo ""
echo "--- 跨模型交叉验证（可选但推荐）---"
echo ""
echo "v5.0 支持 Codex MCP (GPT) 作为跨模型审稿的第二视角。"
echo "如需启用，请配置 Codex CLI 并添加 MCP server："
echo ""
echo "  npm install -g @openai/codex"
echo "  claude mcp add codex -s user -- codex mcp-server"
echo ""
echo "未设置时自动 Fallback 到多角色子 Agent 交叉验证。"
echo "详见 research/SKILL.md Phase 6。"
echo ""

# ---- 完成 ----
echo ""
echo "=============================================="
echo " 安装检查完毕"
echo "=============================================="
echo ""
echo "已安装:"
command -v openspec &>/dev/null && echo "  ✓ OpenSpec（可选）" || echo "  ✗ OpenSpec（可选）"
claude plugin list 2>/dev/null | grep -q "academic-research-skills" && echo "  ✓ Academic Research Skills" || echo "  ✗ Academic Research Skills"
claude plugin list 2>/dev/null | grep -q "ralph-loop" && echo "  ✓ Ralph Loop" || echo "  ✗ Ralph Loop"
echo ""
echo "跨模型验证:"
if [ -n "${GPT_5_4_API_KEY:-}" ]; then
    echo "  ✓ GPT 5.4 已配置"
else
    echo "  ○ GPT 5.4 未配置（将使用多角色子 Agent Fallback）"
fi
echo ""
echo "启动研究: 在 Claude Code 中输入 '/research-assistant-enzo' + 你的研究问题。"
