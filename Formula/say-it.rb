class SayIt < Formula
  desc "Pronounce 1,984 developer jargon names out loud, with cited sources"
  homepage "https://pronounce.renlab.ai"
  url "https://github.com/anzy-renlab-ai/pronounce/releases/download/v2.42.1/say-it-2.42.1.tar.gz"
  sha256 "2e294dc458c16ee749959756774ba8a2f43133f25c7390f17772d07682430d10"
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
