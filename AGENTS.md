# AGENTS.md

Personal dotfiles managed with GNU Stow. There is no build, test suite, or CI. Changes are verified by hand.

## Layout and editing

- Each top-level directory is a stow package. Its tree mirrors `$HOME`: `zsh/.zshrc` -> `~/.zshrc`, `opencode/.config/opencode/` -> `~/.config/opencode/`.
- `~` files are symlinks into this repo. Edit the repo copy (`zsh/.zshrc`), never `~/...`.
- New config goes in the package path that mirrors its target, then stow that package.
- `pre-commit/.pre-commit-config.yaml` is inside a package, not the repo root. Repo hooks are not active (`.git/hooks` has only samples).
- Commit subjects are short, lowercase, imperative (e.g. `disable ghostty blinking cursor`). Branch: `main`.

## Commands

- Preview a stow package: `stow --no --verbose=2 --target="$HOME" --restow <pkg>`
- Apply: `stow --restow --target="$HOME" <pkg>` (run from the repo root)
- Stow refuses to overwrite real files in `$HOME`. Move them aside first. `install.sh` does this automatically, backing up to `~/.dotfiles-backup/<timestamp>`.
- `./install.sh` bootstraps Linux devcontainers only: Nix, the `flake.nix` profile, then stows a fixed `PACKAGES` list. `opencode`, `pi`, `ghostty`, `wezterm`, `aerospace`, `prettier` are not in that list. Add a package there only if it belongs in devcontainers.
- macOS setup is the Homebrew list in `README.md`.

## Verification

- Repo hooks: `pre-commit run --all-files -c pre-commit/.pre-commit-config.yaml` (passes on the current tree). The fixers (trailing whitespace, end-of-file) rewrite files, so review the diff afterward.
- Shell syntax: `bash -n install.sh` and `zsh -n zsh/.zshrc`.
- `prettier/.prettierrc` (proseWrap always, printWidth 80) is stowed to `~/.prettierrc`. `nvim/.config/nvim/stylua.toml` applies to Lua. Neither tool is installed on this machine.

## Gotchas

- `zsh/.zshrc` is macOS-only as written. Line 60 calls `brew --prefix` unguarded, and lines 27 and 61 need `kubectl` and `fzf`. It will fail in a Linux devcontainer.
- `zsh/.zshrc` sources `shell/.aliases` and `shell/.functions`. Put new aliases and functions in those files.
- `opencode/.config/opencode/` is the OpenCode global config. `opencode.json` sets `autoupdate: false`. The `agentgateway` provider needs `AGENTGATEWAY_BASE_URL` and `AGENTGATEWAY_API_KEY` in the environment.
- Plugin deps for OpenCode are in `opencode/.config/opencode/package.json`. Its `.gitignore` excludes `node_modules`, `package.json`, and `package-lock.json`.
- Sensitive or generated state is gitignored: `pi/.pi/agent/auth.json`, `pi/.pi/agent/models-store.json`, `pi/.pi/agent/sessions/**`, `pi/.pi/agent/bin/**`, and `opencode/.config/opencode/service.json`. Do not print, read into context, or commit these.
