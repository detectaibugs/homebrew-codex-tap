# 🟡 SECURITY CLASSIFICATION: PUBLIC - USER FACING
# This file is distributed in public Homebrew taps and visible to all users.
# DO NOT add implementation details, API endpoints, or orchestration architecture.
# Focus on user benefits only. See SECURITY_CLASSIFICATION.md for guidelines.

class Detectaibugs < Formula
  desc "AI-powered bug detection for code quality assurance"
  homepage "https://detectaibugs.org"
  license "MIT"
  version "2.0.7"


  bottle do
    root_url "https://github.com/detectaibugs/homebrew-codex-tap/releases/download/v2.0.7"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "2d33f69117dec167b5eb68517a8211714dec14c0930bce83b80419c8917bce55"
    sha256 cellar: :any_skip_relocation, ventura: "fd042c1af3e75c1a382fb48bdb87094968d301b506f04758adcae0373d573dfe"
  end

  on_arm do
    url "https://github.com/detectaibugs/homebrew-codex-tap/releases/download/v2.0.7/detectaibugs-darwin-arm64.tar.gz"
    sha256 "edcff62e383d33072eb8d5ea8f1ced791cb0c4498ca0a9c4a3e90898ba8cd456"
  end

  on_intel do
    url "https://github.com/detectaibugs/homebrew-codex-tap/releases/download/v2.0.7/detectaibugs-darwin-amd64.tar.gz"
    sha256 "275a48b9155f28df32510f603cf9e34c8d6fb1984f8c6592d9871a0b9e5ba6f0"
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
        claude /detectaibugs    # If you have Claude Code
        codex /detectaibugs     # If you have OpenAI Codex

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
