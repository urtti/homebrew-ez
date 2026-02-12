class Ez < Formula
  desc "Streamlines CLI command execution through aliases"
  homepage "https://github.com/urtti/homebrew-ez"
  url "https://github.com/urtti/homebrew-ez/releases/download/1.2.0/ez-1.2.0-macos.tar.gz"
  sha256 "aab19e15b752c6232a2d3046e9d26bf8a3e7062f1848c67665e3eeacdab5f072"
  license "MIT"

  def install
    bin.install "ez"
    zsh_completion.install "completions/_ez" => "_ez"
  end

  test do
    system "#{bin}/ez", "--version"
  end
end 
