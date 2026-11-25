class SayIt < Formula
  desc "Pronounce 1,984 developer jargon names out loud, with cited sources"
  homepage "https://pronounce.renlab.ai"
  url "https://github.com/anzy-renlab-ai/pronounce/releases/download/v#{version}/say-it-#{version}.tar.gz"
  sha256 "9ad73f7c6e9becc466e9abf9eaddaf7ee8e5d4346cbdda52178562cab3d742c6"
  license "MIT"

  def install
    bin.install "bin/say-it"
    (share/"say-it").install "data/pronunciations.tsv"
    bash_completion.install "completions/say-it.bash" => "say-it"
    zsh_completion.install "completions/_say-it"
  end

  def caveats
    <<~EOS
      macOS uses the built-in `say` engine — nothing else to install.
      On Linux, install espeak-ng for speech output:
        sudo apt install espeak-ng
    EOS
  end

  test do
    assert_match "say-it", shell_output("#{bin}/say-it -V")
    assert_match "kubectl", shell_output("#{bin}/say-it --why kubectl")
  end
end
