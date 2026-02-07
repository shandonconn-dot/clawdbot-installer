#!/bin/bash
################################################################################
# Clawdbot One-Click Installer for macOS
# Installs Clawdbot + Ollama + Qwen 2.5 + Dexter
# Ready to use immediately
################################################################################

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Helper functions
print_header() {
    echo -e "${BLUE}╔════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║${NC}  $1"
    echo -e "${BLUE}╚════════════════════════════════════════════════════════╝${NC}"
}

print_step() {
    echo -e "\n${GREEN}▶${NC} $1"
}

print_success() {
    echo -e "${GREEN}✅${NC} $1"
}

print_error() {
    echo -e "${RED}❌${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠️${NC} $1"
}

# Main installation
print_header "CLAWDBOT ONE-CLICK INSTALLER (macOS)"
echo -e "${YELLOW}This will install:${NC}"
echo "  • Clawdbot (AI Agent Framework)"
echo "  • Ollama (Local LLM Runtime)"
echo "  • Qwen 2.5:7b (Local Model)"
echo "  • Dexter (Financial Research Agent)"
echo ""
echo -e "${YELLOW}Time: ~10-15 minutes${NC}"
echo -e "${YELLOW}Space: ~5-6GB${NC}"
read -p "Continue? (y/n) " -n 1 -r && echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Installation cancelled."
    exit 1
fi

# Step 1: Check Homebrew
print_step "Checking Homebrew..."
if ! command -v brew &> /dev/null; then
    print_warning "Homebrew not found. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    print_success "Homebrew found"
fi

# Step 2: Install Ollama
print_step "Installing Ollama..."
if command -v ollama &> /dev/null; then
    print_success "Ollama already installed"
else
    brew install ollama
    print_success "Ollama installed"
fi

# Step 3: Start Ollama daemon
print_step "Starting Ollama service..."
if pgrep -x "ollama" > /dev/null; then
    print_success "Ollama already running"
else
    ollama serve > /tmp/ollama.log 2>&1 &
    sleep 3
    print_success "Ollama daemon started"
fi

# Step 4: Pull Qwen model
print_step "Downloading Qwen 2.5:7b model (this takes 2-3 minutes)..."
if ollama list | grep -q "qwen2.5:7b"; then
    print_success "Qwen 2.5:7b already downloaded"
else
    ollama pull qwen2.5:7b
    print_success "Qwen 2.5:7b downloaded"
fi

# Step 5: Install Node.js (required for Clawdbot)
print_step "Checking Node.js..."
if command -v node &> /dev/null; then
    print_success "Node.js found ($(node --version))"
else
    print_warning "Installing Node.js..."
    brew install node
    print_success "Node.js installed"
fi

# Step 6: Install Bun (required for Dexter)
print_step "Checking Bun..."
if command -v bun &> /dev/null; then
    print_success "Bun found ($(bun --version))"
else
    print_warning "Installing Bun..."
    curl -fsSL https://bun.sh/install | bash
    export PATH="$HOME/.bun/bin:$PATH"
    print_success "Bun installed"
fi

# Step 7: Install Clawdbot globally
print_step "Installing Clawdbot..."
npm install -g clawdbot
print_success "Clawdbot installed globally"

# Step 8: Create workspace directory
WORKSPACE="$HOME/clawd"
print_step "Setting up workspace at ${WORKSPACE}..."
mkdir -p "$WORKSPACE"
cd "$WORKSPACE"

# Step 9: Initialize Clawdbot
print_step "Initializing Clawdbot..."
if [ ! -d ".clawdbot" ]; then
    clawdbot init
else
    print_success "Clawdbot workspace already initialized"
fi

# Step 10: Configure Ollama auth profile
print_step "Configuring Ollama auth..."
AUTH_FILE="$HOME/.clawdbot/agents/main/agent/auth-profiles.json"
mkdir -p "$(dirname "$AUTH_FILE")"

cat > "$AUTH_FILE" << 'EOF'
{
  "version": 1,
  "profiles": {
    "ollama:local": {
      "type": "none",
      "provider": "ollama",
      "endpoint": "http://localhost:11434"
    }
  },
  "lastGood": {
    "ollama": "ollama:local"
  }
}
EOF
print_success "Ollama configured"

# Step 11: Create config
print_step "Creating Clawdbot configuration..."
CONFIG_FILE="$HOME/.clawdbot/clawdbot.json"

cat > "$CONFIG_FILE" << 'EOF'
{
  "ui": {
    "seamColor": "#00ff00",
    "assistant": {
      "name": "Agent",
      "avatar": "default"
    }
  },
  "agents": {
    "defaults": {
      "model": {
        "primary": "ollama/qwen2.5:7b",
        "fallbacks": []
      },
      "models": {
        "ollama/qwen2.5:7b": {
          "alias": "Qwen"
        }
      },
      "workspace": "~/clawd",
      "memorySearch": {
        "enabled": true
      }
    }
  },
  "tools": {
    "web": {
      "search": {}
    },
    "exec": {
      "security": "full",
      "ask": "off"
    }
  },
  "channels": {
    "telegram": {
      "enabled": false
    }
  },
  "gateway": {
    "port": 18789,
    "mode": "local",
    "bind": "loopback",
    "auth": {
      "mode": "token",
      "token": "clawdbot-local-dev"
    }
  }
}
EOF
print_success "Configuration created"

# Step 12: Clone Dexter
print_step "Setting up Dexter financial research agent..."
if [ ! -d "$WORKSPACE/dexter" ]; then
    cd "$WORKSPACE"
    git clone https://github.com/virattt/dexter.git
    cd dexter
    bun install
    print_success "Dexter installed and ready"
else
    print_success "Dexter already installed"
fi

# Step 13: Create launch scripts
print_step "Creating launch scripts..."

# Clawdbot launcher
cat > "$WORKSPACE/launch-clawdbot.sh" << 'EOF'
#!/bin/bash
cd ~/clawd
clawdbot tui
EOF
chmod +x "$WORKSPACE/launch-clawdbot.sh"

# Dexter launcher
cat > "$WORKSPACE/launch-dexter.sh" << 'EOF'
#!/bin/bash
open -a Terminal ~/clawd/dexter/run.sh
EOF
chmod +x "$WORKSPACE/launch-dexter.sh"

# Dexter run script
cat > "$WORKSPACE/dexter/run.sh" << 'EOF'
#!/bin/bash
cd ~/clawd/dexter && bun start
EOF
chmod +x "$WORKSPACE/dexter/run.sh"

print_success "Launch scripts created"

# Step 14: Verify everything
print_step "Verifying installation..."

CHECKS_PASSED=0
CHECKS_TOTAL=0

check_command() {
    CHECKS_TOTAL=$((CHECKS_TOTAL + 1))
    if command -v "$1" &> /dev/null || pgrep -x "$1" > /dev/null; then
        print_success "$2"
        CHECKS_PASSED=$((CHECKS_PASSED + 1))
    else
        print_error "$2"
    fi
}

check_file() {
    CHECKS_TOTAL=$((CHECKS_TOTAL + 1))
    if [ -f "$1" ] || [ -d "$1" ]; then
        print_success "$2"
        CHECKS_PASSED=$((CHECKS_PASSED + 1))
    else
        print_error "$2"
    fi
}

check_command "node" "Node.js"
check_command "bun" "Bun"
check_command "ollama" "Ollama"
check_command "npm" "npm"
check_file "$HOME/.clawdbot" "Clawdbot workspace"
check_file "$WORKSPACE/dexter" "Dexter agent"

# Final summary
echo ""
print_header "INSTALLATION COMPLETE! ✨"
echo -e "${GREEN}${CHECKS_PASSED}/${CHECKS_TOTAL}${NC} checks passed"
echo ""
echo -e "${BLUE}NEXT STEPS:${NC}"
echo ""
echo "1. ${GREEN}Start Clawdbot:${NC}"
echo "   ${YELLOW}clawdbot tui${NC}"
echo ""
echo "2. ${GREEN}Launch Dexter:${NC}"
echo "   ${YELLOW}cd ~/clawd/dexter && bun start${NC}"
echo ""
echo "3. ${GREEN}Open Clawdbot web UI:${NC}"
echo "   ${YELLOW}http://localhost:18789${NC}"
echo ""
echo -e "${BLUE}WHAT YOU HAVE:${NC}"
echo "  • Qwen 2.5:7b (running locally, no API costs)"
echo "  • Clawdbot (AI agent framework)"
echo "  • Dexter (financial research agent)"
echo "  • Full local privacy - nothing sent to the cloud"
echo ""
echo -e "${YELLOW}Happy building! 🚀${NC}"
