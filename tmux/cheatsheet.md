# tmux Cheatsheet (Terminal-Craft)

Prefix key in this config is `C-a` (not tmux's default `C-b`) — see `tmux.conf`.

## Sessions
- `tmux new -s <name>` — create a new, named session
- `tmux ls` — list all running sessions
- `tmux attach -t <name>` — attach to a specific existing session
- `tmux attach` — attach to the only session (ambiguous if more than one exists)
- `C-a d` — detach from the current session (it keeps running)
- Rule of thumb: one session per project — a crash/kill in one session can never touch
  another. Reserve new sessions for genuine blast-radius isolation, not every new task.

## Windows
- `C-a c` — create a new window
- `C-a n` / `C-a p` — next / previous window
- `C-a <number>` — jump directly to window N
- `C-a ,` — rename the current window
- Use a window for a different task within the SAME project — shared blast radius is
  fine, you're just flipping attention.

## Panes
- `C-a |` — split pane vertically (side by side)
- `C-a -` — split pane horizontally (stacked)
- `C-a h/j/k/l` (via this config's vim-aware bindings) — move focus between panes
- `C-a x` — close the current pane
- Use a pane only when two things need to be visible AT THE SAME TIME, permanently —
  not as the default way to "add one more thing."

## Layouts
- `C-a space` — cycle through the 5 built-in preset layouts:
  even-horizontal (`M-1`), even-vertical (`M-2`), main-horizontal (`M-3`),
  main-vertical (`M-4`), tiled (`M-5`)
- `⌥5` (Option+5 on Mac) — jump straight to tiled layout without cycling
- `C-a :select-layout tiled` — command-line fallback if Option+number is unreliable in
  your terminal app's keyboard settings
- Why presets beat manual splitting past 2 panes: a manual split only knows about the
  ONE pane it's cutting, so splitting a 2-pane layout again goes lopsided (one big pane
  + two small). A preset layout recomputes ALL panes together.

## Mode indicator note (Warp specific)
- This config sets `status-position top` — the tmux status bar renders at the TOP of
  the screen, not the bottom most tutorials assume.
