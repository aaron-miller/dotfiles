-- Treesitter configuration for Nix-managed devcontainer environments.
--
-- In devcontainers, the install.sh script symlinks pre-built tree-sitter
-- parsers from the Nix store into ~/.local/share/nvim/site/parser/ so that
-- nvim-treesitter finds them ready-compiled and skips the C build step.
--
-- This file disables auto-install of parsers that Nix already provides,
-- preventing unnecessary compilation on first launch. If you need additional
-- parsers not listed in the Nix flake, add them to `extra_ensure_installed`
-- below and they will be compiled on demand.

local is_devcontainer = vim.fn.getenv("DEVCONTAINER") ~= vim.NIL
  or vim.fn.getenv("DEVPOD") ~= vim.NIL
  or vim.fn.isdirectory("/run/.containerenv") ~= 0
  or vim.fn.isdirectory("/.dockerenv") ~= 0

-- Parser names that Nix pre-builds for us (mirrors the list in flake.nix).
-- nvim-treesitter will skip installation for these since they're already
-- symlinked into the runtimepath.
local nix_provided_parsers = {
  "bash",
  "c",
  "diff",
  "html",
  "javascript",
  "jsdoc",
  "json",
  "lua",
  "luadoc",
  "luap",
  "markdown",
  "markdown_inline",
  "printf",
  "python",
  "query",
  "regex",
  "toml",
  "tsx",
  "typescript",
  "vim",
  "vimdoc",
  "xml",
  "yaml",
}

-- Extra parsers you want that aren't in the Nix bundle.
-- These will be compiled from source by nvim-treesitter when needed.
local extra_ensure_installed = {}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if is_devcontainer then
        -- Remove Nix-provided parsers from ensure_installed to prevent
        -- nvim-treesitter from trying to compile them.
        local nix_set = {}
        for _, p in ipairs(nix_provided_parsers) do
          nix_set[p] = true
        end

        local filtered = {}
        for _, p in ipairs(opts.ensure_installed) do
          if not nix_set[p] then
            table.insert(filtered, p)
          end
        end

        -- Add any extras that aren't in the Nix bundle
        for _, p in ipairs(extra_ensure_installed) do
          if not nix_set[p] then
            table.insert(filtered, p)
          end
        end

        opts.ensure_installed = filtered
      end
      -- Outside a container, the default ensure_installed list works as-is.
    end,
  },
}
