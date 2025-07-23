class Ez < Formula
  desc "Streamlines CLI command execution through aliases"
  homepage "https://github.com/urtti/homebrew-ez"
  url "https://github.com/urtti/homebrew-ez/releases/download/v0.7.0/ez-v0.7.0-macos.tar.gz"
  sha256 "4e1b7f459158e3ee2598b3d5236735e0ce04aaf673ef35d716a2fd7a094725ec"
  license "MIT"

  def install
    bin.install "ez"
  end

  test do
    system "#{bin}/ez", "--version"
  end
end 
