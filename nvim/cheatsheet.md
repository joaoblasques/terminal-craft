# nvim Cheatsheet (Terminal-Craft)

Open in a split anytime: `:sp ~/Dev/terminal-craft/nvim/cheatsheet.md`
Open in a new tab: `:tabnew ~/Dev/terminal-craft/nvim/cheatsheet.md`

## Modes
- `i` — insert mode (bar cursor, typing = text)
- `A` — insert at end of current line
- `a` — insert after cursor
- `o` / `O` — open new line below / above, enter insert mode
- `Esc` — back to normal mode (block cursor, keys = commands)
- `u` — undo last change
- `Ctrl-r` — redo (undo the undo)

## Quitting / saving
- `:w` — save
- `:q` — quit (fails if unsaved changes)
- `:q!` — quit without saving (escape hatch)
- `:wq` — save and quit
- `:x` — save and quit only if there were changes

## File paths
- Relative paths (`:e practice.py`) resolve against nvim's cwd, not your last-opened
  file or your shell prompt's visible dir — check with `:pwd`.
- `:e <path>` — open a file (replaces current buffer)
- `:tabnew <path>` — open a file in a new tab
- `:sp <path>` — open a file in a horizontal split
- `:vsp <path>` — open a file in a vertical split

## Motions
- `/pattern` + `n` / `N` — search forward, next/previous match
- `?pattern` — search backward
- `200G` or `:200` — jump to line 200
- `gg` / `G` — jump to first / last line
- `0` / `$` — start / end of current line
- `w` / `b` — jump forward / backward one word
- `dd` — delete current line
- `dw` — delete word
- `d$` — delete to end of line
- `yy` — yank (copy) current line
- `p` / `P` — paste after / before cursor

## Registers
- `"ayy` — yank current line into register `a`
- `"ap` — paste register `a`'s contents
- (named registers `a`-`z` persist until overwritten; unnamed register `"` holds the
  most recent yank/delete regardless of a named register)

## Macros
- `qa` ... `q` — record keystrokes into register `a`, stop recording
- `@a` — replay macro `a` once
- `14@a` — replay macro `a` 14 times
- `@@` — replay the last-used macro again

## Search / replace
- `:%s/old/new/g` — replace every `old` with `new` on every line in the file
  (`%` = whole file, `s` = substitute, `g` = all matches per line, not just the first)
- `:s/old/new/g` — same, but only the current line (no `%`)
- `:%s/old/new/gc` — same as `:%s/old/new/g` but asks to confirm each match first

## Windows / splits
- `:sp` — split horizontally (new split on top)
- `:vsp` — split vertically (new split on left)
- `Ctrl-w h/j/k/l` — move focus to the split left/down/up/right
- `Ctrl-w w` — cycle focus to the next split
- `Ctrl-w q` — close the current split
- `Ctrl-w =` — resize all splits to equal size

## Tabs
- `:tabnew <path>` — open a file in a new tab
- `gt` / `gT` — next / previous tab
- `:tabclose` — close current tab

## LSP (Python via pyright)
Requires `pyright` on PATH (`npm install -g pyright`) — auto-attaches to any `.py`
buffer via `init.lua`'s `FileType python` autocmd. No plugin manager needed; this is
nvim's built-in `vim.lsp` client (0.10+).
- `gd` — go to definition (jumps to where a function/class/variable is actually defined)
- `K` — hover (shows type info / docstring for whatever's under the cursor)
- `<leader>e` (space then `e`) — show the diagnostic under the cursor in a floating window
- `]d` / `[d` — jump to next / previous diagnostic in the buffer
- Diagnostics (errors/warnings) show as underlines + signcolumn markers automatically,
  no keypress needed — e.g. calling a method that doesn't exist on an inferred type.
- Scope note: pyright catches type/reference errors it can see in the code itself
  (typo'd method names, wrong argument types). It does NOT catch logic bugs like "no
  caller actually passes this parameter" — that requires tracing actual call sites,
  which is a different (harder) problem than type-checking a single file.

## Mode indicator (Warp/tmux specific)
- Cursor SHAPE is the real signal: thin bar = insert mode, solid block = normal mode.
  Text status line at the bottom (`file [+] row,col  pct%`) does not show mode name in
  this setup — go by cursor shape, not the status line text.
