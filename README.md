# gAmUssA/worksync

Homebrew tap for [WorkSync](https://github.com/gAmUssA/worksync) — a macOS menu
bar app and CLI that mirrors busy time from personal calendars onto a work
calendar as sanitized blockers, entirely locally through EventKit.

```bash
brew install --cask gAmUssA/worksync/worksync
```

That installs `WorkSync.app` and puts the `worksync` CLI on your PATH; they are
the same binary.

Then grant Calendar access and write a config:

```bash
worksync init          # commented ~/.config/worksync/config.toml
worksync calendars     # your accounts and calendars, by exact name
worksync sync --dry-run
worksync doctor        # checks everything that can quietly go wrong
```

A tap rather than the main Homebrew cask repository because homebrew-cask
requires a notability threshold this project does not meet yet.
