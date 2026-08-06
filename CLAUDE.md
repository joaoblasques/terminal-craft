# dotfiles

Hands-on tmux + nvim configs, built up lesson-by-lesson via the Terminal-Craft
learning project. Goal: multi-pane AI-agent orchestration (tmux) + fast
editing/review fluency (nvim) for heavy AI-coding work.

## Layout
| File | Purpose |
|---|---|
| `tmux.conf` | Symlinked to `~/.tmux.conf` |
| `nvim/init.lua` | Symlinked to `~/.config/nvim/init.lua` |

## Rules
- Extend incrementally — never discard existing bindings without a reason logged in the commit message.
- No plugin manager / IDE stack in nvim (editing fluency only, not a VS Code rebuild).
- No tmux plugin manager (tpm) — detach/reattach covers persistence needs.
- After any edit, reload live: `tmux source-file ~/.tmux.conf` (tmux) or restart nvim (nvim).

## Reference
- Vault brain: `~/Dev/second-brain/02_Areas/Side Projects/Terminal-Craft/`
- Design spec: `~/Dev/second-brain/docs/superpowers/specs/2026-08-06-terminal-craft-design.md`
