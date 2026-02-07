# 🚀 Clawdbot Quick Start Guide (For Beginners)

**Complete step-by-step guide — no coding experience needed!**

---

## What You're Installing

Think of this like installing a personal AI assistant that:
- **Thinks** — Can reason through complex problems
- **Learns** — Remembers what you tell it
- **Researches** — Can analyze financial data in real-time
- **Works Locally** — Everything stays on your computer (private & free)

**Includes:**
- 🤖 Clawdbot (Your AI agent)
- 🧠 Qwen (Local AI brain — runs on your Mac, no subscriptions)
- 💰 Dexter (Financial research agent)

---

## Requirements

✅ **You need:**
- Mac computer (works on any Mac from 2015+)
- 6GB free space (like a large movie)
- 15 minutes
- WiFi connection (first time only)

❌ **You DON'T need:**
- Coding skills
- API keys
- Paid subscriptions
- Technical background

---

## Installation Steps

### Step 1: Open Terminal
1. Press `CMD + SPACE` (hold Command, tap Space)
2. Type: `terminal`
3. Press Enter
4. A black window should open

**You're now in Terminal!** Don't be scared — you just paste code.

---

### Step 2: Copy the Install Command

Copy this entire line (select all → copy):

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/shandonconn-dot/clawdbot-installer/main/install.sh)"
```

---

### Step 3: Paste Into Terminal

1. Click in the Terminal window
2. Press `CMD + V` (paste)
3. Press `ENTER`

**That's it!** The installation starts automatically.

---

### Step 4: Wait & Watch

The installation will:
1. Check what's already on your Mac
2. Download software (this takes 5-10 minutes)
3. Set everything up automatically
4. Show you success messages

**You'll see green checkmarks (✅) when things work.**

---

### Step 5: It's Done!

When you see:
```
✅ Installation Complete! ✨
```

**Congratulations!** You now have Clawdbot + AI running locally.

---

## Using Clawdbot

### Option 1: Start the AI Agent (Easy)

In Terminal, type:
```
clawdbot tui
```

Then press Enter. A text interface opens where you can chat with your AI.

**Type questions like:**
- "What's happening in tech stocks today?"
- "Explain cryptocurrency to me"
- "Analyze Tesla's financials"

Type `exit` to quit.

---

### Option 2: Use Dexter (Financial Research)

In Terminal, type:
```
cd ~/clawd/dexter && bun start
```

Press Enter. Dexter opens — your financial research agent.

**Ask it:**
- "Compare Apple and Microsoft fundamentals"
- "Is Tesla overvalued?"
- "Show me earnings trends for the S&P 500"

Dexter does deep research and returns analysis.

---

### Option 3: Web Dashboard

Open your browser and go to:
```
http://localhost:18789
```

You'll see a web interface for Clawdbot. Same AI, different view.

---

## Troubleshooting

### ❌ "Command not found: clawdbot"

If you see this, try restarting Terminal:
1. Close Terminal (CMD + Q)
2. Open Terminal again (CMD + SPACE, type "terminal")
3. Try `clawdbot tui` again

---

### ❌ Installation Stops or Errors

If the installation gets stuck:
1. Press `CTRL + C` (stops it)
2. Paste the install command again
3. Press Enter (it will resume or restart)

---

### ❌ "Ollama not found"

If you see this:
1. Open a new Terminal window
2. Type: `ollama serve`
3. Leave it running
4. In another Terminal, try `clawdbot tui` again

---

### ✅ Everything Works But Seems Slow

First run downloads a large AI model (~4.7GB). This takes 5-10 minutes.

After first run, everything is instant and fast.

---

## What's Happening Behind the Scenes?

**You just installed:**

1. **Homebrew** — Software package manager
2. **Ollama** — Runs AI locally on your Mac
3. **Qwen 2.5:7b** — An AI model (like ChatGPT, but free & local)
4. **Node.js** — Software runtime
5. **Clawdbot** — Your AI agent framework
6. **Dexter** — Financial research bot

**All running on YOUR Mac. Nothing uploaded to the cloud.**

---

## Privacy & Cost

✅ **100% Private** — Everything stays on your computer
✅ **Free** — No subscriptions, no API costs
✅ **Fast** — Uses your Mac's power directly
✅ **Offline** — Works without internet (except first setup)

---

## Next Steps

1. **Play with it** — Ask questions, explore
2. **Experiment** — Try financial analysis, research, creative writing
3. **Share** — Tell friends about the free AI on your Mac

---

## Questions?

**Still confused?** 

Try these resources:
- [Clawdbot Docs](https://docs.clawd.bot)
- [GitHub Repo](https://github.com/shandonconn-dot/clawdbot-installer)
- Ask in the comments or create an issue

---

## One More Time: The Installation

Copy and paste this into Terminal, press Enter, wait 15 minutes:

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/shandonconn-dot/clawdbot-installer/main/install.sh)"
```

**That's literally it.** You're done. Enjoy your local AI! 🚀

---

**Made with ❤️ for people who just want AI to work.**
