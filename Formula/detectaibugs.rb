# 🟡 SECURITY CLASSIFICATION: PUBLIC - USER FACING
# This file is distributed in public Homebrew taps and visible to all users.
# DO NOT add implementation details, API endpoints, or orchestration architecture.
# Focus on user benefits only. See SECURITY_CLASSIFICATION.md for guidelines.

class Detectaibugs < Formula
  desc "AI-powered bug detection for code quality assurance"
  homepage "https://detectaibugs.org"
  license "MIT"
  version "TEST"


  bottle do
    root_url "https://github.com/detectaibugs/homebrew-codex-tap/releases/download/vTEST"
    sha256 cellar: any_skip_relocation, arm64_sonoma: "3a930774b116dcb1ed85756631e6ea858e7ec399a56afa609c011955ed86dec9"
    sha256 cellar: any_skip_relocation, ventura: "0723d178cfaca45221aa7ec4a4f5dbfab19ecfd2e7a5058ea6ee6cb8ada42f44"
  end

  on_arm do
    url "https://github.com/detectaibugs/homebrew-codex-tap/releases/download/vTEST/detectaibugs-darwin-arm64.tar.gz"
    sha256 "c0bebfc830899557853e9e7dcc3620d0ee19b6bfcc65df3684e0878d1e8ac88b"
  end

  on_intel do
    url "https://github.com/detectaibugs/homebrew-codex-tap/releases/download/vTEST/detectaibugs-darwin-amd64.tar.gz"
    sha256 "b7f7d00e14c8d02c197f29f1e0df6da59aab7db2bed869ced139dec3089f733b"
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

      For more information:
        https://detectaibugs.org/docs

      REINSTALL:
      If slash commands need to be reinstalled:
        detectaibugs --setup-claude
        detectaibugs --setup-codex

      For help:
        detectaibugs help
    EOS
  end

  test do
    assert_match "detectaibugs", shell_output("#{bin}/detectaibugs version")
    assert_match "USAGE", shell_output("#{bin}/detectaibugs help")
  end
end
