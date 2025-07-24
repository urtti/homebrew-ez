class Ez < Formula
  desc "Streamlines CLI command execution through aliases"
  homepage "https://github.com/urtti/homebrew-ez"
  url "https://github.com/urtti/homebrew-ez/releases/download/v0.7.6/ez-v0.7.6-macos.tar.gz"
  sha256 "3133e1068bbc0558af8d4875b4f59519a32463642391be24cecca544925e7b45"
  license "MIT"

  def install
    bin.install "ez"
  end

  test do
    system "#{bin}/ez", "--version"
  end
end 
