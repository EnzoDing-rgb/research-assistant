#!/usr/bin/env bash
set -euo pipefail

# ============================================================
# Social Research Assistant — 一键安装脚本
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
echo " Social Research Assistant — 依赖安装"
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

# ---- 1. OpenSpec (npm) ----
echo ""
echo "--- [1/4] OpenSpec — 规格驱动研究设计 ---"
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

# ---- 2. GPT Researcher (pip) ----
echo ""
echo "--- [2/4] GPT Researcher — 自主深度搜索 ---"
if python3 -c "import gpt_researcher" 2>/dev/null; then
    log "GPT Researcher 已安装"
else
    echo "  正在安装 GPT Researcher..."
    # 先尝试标准 pip，失败则尝试 --break-system-packages（Debian/Ubuntu 需要）
    if pip install gpt-researcher &>/dev/null; then
        log "GPT Researcher 安装完成"
    elif pip install --break-system-packages gpt-researcher &>/dev/null; then
        log "GPT Researcher 安装完成（--break-system-packages）"
    else
        warn "pip 安装失败。尝试 pipx..."
        if command -v pipx &>/dev/null && pipx install gpt-researcher &>/dev/null; then
            log "GPT Researcher 安装完成（pipx）"
        else
            warn "安装失败。手动安装: pip install gpt-researcher 或 pipx install gpt-researcher"
        fi
    fi
fi

# ---- 3. Academic Research Skills (Claude plugin) ----
echo ""
echo "--- [3/4] Academic Research Skills — 学术质量门禁 ---"
if claude plugin list 2>/dev/null | grep -q "academic-research-skills"; then
    log "Academic Research Skills 已安装"
else
    echo "  正在添加 marketplace 并安装..."
    # 先添加 marketplace，再安装插件
    claude plugin marketplace add Imbad0202/academic-research-skills 2>/dev/null || true
    if claude plugin install academic-research-skills 2>/dev/null; then
        log "Academic Research Skills 安装完成"
    else
        warn "安装失败。手动运行:"
        echo "    claude plugin marketplace add Imbad0202/academic-research-skills"
        echo "    claude plugin install academic-research-skills"
    fi
fi

# ---- 4. Ralph Loop (Claude plugin) ----
echo ""
echo "--- [4/4] Ralph Loop — 自主迭代引擎 ---"
if claude plugin list 2>/dev/null | grep -q "ralph-wiggum"; then
    log "Ralph Loop 已安装"
else
    echo "  正在添加 marketplace 并安装..."
    claude plugin marketplace add anthropics/ralph-wiggum 2>/dev/null || true
    if claude plugin install anthropics/ralph-wiggum 2>/dev/null; then
        log "Ralph Loop 安装完成"
    else
        warn "安装失败。手动运行:"
        echo "    claude plugin marketplace add anthropics/ralph-wiggum"
        echo "    claude plugin install anthropics/ralph-wiggum"
    fi
fi

# ---- 完成 ----
echo ""
echo "=============================================="
echo " 安装检查完毕"
echo "=============================================="
echo ""
echo "已安装:"
command -v openspec &>/dev/null && echo "  ✓ OpenSpec" || echo "  ✗ OpenSpec"
python3 -c "import gpt_researcher" 2>/dev/null && echo "  ✓ GPT Researcher" || echo "  ✗ GPT Researcher"
claude plugin list 2>/dev/null | grep -q "academic-research-skills" && echo "  ✓ Academic Research Skills" || echo "  ✗ Academic Research Skills"
claude plugin list 2>/dev/null | grep -q "ralph-wiggum" && echo "  ✓ Ralph Loop" || echo "  ✗ Ralph Loop"
echo ""
echo "内置命令（Claude Code 自带）:"
echo "  /goal  — 目标驱动实现，流水线的执行引擎"
echo ""
echo "启动研究: 在 Claude Code 中输入你的研究问题即可。"
