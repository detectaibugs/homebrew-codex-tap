# 🟡 SECURITY CLASSIFICATION: PUBLIC - USER FACING
# This file is distributed in public Homebrew taps and visible to all users.
# DO NOT add implementation details, API endpoints, or orchestration architecture.
# Focus on user benefits only. See SECURITY_CLASSIFICATION.md for guidelines.

class Detectaibugs < Formula
  desc "AI-powered bug detection for code quality assurance"
  homepage "https://detectaibugs.org"
  license "MIT"
  version "2.0.9"


  bottle do
    root_url "https://github.com/detectaibugs/homebrew-codex-tap/releases/download/v2.0.9"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "a4b1c27f0199984e4c3a757d6de7a1ab1097e6edad4b4671dff7b20d67d6d2d2"
    sha256 cellar: :any_skip_relocation, ventura: "e81e2109386e9d42ca2d7151da5f6cb01f41cce3dcdb35d7a5e0d70afb8f8fbf"
  end

  on_arm do
    url "https://github.com/detectaibugs/homebrew-codex-tap/releases/download/v2.0.9/detectaibugs-darwin-arm64.tar.gz"
    sha256 "17c7256ab929ba2216b4692c2504941746335f86a63ddf666ad2d749223b9967"
  end

  on_intel do
    url "https://github.com/detectaibugs/homebrew-codex-tap/releases/download/v2.0.9/detectaibugs-darwin-amd64.tar.gz"
    sha256 "0b892e9c562d9383e3cda80e92884031e5625a12269fa25b735361814a6c29d8"
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
