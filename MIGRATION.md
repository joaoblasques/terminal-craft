# Mac-to-Mac Migration

This used to live here in full. As of 2026-08-08, `~/.dotfiles` is the single source
of truth for dotfiles AND machine bootstrap — it already had a more mature `install.sh`
(Xcode CLT, Homebrew, Oh-My-Zsh, Powerlevel10k) than this repo's own attempt, so this
repo's version was retired in its favor.

**Real migration path:** `~/.dotfiles/install.sh` —
```
curl -fsSL https://raw.githubusercontent.com/joaoblasques/dotfiles/main/install.sh | bash
```

This repo's Lesson 10 contribution (Mac App Store app tracking via `mas.txt`, a
manual-only-install checklist via `APPS.md`) was genuinely new capability `install.sh`
didn't have — it's now folded into `~/.dotfiles` directly rather than duplicated here.

See `~/.dotfiles`' own `README.md` for the full procedure.
