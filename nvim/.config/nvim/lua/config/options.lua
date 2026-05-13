-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

-- disable clipboard sync
opt.clipboard = ""

-- Snacks animations
-- Set to `false` to globally disable all snacks animations
vim.g.snacks_animate = false

vim.g.lazyvim_cmp = "blink.cmp"
