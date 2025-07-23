class Ez < Formula
  desc "Streamlines CLI command execution through aliases"
  homepage "https://github.com/urtti/homebrew-ez"
  url "https://github.com/urtti/homebrew-ez/releases/download/v0.7.0/ez-v0.7.0-macos.tar.gz"
  sha256 "fde34177fdfb93d006284168033010b847338861dcf000e4901afda6e9cf3e8e"
  license "MIT"

  def install
    bin.install "ez"
  end

  test do
    system "#{bin}/ez", "--version"
  end
end 
