class Ez < Formula
  desc "Streamlines CLI command execution through aliases"
  homepage "https://github.com/urtti/homebrew-ez"
  url "https://github.com/urtti/homebrew-ez/releases/download/v1.0.4/ez-v1.0.4-macos.tar.gz"
  sha256 "406d0a1701ee069459e1cc932e61bbb1cd09e9bd30dd5bc91dc1053cb4cb94d6"
  license "MIT"

  def install
    bin.install "ez"
    zsh_completion.install "completions/_ez" => "_ez"
  end

  test do
    system "#{bin}/ez", "--version"
  end
end 
