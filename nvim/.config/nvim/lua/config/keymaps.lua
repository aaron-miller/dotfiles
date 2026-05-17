-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- center screen when jumping up/down a page
-- vim.keymap.set("n", "<C-f>", "<C-f>zz")
-- vim.keymap.set("n", "<C-b>", "<C-b>zz")
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Use which-key for fancyness
local wk = require("which-key")

wk.add({

  -- general
  -- { "<leader>E", ":Ex<CR>", desc = "[E]xplore dir (:Ex)" },
  -- { "<leader>W", ":w<CR>", desc = "[W]rite buffer (:w)" },
  -- { "<leader>Q", ":q<CR>", desc = "[Q]uit (:q)" },

  -- neovim
  -- { "<leader>n", group = "[n]eovim" },
  -- { "<leader>ns", ":source %<CR>", desc = "[n]eovim [s]ource" },
  -- { "<leader>nl", ":Lazy<CR>", desc = "[n]eovim [l]azy" },
  -- { "<leader>nm", ":Mason<CR>", desc = "[n]eovim [m]ason" },

  -- buffers
  -- {
  --   "<leader>b",
  --   group = "[b]uffer",
  --   expand = function()
  --     return require("which-key.extras").expand.buf()
  --   end,
  -- },
  -- { "<leader>bd", ":bd<CR>", desc = "[B]uffer [d]elete (:bd)" },
  -- {
  --   "<leader>bf",
  --   function()
  --     require("conform").format({ async = true, lsp_fallback = true })
  --   end,
  --   desc = "[b]uffer [f]ormat",
  -- },

  -- Diagnostic keymaps
  -- {
  --   "[d",
  --   function()
  --     vim.diagnostic.jump({ count = -1, float = true })
  --   end,
  --   desc = "Go to previous [D]iagnostic message",
  -- },
  -- {
  --   "]d",
  --   function()
  --     vim.diagnostic.jump({ count = 1, float = true })
  --   end,
  --   desc = "Go to next [D]iagnostic message",
  -- },

  -- Git
  -- { "<leader>g", group = "[g]it" },
  -- { "<leader>gs", vim.cmd.Git, desc = "[G]it [s]tatus" },
  -- { "<leader>gg", vim.cmd.Gwrite, desc = "[G]it [g]ood (:w and :Git add)" },
  -- { "<leader>gA", ":Git commit -a<CR>", desc = "[G]it commit --[a]ll" },
  -- { "<leader>gc", ":Git commit<CR>", desc = "[G]it [c]ommit" },
  -- { "<leader>gkm", ":Git checkout main<CR>", desc = "[G]it chec[k]out [m]ain" },
  -- { "<leader>gkr", ":Git checkout ", desc = "[G]it chec[k]out [r]ef" },
  -- { "<leader>gh", ":Git push<CR>", desc = "[G]it pus[h]" },
  -- { "<leader>gl", ":Git pull<CR>", desc = "[G]it pul[l]" },
  -- { "<leader>gb", ":Git blame<CR>", desc = "[G]it [b]lame" },
  -- { "<leader>go", ":Git log<CR>", desc = "[G]it l[o]g" },
  -- { "<leader>gV", ":Gvdiffsplit<CR>", desc = "[G]it diff vsplit" },
  -- { "<leader>gO", ":GBrowse<CR>", desc = "[G]it br[O]wse" },
})
