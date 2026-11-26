class SayIt < Formula
  desc "Pronounce 1,988 developer jargon names out loud, with cited sources"
  homepage "https://pronounce.renlab.ai"
  url "https://github.com/anzy-renlab-ai/pronounce/releases/download/v2.43.0/say-it-2.43.0.tar.gz"
  sha256 "2e6bd7820b1a45f7f5518adc219115b8f73989a338e92d1f845de77a3717b9b3"
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
