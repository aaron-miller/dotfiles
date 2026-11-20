# AGENTS.md

Personal dotfiles managed with Nix flakes (nix-darwin on macOS, home-manager on Linux). There is no test suite or CI. Changes are verified by evaluating the flake and by hand.

## Layout and editing

- Each top-level config directory is a package. Its tree mirrors `$HOME`: `zsh/.zshrc` -> `~/.zshrc`, `opencode/.config/opencode/` -> `~/.config/opencode/`. `nix/home/files.nix` links these into `$HOME`.
- Links are editable: `~/.zshrc` points at the repo file, so editing the repo copy takes effect immediately. Never edit `~/...` directly.
- New config files need `git add` (flakes only see tracked files) and a rebuild, because links are created per file.
- Hosts are listed once in the `hosts` table in `flake.nix`: system, user, and an optional `role`. Each host's home config is built from:
  - `nix/home/` (every machine): `common.nix` packages and config, `files.nix` dotfile links, `neovim.nix`, `packages.nix` (the shared package option).
  - `nix/home/darwin.nix` or `nix/home/linux.nix`, by system.
  - `nix/home/profiles/<role>.nix`, if the host has a `role` (`desktop` or `headless`).
  - `nix/hosts/<hostname>.nix`, for that machine's overrides.
- Shared packages go in `nix/home/common.nix` (both OSes), `nix/home/linux.nix` (Linux only), or `nix/home/darwin.nix` (Mac only). Add them to `dotfiles.homePackages`. A host drops one with `dotfiles.excludeHomePackages = [ "name" ]`, and drops a dotfile package with `dotfiles.excludeDotfiles = [ "wezterm" ]`. Both lists are checked, so a misspelled name fails the evaluation.
- Mac GUI apps and taps go in `nix/darwin/homebrew.nix`. macOS defaults go in `nix/darwin/settings.nix`. Prefer nixpkgs over brew.
- `linkedDirs` in `nix/home/files.nix` lists gitignored directories that are linked whole (plugins and runtime state). Add to it when a gitignored directory must exist in `$HOME`.
- Commit subjects are short, lowercase, imperative (e.g. `disable ghostty blinking cursor`). Branch: `main`.

## Commands

- Evaluate the Mac system config (no activation): `nix eval --raw '.#darwinConfigurations.work.config.system.build.toplevel.drvPath'`
- Evaluate a user config (no activation): `nix eval --raw '.#homeConfigurations."<user>@<host>".activationPackage.drvPath'`. Keys are `aaron.miller@work`, `aaron@proteus`, `aaron@neptune`, `aaron@thinkpad`, `aaron@ubuntu`. Each key's host name must match the machine's hostname, which `rebuild` relies on.
- Apply user config: `home-manager switch --flake ~/.dotfiles#<user>@<host>`
- Apply system config and Homebrew on macOS: `sudo darwin-rebuild switch --flake ~/.dotfiles#<host>` (must run as root; only needed when `nix/darwin/` changes)
- Update pinned inputs: `nix flake update`, then commit `flake.lock`.

Flakes need `experimental-features = nix-command flakes`. nix-darwin and `nix/home/common.nix` (via `~/.config/nix/nix.conf`) set this. Before that's in place, pass `--extra-experimental-features 'nix-command flakes'` on the command line.

## Verification

- Evaluate both configs (commands above). A successful eval is the minimum check before a switch.
- Shell syntax: `zsh -n zsh/.zshrc`.
- `prettier/.prettierrc` (proseWrap always, printWidth 80) is linked to `~/.prettierrc`. Prettier isn't installed through Nix yet.

## Gotchas

- `zsh/.zshrc` uses `/etc/profiles/per-user/$USER` (macOS) and `~/.nix-profile` (Linux) for completions and zsh-syntax-highlighting. Put new aliases and functions in `shell/.aliases` and `shell/.functions`.
- Linux non-NixOS: the Nix profile isn't on PATH for zsh by default, so `.zshrc` adds `~/.nix-profile/bin`.
- Gitignored state is never copied into the Nix store. Linked directories (see `linkedDirs`) point at the repo on disk. The sensitive files there are `pi/.pi/agent/auth.json`, `pi/.pi/agent/models-store.json`, `pi/.pi/agent/sessions/**`, `pi/.pi/agent/bin/**`, and `opencode/.config/opencode/service.json`. Do not print, read into context, or commit these.
- Git identity: `git/.gitconfig` includes `~/.config/git/identity`, which holds each machine's `[user] email`. That file is created by hand on each machine and is not in the repo. Don't add emails back to tracked files.
- `opencode/.config/opencode/` is the OpenCode global config. `opencode.json` sets `autoupdate: false`. The `agentgateway` provider needs `AGENTGATEWAY_BASE_URL` and `AGENTGATEWAY_API_KEY` in the environment.
- Plugin deps for OpenCode live in `opencode/.config/opencode/package.json`, which is gitignored. Its `node_modules` is linked whole with the directory.
