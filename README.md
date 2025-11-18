# ⚠️ CODEX SUPPORT PAUSED IN V2.0

<div align="center">

## 🔴 IMPORTANT NOTICE 🔴

**Codex support in the V2 series has been paused until v2.1.0**

**Expected Release: November 26th, 2025**

---

**In the meantime, please use DetectAIBugs with Claude Code:**

```bash
brew tap detectaibugs/claude-tap
brew install detectaibugs
detectaibugs --setup-claude
```

Visit: [github.com/detectaibugs/homebrew-claude-tap](https://github.com/detectaibugs/homebrew-claude-tap)

---

</div>

# 🎉 DetectAIBugs v2.0 - Now with OpenAI Codex Support!

> **⚡ Major Upgrade:** DetectAIBugs v2.0 is a complete rewrite in Go, bringing massive performance improvements, better security, and seamless integration with OpenAI Codex!
>
> **📅 Released:** November 17, 2025
>
> **⚠️ Note:** Codex support paused until v2.1.0 (Nov 26th)

Official Homebrew tap for **DetectAIBugs CLI** - AI-powered code analysis tool for OpenAI Codex users.

---

## 🔄 Migrating from v1.x?

We've **archived the v1 tap repository** and started fresh with this v2 tap to deliver you a cleaner, more maintainable codebase. This also ensures everyone explicitly migrates to v2, preventing compatibility issues from the significant architectural improvements.

**What's new in v2.0:**
- 🚀 **Rewritten in Go** - 10x faster, single binary, no dependencies
- 🔐 **Enhanced security** - Automatic session cleanup, proprietary prompt protection
- 🎯 **Multi-agent support** - Works with OpenAI Codex, Claude Code, and more
- ⚙️ **Better reliability** - Robust error handling, automatic retries, fallback modes
- 📦 **Cleaner distribution** - Professional packaging via Homebrew

**To migrate:**
```bash
# Uninstall v1 (if you had it)
brew uninstall detectaibugs
brew untap detectaibugs/tap  # or whatever the old tap was

# Install v2 (fresh start!)
brew tap detectaibugs/codex-tap
brew install detectaibugs
detectaibugs --setup-codex
```

---

## ⚡ Quick Start

### Installation

```bash
brew tap detectaibugs/codex-tap
brew install detectaibugs
detectaibugs --setup-codex
```

### Setup

Set your API key (get one at [detectaibugs.org/api-keys](https://detectaibugs.org/api-keys)):

```bash
detectaibugs set-api-key=your-api-key-here
```

### Usage

Run DetectAIBugs directly in any OpenAI Codex session:

```bash
# Inside Codex CLI
codex /detectaibugs
```

That's it! DetectAIBugs will analyze your code, detect bugs, and provide actionable feedback through Codex.

---

## ✨ Features

- **🤖 AI-Powered Analysis** - Leverages Codex's intelligence with custom detection logic
- **🔄 Dynamic Prompts** - Controlled via API for flexible, evolving analysis strategies
- **🔒 Secure by Default** - Automatic history cleanup protects proprietary prompts
- **📊 Rating Layer** - Optional response validation/modification via your API
- **⚙️ Git Integration** - Helpful reminders after `git add` and `git status`
- **🎯 Multiple Agents** - Same CLI works with Codex, Claude, and future AI assistants

---

## 📚 Documentation

- **Configuration Guide**: `detectaibugs help`
- **API Setup**: [detectaibugs.org/docs](https://detectaibugs.org/docs)

---

## 🛠️ Commands

```bash
# Show help
detectaibugs help

# Show version
detectaibugs version

# Configure API key
detectaibugs set-api-key=YOUR_KEY

# Install/reinstall slash command
detectaibugs --setup-codex

# Reinstall git reminders
detectaibugs reinstall-git-reminder
```

---

## 🤝 Support

- **Issues**: [Report bugs or request features](https://github.com/detectaibugs/homebrew-codex-tap/issues)
- **Website**: [detectaibugs.org](https://detectaibugs.org)
- **API Keys**: [detectaibugs.org/api-keys](https://detectaibugs.org/api-keys)
- **Email**: support@detectaibugs.org

---

## 📝 License

MIT License - See the main CLI repository for details.

---

## 🌟 Why DetectAIBugs?

Traditional linters catch syntax errors. DetectAIBugs catches **logic errors, security issues, edge cases, and subtle bugs** that only AI can understand. It's like having a senior engineer review every commit.

**Install now and never ship bugs again!** 🚀

```bash
brew tap detectaibugs/codex-tap && brew install detectaibugs && detectaibugs --setup-codex
```
