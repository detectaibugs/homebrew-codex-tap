class Detectaibugs < Formula
  desc "AI-powered code analysis tool"
  homepage "https://github.com/discoveraibugs/homebrew-codex-tap"
  version "2.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/discoveraibugs/homebrew-codex-tap/releases/download/v2.0.0/detectaibugs-darwin-arm64.tar.gz"
      sha256 "7e421f13d037f678b2fd82c3e3174a7a28b8c7a26812bfb6cb2695b9a9902232"
    else
      url "https://github.com/discoveraibugs/homebrew-codex-tap/releases/download/v2.0.0/detectaibugs-darwin-amd64.tar.gz"
      sha256 "9a5a9fce8924d84e1c881a65198f3736b1c19c9dd068b6aed22374dc43e8ea9e"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "detectaibugs-darwin-arm64" => "detectaibugs"
    else
      bin.install "detectaibugs-darwin-amd64" => "detectaibugs"
    end

    # Install supporting files
    pkgshare.install "detectaibugs-command-claude.md"
    pkgshare.install "detectaibugs-command-codex.md"
    pkgshare.install "post-install.sh"
  end

  def post_install
    # Auto-detect and install slash commands for Claude/Codex
    system "bash", "#{pkgshare}/post-install.sh" if File.exist?("#{pkgshare}/post-install.sh")
  end

  test do
    assert_match "detectaibugs v#{version}", shell_output("#{bin}/detectaibugs version")
  end
end
