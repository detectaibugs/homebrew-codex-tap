# 🟡 SECURITY CLASSIFICATION: PUBLIC - USER FACING
# This file is distributed in public Homebrew taps and visible to all users.
# DO NOT add implementation details, API endpoints, or orchestration architecture.
# Focus on user benefits only. See SECURITY_CLASSIFICATION.md for guidelines.

class Detectaibugs < Formula
  desc "AI-powered bug detection for code quality assurance"
  homepage "https://detectaibugs.org"
  license "MIT"
  version "TEST3"


  bottle do
    root_url "https://github.com/detectaibugs/homebrew-codex-tap/releases/download/vTEST3"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "7ff14f7b10ebd219247d6341f4d1c81e50fe0c0fc3cae62d78bc1be597a36c27"
    sha256 cellar: :any_skip_relocation, ventura: "d30fd5fe1da8915a897e0b09be24c5ed474d03ca598441b445500032029040e3"
  end

  on_arm do
    url "https://github.com/detectaibugs/homebrew-codex-tap/releases/download/vTEST3/detectaibugs-darwin-arm64.tar.gz"
    sha256 "494a363b7bb163eb12b80f94bd7df697a3367bad4d238b4ece4e56de26f412ae"
  end

  on_intel do
    url "https://github.com/detectaibugs/homebrew-codex-tap/releases/download/vTEST3/detectaibugs-darwin-amd64.tar.gz"
    sha256 "10d4f677a9d3d352653eede257bff7e01d84eaf04a2f0bc0a764226b14f0186c"
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
