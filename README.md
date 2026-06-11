# anzy-renlab-ai/homebrew-tap

Homebrew tap for [mypet](https://github.com/anzy-renlab-ai/mypet) and
other small Mac apps.

## Install

```bash
brew install --cask anzy-renlab-ai/tap/mypet
```

Or, in two steps:

```bash
brew tap anzy-renlab-ai/tap
brew install --cask mypet
```

After install, the 🐾 paw appears in your menubar. Double-click the
cat to feed her one `claude -p` call.

## Available casks

| Cask  | Description                                                | Version |
| ----- | ---------------------------------------------------------- | ------- |
| mypet | Fluffy desktop cat that eats your Claude Code tokens       | 0.1.1   |

## Available formulae

| Formula | Description                                                              | Version |
| ------- | ------------------------------------------------------------------------ | ------- |
| say-it  | Pronounce 1,650+ developer jargon names out loud ([pronounce](https://github.com/anzy-renlab-ai/pronounce)) | 2.12.0  |

```bash
brew install anzy-renlab-ai/tap/say-it
say-it kubectl
```

## Updating

```bash
brew update
brew upgrade --cask mypet
```

## Uninstall

```bash
brew uninstall --cask mypet
brew untap anzy-renlab-ai/tap
```
