class Ez < Formula
  desc "Streamlines CLI command execution through aliases"
  homepage "https://github.com/urtti/ez"
  url "https://github.com/urtti/ez/releases/download/1.3.0/ez-1.3.0-macos.tar.gz"
  sha256 "4f0830778cbb9d02a37fdbd8d58f897bb7081a1b5d61f42447005c1f45c63a6b"
  license "MIT"

  def install
    bin.install "ez"
    zsh_completion.install "completions/_ez" => "_ez"
  end

  test do
    system "#{bin}/ez", "--version"
  end
end 
