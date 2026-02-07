# 📱 Connect Clawdbot to Telegram

**Use your AI agent from Telegram — control it from your phone!**

Once installed, you can chat with Clawdbot through Telegram. It works anywhere you have your phone.

---

## What You'll Get

✅ Chat with Clawdbot on Telegram  
✅ Get instant responses on your phone  
✅ Run commands from anywhere  
✅ Still 100% private (runs on your Mac)

---

## Step 1: Create a Telegram Bot

### 1.1 Open Telegram

Download Telegram if you don't have it:
- iPhone: App Store
- Android: Google Play
- Desktop: telegram.org

### 1.2 Talk to BotFather

1. In Telegram search for: `@BotFather`
2. Click the first result (blue checkmark)
3. Click "Start"

You should see a menu.

### 1.3 Create Your Bot

1. Send: `/newbot`
2. BotFather asks for a name. Type something like: `MyClawdbot`
3. BotFather asks for a username. Type something like: `myclawdbot_bot` (must end with `_bot`)
4. BotFather gives you a **Token** that looks like: `123456:ABC-DEF1234ghIkl-zyx57W2v1u123ew11`

**⚠️ SAVE THIS TOKEN — You'll need it in 30 seconds**

---

## Step 2: Configure Clawdbot

### 2.1 Open Terminal

1. Press `CMD + SPACE`
2. Type: `terminal`
3. Press Enter

### 2.2 Edit the Configuration

Type this command (press Enter):

```bash
nano ~/.clawdbot/clawdbot.json
```

A text editor opens.

### 2.3 Find the Telegram Section

Look for this section (use CTRL + W to search for "telegram"):

```json
"channels": {
  "telegram": {
    "enabled": false,
```

### 2.4 Enable Telegram

Change `false` to `true` and add your token:

```json
"channels": {
  "telegram": {
    "enabled": true,
    "botToken": "YOUR_TOKEN_HERE",
```

**Paste your token between the quotes where it says `YOUR_TOKEN_HERE`**

Example (with fake token):
```json
"botToken": "123456:ABC-DEF1234ghIkl-zyx57W2v1u123ew11",
```

### 2.5 Save and Exit

1. Press `CTRL + X`
2. Press `Y` (for yes)
3. Press `ENTER`

**You're done editing!**

---

## Step 3: Restart Clawdbot

In Terminal, type:

```bash
clawdbot gateway restart
```

Press Enter. Wait 5 seconds.

---

## Step 4: Start Using It

### Find Your Bot on Telegram

1. Go back to Telegram
2. Search for your bot (the username you created, like `myclawdbot_bot`)
3. Click it
4. Click "Start"

### Chat with It

Just type messages like you normally would:
- "What's the weather?"
- "Analyze Apple stock"
- "Tell me a joke"

Clawdbot responds instantly! 🤖

---

## Advanced: Multiple Users

If you want friends to also use the bot:

1. Share your bot username: `@myclawdbot_bot`
2. They search for it on Telegram
3. They click "Start"
4. They can now chat with YOUR Clawdbot instance

**Important:** They're talking to the Clawdbot running on your Mac. If you turn off your Mac, the bot stops responding.

---

## Troubleshooting

### ❌ Bot Doesn't Respond

1. Check Clawdbot is running:
   ```bash
   clawdbot status
   ```

2. Make sure Telegram is enabled in config (should show `"enabled": true`)

3. Restart Clawdbot:
   ```bash
   clawdbot gateway restart
   ```

---

### ❌ "Invalid token"

1. Double-check you copied the token correctly (no extra spaces)
2. Get a new token from BotFather: `/newbot` → create new bot
3. Update config with new token

---

### ❌ Messages Not Sending

1. Check your Mac is turned on
2. Check internet connection
3. Restart Terminal and try again

---

## Keep Your Token Secret

⚠️ **Never share your token!** If someone gets it, they can control your bot.

If you accidentally share it:
1. Go to BotFather
2. Send: `/mybots`
3. Click your bot
4. Click "API Token"
5. Click "Revoke current token"
6. Create a new one
7. Update your config

---

## Privacy Notes

✅ Your messages stay between you and your Mac  
✅ Telegram carries the messages, but they're encrypted  
✅ Clawdbot runs locally — no cloud storage  
✅ You control everything

---

## Next Steps

1. **Test it** — Send a message to your bot
2. **Share the username** — Friends can find and use it
3. **Keep it running** — Leave your Mac on for 24/7 access

---

## Questions?

Having issues? Check:
- [Clawdbot Telegram Docs](https://docs.clawd.bot)
- [Telegram BotAPI Docs](https://core.telegram.org/bots)

---

**Enjoy your personal AI on Telegram!** 📱🤖
