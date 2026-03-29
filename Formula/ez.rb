class Ez < Formula
  desc "Streamlines CLI command execution through aliases"
  homepage "https://github.com/urtti/homebrew-ez"
  url "https://github.com/urtti/homebrew-ez/releases/download/1.2.2/ez-1.2.2-macos.tar.gz"
  sha256 "24fb020a900d5e182ecdc93099a44ff62f4c8ed924c3f5c25f9020833f13c8f9"
  license "MIT"

  def install
    bin.install "ez"
    zsh_completion.install "completions/_ez" => "_ez"
  end

  test do
    system "#{bin}/ez", "--version"
  end
end 
