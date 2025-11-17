# 🟡 SECURITY CLASSIFICATION: PUBLIC - USER FACING
# This file is distributed in public Homebrew taps and visible to all users.
# DO NOT add implementation details, API endpoints, or orchestration architecture.
# Focus on user benefits only. See SECURITY_CLASSIFICATION.md for guidelines.

class Detectaibugs < Formula
  desc "AI-powered bug detection for code quality assurance"
  homepage "https://detectaibugs.org"
  license "MIT"
  version "2.0.3"


  bottle do
    root_url "https://github.com/detectaibugs/homebrew-codex-tap/releases/download/v2.0.3"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "c4c3f4fe49f4bd24cf4999b34f6d864cb24c77cb158bf5f132ed663576e2d009"
    sha256 cellar: :any_skip_relocation, ventura: "9688814dd2fb92392c5f6a99835bf4b4f63dd4030dff2e18dcbd415b17720732"
  end

  on_arm do
    url "https://github.com/detectaibugs/homebrew-codex-tap/releases/download/v2.0.3/detectaibugs-darwin-arm64.tar.gz"
    sha256 "c00b6bc9235ad5d39eae52f4a536f026f376c6da9bc33a1688f863d5464e9b36"
  end

  on_intel do
    url "https://github.com/detectaibugs/homebrew-codex-tap/releases/download/v2.0.3/detectaibugs-darwin-amd64.tar.gz"
    sha256 "30b257b08b5c976bc50db4163d7092a711d807f6974fd6038a803895ab185214"
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
