# Shell Cheatsheet (Terminal-Craft)

Open in a split from nvim: `:sp ~/Dev/terminal-craft/shell/cheatsheet.md`

## History
- `↑` / `↓` — step through history one command at a time
- `Ctrl-R` + type — reverse incremental search (live substring match, most recent first)
- `Ctrl-R` (repeat) — cycle to the next older match for the same search
- `Enter` — run the found command as-is
- any arrow key / typing — drop out of search mode, edit the found command first

## Aliases
- Pure text substitution — the shell rewrites the typed word before running anything.
  Only expands at the START of a command (or after `;`/`&&`/`|`), never mid-line as an
  argument.
- `alias gs='git status'` — define; `gs` now expands to `git status`
- `alias` (no args) — list all currently defined aliases
- `unalias gs` — remove one

## Functions
- Real shell logic — takes arguments (`$1`, `$2`, ...), can branch, loop, chain
  multiple commands. Use when an alias's dumb text-substitution isn't enough.
- Example: `mkcd` — create a directory and `cd` into it in one step
  ```sh
  mkcd() {
    mkdir "$1"
    cd "$1"
  }
  ```

## PATH
- `echo $PATH` — print the colon-separated list of directories the shell searches for
  commands, in order
- First match wins — if two programs share a name and both directories are on PATH,
  whichever directory comes FIRST wins, silently. No error, no warning.
- `which <command>` — show which directory's copy actually runs
- `type <command>` — like `which`, but also reports if it's an alias/function instead
  of a file on disk

## Config load order
- `.zshrc` (or `.bashrc`) is read ONCE, at shell startup — not watched, not re-read
  automatically as you edit it.
- Editing the file does nothing to an already-running shell until you reload it:
  - `source ~/.zshrc` — reload the CURRENT shell in place (keeps your directory/session)
  - open a new terminal — starts a fresh shell that reads the file from scratch

## Job control
- `command &` — run a command in the background, get the prompt back immediately
- `Ctrl-Z` — suspend the current foreground job
- `fg` — resume the most recently suspended/backgrounded job in the foreground
- `bg` — resume the most recently suspended job, but in the background
- `jobs` — list all background/suspended jobs for this shell session

## Modern CLI tools
The pattern across all of these: they add context (git state, ignore rules, usage
history, data structure) that the classic Unix tool they replace predates and
structurally cannot see.
- `eza -la --git --no-icons` — like `ls -la`, but git-aware (queries git per-file,
  shows modified/staged/untracked status inline)
- `rg <pattern>` — like `grep -r`, but automatically respects `.gitignore` (skips
  `node_modules/`, build artifacts, etc. with no flags needed)
- `fd <pattern>` — like `find`, but gitignore-aware and simpler syntax
- `bat <file>` — like `cat`, but with syntax highlighting and git-diff markers in the
  margin (`bat --plain` for raw output)
- `z <fragment>` (zoxide) — like `cd`, but ranks past directories by frecency
  (frequency + recency) and jumps via fuzzy match — `cd` has no memory, `zoxide` does
- `jq '.path.to.field'` — parses actual JSON structure (objects/arrays/nesting) instead
  of matching text, so it survives minified/reformatted JSON that would break `grep`

## Mac-to-Mac migration
Three files, three sources of truth — full procedure in `MIGRATION.md`.
- `brew bundle dump --force` — write every formula/cask/tap/vscode-extension/npm-global
  to a `Brewfile`, as real reinstall directives (declarative, replayable — unlike
  `brew list`'s name-only output)
- `brew bundle install --file=Brewfile` — replay a Brewfile on a new machine
- `mas list` — list installed Mac App Store apps (Homebrew structurally cannot see
  these — different distribution channel entirely)
- `mas install <app-id>` — reinstall by numeric App Store ID (the name alone doesn't
  work — `mas help install` confirms the command takes `<app-id>`)
- `APPS.md` — plain checklist for anything with NO package-manager path at all
  (direct-download-only installs); kept honestly incomplete, filled in as noticed
