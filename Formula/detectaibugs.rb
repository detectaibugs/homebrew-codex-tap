# 🟡 SECURITY CLASSIFICATION: PUBLIC - USER FACING
# This file is distributed in public Homebrew taps and visible to all users.
# DO NOT add implementation details, API endpoints, or orchestration architecture.
# Focus on user benefits only. See SECURITY_CLASSIFICATION.md for guidelines.

class Detectaibugs < Formula
  desc "AI-powered bug detection for code quality assurance"
  homepage "https://detectaibugs.org"
  license "MIT"
  version "2.1.6"


  bottle do
    root_url "https://github.com/detectaibugs/homebrew-codex-tap/releases/download/v2.1.6"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "7f7b0b1ea04ec17191da55841670535c6a64fe33edf2747f15b7d62bbf108fdd"
    sha256 cellar: :any_skip_relocation, sequoia: "3a16e49e7168c2e0eebef4399c28e4ea785cd01bee974cc74b2c31d8a0a0baf3"
  end

  on_arm do
    url "https://github.com/detectaibugs/homebrew-codex-tap/releases/download/v2.1.6/detectaibugs-darwin-arm64.tar.gz"
    sha256 "1178c273c54a97f7db1b3d2385aec792c5fbb27c63db427983d2a2692a2a1ea7"
  end

  on_intel do
    url "https://github.com/detectaibugs/homebrew-codex-tap/releases/download/v2.1.6/detectaibugs-darwin-amd64.tar.gz"
    sha256 "87ffa5ccbbc590360ef609ecaab56cb2c649b576b9c08f3f83b2ce345bc2f158"
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


    
      *** Experiencing errors? Try manually:
      `brew untap detectaibugs/claude-tap && brew tap detectaibugs/claude-tap && brew upgrade detectaibugs`

      `brew untap detectaibugs/codex-tap && brew tap detectaibugs/codex-tap && brew upgrade detectaibugs`


      *** Need help?
      Email our Chief of Customer Support: Steph@DetectAIBugs.org


    
    EOS
  end

  test do
    assert_match "detectaibugs", shell_output("#{bin}/detectaibugs version")
    assert_match "USAGE", shell_output("#{bin}/detectaibugs help")
  end
end
