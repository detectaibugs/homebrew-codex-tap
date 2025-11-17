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
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "31a98be46f53f393cdc98ef2555a465c0144a2bb0ad5ca505f921121db798e42"
    sha256 cellar: :any_skip_relocation, ventura: "fa296515eafd68368b5eca2f7bf08809a05d260c99f6bb1138a4202f41cd791a"
  end

  on_arm do
    url "https://github.com/detectaibugs/homebrew-codex-tap/releases/download/vTEST/detectaibugs-darwin-arm64.tar.gz"
    sha256 "833dad67c4b1aab0d2cacc5a518ae56f1a39475c91f55034910e54733b099a2f"
  end

  on_intel do
    url "https://github.com/detectaibugs/homebrew-codex-tap/releases/download/vTEST/detectaibugs-darwin-amd64.tar.gz"
    sha256 "9066649c472b9995780475ec0160792487dbc7055c10bc1f44cfc9845f29b4c9"
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
