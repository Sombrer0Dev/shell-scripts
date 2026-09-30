# shell-scripts

Shell owns finding, Neovim owns editing. Plain POSIX-ish bash, no Nix
dependency, so it works the same on NixOS and on a plain Ubuntu box.

## Scripts

- `vf [dir]` — fuzzy-find a file (via `fd` + `fzf`, `bat` preview) and open it
  in `$EDITOR` (default `nvim`).
- `vg [query]` — live `ripgrep` search through `fzf` (reloads as you type),
  `bat` preview centered on the match, opens the selection in `$EDITOR` with
  the cursor placed at the matched line/column.

## Install

```sh
./install.sh            # symlinks bin/* into ~/.local/bin
./install.sh ~/some/dir # or symlink somewhere else
```

Make sure that directory is on `$PATH`.

## Dependencies

`fd`, `ripgrep`, `fzf`, and optionally `bat` (falls back to `cat` if
missing). On Debian/Ubuntu these are packaged as `fd-find` (binary
`fdfind`) and `bat` (binary `batcat`) — both scripts detect either name
automatically.

```sh
# Ubuntu/WSL
sudo apt install fd-find ripgrep fzf bat

# NixOS — already present via nix-config's packages.nix
```

`vg`'s `+call cursor(line,col)` jump assumes a Vim/Neovim-compatible
`$EDITOR`.
