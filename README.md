# Clawdbot One-Click Installer

**For macOS only** — Installs Clawdbot + Ollama + Qwen 2.5 + Dexter in one command.

## What You Get

- ✅ **Clawdbot** — AI Agent Framework
- ✅ **Ollama** — Local LLM Runtime  
- ✅ **Qwen 2.5:7b** — Free local AI model (~7B parameters)
- ✅ **Dexter** — Financial Research Agent
- ✅ **100% Local** — No API costs, complete privacy

## Requirements

- macOS (Intel or Apple Silicon)
- 6GB free disk space
- 10-15 minutes
- Internet connection (first run only)

## Installation

Copy and paste this into your terminal:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/yourusername/clawdbot-installer/main/install.sh)"
```

Or download and run locally:

```bash
curl -O https://raw.githubusercontent.com/yourusername/clawdbot-installer/main/install.sh
chmod +x install.sh
./install.sh
```

## Guides

📖 **[Quick Start Guide](QUICK_START.md)** — Step-by-step for beginners  
📱 **[Telegram Setup](TELEGRAM_SETUP.md)** — Control Clawdbot from your phone  

## After Installation

### Start Clawdbot TUI
```bash
clawdbot tui
```

### Launch Dexter (Financial Agent)
```bash
cd ~/clawd/dexter && bun start
```

### Web Dashboard
```
http://localhost:18789
```

### Use on Telegram
See [Telegram Setup Guide](TELEGRAM_SETUP.md) for step-by-step instructions.

## Troubleshooting

**"Command not found: clawdbot"**
- Run: `npm install -g clawdbot`

**"Ollama not running"**
- Run: `ollama serve` in a new terminal

**"Qwen model not found"**
- Run: `ollama pull qwen2.5:7b`

## Questions?

Check the [Clawdbot docs](https://docs.clawd.bot)
