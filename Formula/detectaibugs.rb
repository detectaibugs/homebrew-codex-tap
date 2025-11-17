class Detectaibugs < Formula
  desc "AI-powered code analysis tool"
  homepage "https://github.com/discoveraibugs/homebrew-codex-tap"
  version "2.0.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/discoveraibugs/homebrew-codex-tap/releases/download/v2.0.1/detectaibugs-darwin-arm64.tar.gz"
      sha256 "340fb201753fe4326a1b634855452c5a2b055d13d0ed31bb7248415017241365"
    else
      url "https://github.com/discoveraibugs/homebrew-codex-tap/releases/download/v2.0.1/detectaibugs-darwin-amd64.tar.gz"
      sha256 "13c1a555e537ff19ea12be4b3c2153253474c446736bb55b863cc98dd27e1e26"
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
