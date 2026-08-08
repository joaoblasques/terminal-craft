# Mac-to-Mac Migration

Bring a brand-new Mac to a working state fast. Three files, three sources of truth —
each covers what the others structurally can't.

## 1. Homebrew (formulae, casks, taps, VS Code extensions, npm globals)
```
brew bundle install --file=Brewfile
```
Regenerate after installing/removing anything via `brew`:
```
brew bundle dump --force
```

## 2. Mac App Store apps
```
brew install mas   # if not already present
xargs -L 1 -I {} sh -c '{}' < mas.txt
```
(Requires being signed into the same Apple ID and `mas` being authenticated —
`mas account` confirms you're signed in.)
Regenerate the list:
```
mas list | awk '{print "mas install " $1 "  # " substr($0, index($0,$2))}' > mas.txt
```

## 3. Everything else (`APPS.md`)
No package-manager path exists for these — reinstall manually per the table in
`APPS.md`. Check it against the new machine once the above two steps are done.

## 4. Dotfiles
Already covered by this repo's core purpose — symlink `tmux.conf` and
`nvim/init.lua` into place (see repo `CLAUDE.md` for the exact commands).

## Order that actually works on a fresh Mac
1. Install Homebrew itself (not tracked here — one-line installer from brew.sh)
2. `brew bundle install --file=Brewfile` (also installs `mas` if listed)
3. `xargs -L 1 -I {} sh -c '{}' < mas.txt` (sign into Apple ID first)
4. Symlink dotfiles (`tmux.conf`, `nvim/init.lua`)
5. Check `APPS.md` for anything still missing
6. **Before blindly reinstalling everything from step 2-3: prune.** `mdls
   kMDItemLastUsedDate` on the old machine is unreliable (returns null for most
   apps even when actively used — confirmed 2026-08-08, don't trust it). Instead,
   go through `Brewfile`'s casks and `mas.txt`'s App Store apps by memory and only
   reinstall what you'd actually reach for on the new machine — this is the natural
   moment to prune, since "do I need this on my new Mac" is a much easier question
   than "have I used this in 2 years" in the abstract.
