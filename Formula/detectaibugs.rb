# 🟡 SECURITY CLASSIFICATION: PUBLIC - USER FACING
# This file is distributed in public Homebrew taps and visible to all users.
# DO NOT add implementation details, API endpoints, or orchestration architecture.
# Focus on user benefits only. See SECURITY_CLASSIFICATION.md for guidelines.

class Detectaibugs < Formula
  desc "AI-powered bug detection for code quality assurance"
  homepage "https://detectaibugs.org"
  license "MIT"
  version "2.1.2"


  bottle do
    root_url "https://github.com/detectaibugs/homebrew-codex-tap/releases/download/v2.1.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "4163e55389e9371afeb9a621c412290e4189547e6a0ce86e4af9cfc200c81b80"
    sha256 cellar: :any_skip_relocation, sequoia: "35d8bbaa6613afc7a5097159c3af566218f6e223dda6144c6d1554c6db0bacb9"
  end

  on_arm do
    url "https://github.com/detectaibugs/homebrew-codex-tap/releases/download/v2.1.2/detectaibugs-darwin-arm64.tar.gz"
    sha256 "a9ac94ea9caec2e45e8b018511512badb62c2bb5b5294be240534b6109c2199a"
  end

  on_intel do
    url "https://github.com/detectaibugs/homebrew-codex-tap/releases/download/v2.1.2/detectaibugs-darwin-amd64.tar.gz"
    sha256 "fc9f7b2fdf1bf0d5d808401aaac723378ac0780d2d1ed7ef613607a667312912"
  end

  # Optional dependencies - at least one should be installed
  # depends_on "anthropics/claude/claude" => :optional
  # depends_on "openai/codex/codex" => :optional

  def install
    if Hardware::CPU.arm?
      bin.install "detectaibugs-darwin-arm64" => "detectaibugs"
    else
      bin.install "detectaibugs-darwin-amd64" => "detectaibugs"
    end
    prefix.install "detectaibugs-command-claude.md"
    prefix.install "detectaibugs-command-codex.md"
  end

  def caveats
    <<~EOS
      detectaibugs has been installed!

      SETUP (choose one):

      For Claude Code users:
        detectaibugs --setup-claude

      For OpenAI Codex users:
        detectaibugs --setup-codex

      Then configure your API key:
        detectaibugs set-api-key=your-api-key
        Get your key at: https://detectaibugs.org/api-keys

      USAGE:
      After setup, run in your AI assistant:
        claude /detectaibugs          # If you have Claude Code
        codex /detectaibugs           # Shortcut for /prompts:detectaibugs

      WORKFLOW:
      1. Make code changes
      2. Run /detectaibugs to analyze
      3. Review and implement suggested fixes
      4. Run /detectaibugs again to verify

      *** For more information or help:
        detectaibugs help

      REINSTALL:
      If slash commands need to be reinstalled:
        detectaibugs --setup-claude
        detectaibugs --setup-codex
    EOS
  end

  test do
    assert_match "detectaibugs", shell_output("#{bin}/detectaibugs version")
    assert_match "USAGE", shell_output("#{bin}/detectaibugs help")
  end
end
