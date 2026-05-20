-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

-- disable clipboard sync
opt.clipboard = vim.env.SSH_CONNECTION and "" or "" -- Sync with system clipboard

-- Snacks animations
-- Set to `false` to globally disable all snacks animations
vim.g.snacks_animate = false

-- Show all markdown characters (backticks, etc.)
opt.conceallevel = 0
