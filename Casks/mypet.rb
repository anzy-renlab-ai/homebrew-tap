cask "mypet" do
  version "0.1.1"
  sha256 "8f4d0e81c7fc696ee261f5c16265ca6b486affd2b27855969b2411f4c45f4bbd"

  url "https://github.com/anzy-renlab-ai/mypet/releases/download/v#{version}/mypet-#{version}-macos.zip",
      verified: "github.com/anzy-renlab-ai/mypet/"
  name "mypet"
  desc "Fluffy desktop cat that eats your Claude Code tokens"
  homepage "https://mypet.renlab.ai"

  depends_on macos: ">= :ventura"

  app "mypet.app"

  zap trash: [
    "~/Library/Application Support/mypet",
    "~/Library/Preferences/ai.renlab.mypet.plist",
    "~/Library/Caches/ai.renlab.mypet",
    "~/Library/Saved Application State/ai.renlab.mypet.savedState",
  ]

  caveats <<~EOS
    mypet uses your existing Claude Code CLI. Make sure `claude` is on
    your $PATH:

      brew install anthropic/cli/claude   # or your install of choice
      claude --version

    First launch will be blocked by Gatekeeper because mypet ships
    ad-hoc-signed (no Apple Developer ID). Either:

      • right-click mypet.app → Open → Open in the dialog, or
      • run:  xattr -d com.apple.quarantine "#{appdir}/mypet.app"

    Look for the 🐾 paw in your menubar. Double-click the cat to feed.
  EOS
end
