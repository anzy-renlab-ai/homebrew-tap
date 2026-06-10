class SayIt < Formula
  desc "Pronounce 1,650+ developer jargon names out loud, with cited sources"
  homepage "https://pronounce.renlab.ai"
  url "https://github.com/anzy-renlab-ai/pronounce/archive/refs/tags/v2.10.1.tar.gz"
  sha256 "438e4332af45f5fbfb703f0484c777d1e233e25ed11b71facfcc7f6943c52637"
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
