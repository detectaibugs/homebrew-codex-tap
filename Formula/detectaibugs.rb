# 🟡 SECURITY CLASSIFICATION: PUBLIC - USER FACING
# This file is distributed in public Homebrew taps and visible to all users.
# DO NOT add implementation details, API endpoints, or orchestration architecture.
# Focus on user benefits only. See SECURITY_CLASSIFICATION.md for guidelines.

class Detectaibugs < Formula
  desc "AI-powered bug detection for code quality assurance"
  homepage "https://detectaibugs.org"
  license "MIT"
  version "TEST2"


  bottle do
    root_url "https://github.com/detectaibugs/homebrew-codex-tap/releases/download/vTEST2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "c4d51656cee42976f3835484d773f3be6ede0a40808ef1804a40c536989f255a"
    sha256 cellar: :any_skip_relocation, ventura: "ea932594766964b87895f0406591b57f019f1f8783f7967a51ca654cab470479"
  end

  on_arm do
    url "https://github.com/detectaibugs/homebrew-codex-tap/releases/download/vTEST2/detectaibugs-darwin-arm64.tar.gz"
    sha256 "918ecac370493c453382f72264c8041213ae53c26841230253ec75de5765bbb9"
  end

  on_intel do
    url "https://github.com/detectaibugs/homebrew-codex-tap/releases/download/vTEST2/detectaibugs-darwin-amd64.tar.gz"
    sha256 "b9154475aab9bc131b76a9821f125d12bd8017dd44ecac138d79a35c0a277da5"
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
