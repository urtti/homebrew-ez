class Ez < Formula
  desc "Streamlines CLI command execution through aliases"
  homepage "https://github.com/urtti/homebrew-ez"
  url "https://github.com/urtti/homebrew-ez/releases/download/v0.7.5/ez-v0.7.5-macos.tar.gz"
  sha256 "fdcb67d19d31b71dcd38c6455db70dd65557a268886fba0de60cb2ca69f06faf"
  license "MIT"

  def install
    bin.install "ez"
  end

  test do
    system "#{bin}/ez", "--version"
  end
end 
