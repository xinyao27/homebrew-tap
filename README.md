# Homebrew tap for AtAt

[AtAt](https://atatapp.com/): Your agent, in any app.

Type `@@` in any Mac text field, ask your agent, and press Tab to put the answer at your cursor.

## Install

```bash
brew install --cask xinyao27/tap/atat
```

Or tap the repository first and use the short cask name:

```bash
brew tap xinyao27/tap
brew install --cask atat
```

In a `Brewfile`:

```ruby
tap "xinyao27/tap"
cask "atat"
```

Requires an Apple silicon Mac on macOS Sequoia or later. AtAt updates itself after install.

## What's inside

- [Local models](https://atatapp.com/features/local-models): use Ollama or Siri AI as your agent's model, no API key
- [Bring your own API key](https://atatapp.com/features/own-api-key): OpenAI, Anthropic, OpenRouter, or DeepSeek, stored in Keychain
- [TabTab](https://atatapp.com/features/tabtab): AI autocomplete inside every Mac app
- [Clipboard history](https://atatapp.com/features/clipboard-history), [screen capture](https://atatapp.com/features/screen-capture), and [selection actions](https://atatapp.com/features/selection-actions)

Read the [manual](https://atatapp.com/manual) or [download the DMG](https://atatapp.com/download) instead.
