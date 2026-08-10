-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- center screen when jumping up/down a page
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- general
vim.keymap.set("n", "<leader>E", ":Ex<CR>", { desc = "[E]xplore dir (:Ex)" })
vim.keymap.set("n", "<leader>W", ":w<CR>", { desc = "[W]rite (:w)" })

-- Markdown: format & wrap prose to 80 chars
vim.keymap.set("n", "<leader>mw", function()
  require("conform").format({ async = true, lsp_format = "never" })
end, { desc = "[M]arkdown [w]rap format (80 char)" })

-- Markdown: toggle inline rendering (render-markdown.nvim)
vim.keymap.set("n", "<leader>mr", function()
  require("render-markdown").toggle()
end, { desc = "[M]arkdown [r]ender toggle" })

-- Markdown: toggle centered Zen writing view (80-char column)
vim.keymap.set("n", "<leader>mz", function()
  Snacks.zen.zen({
    center = true,
    width = 80,
  })
end, { desc = "[M]arkdown [z]en (centered)" })

-- Toggle blink.cmp completion popup for the current buffer
Snacks.toggle({
  name = "Completion (Buffer)",
  get = function()
    return vim.b.completion ~= false
  end,
  set = function(state)
    vim.b.completion = state
  end,
}):map("<leader>uk")

-- Git
vim.keymap.set("n", "<leader>gg", vim.cmd.Gwrite, { desc = "[G]it [g]ood (:w and :Git add)" })
vim.keymap.set("n", "<leader>gA", ":Git commit -a<CR>", { desc = "[G]it commit --[A]ll" })
vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", { desc = "[G]it [c]ommit" })
vim.keymap.set("n", "<leader>gh", ":Git push<CR>", { desc = "[G]it pus[h]" })
vim.keymap.set("n", "<leader>gu", ":Git pull<CR>", { desc = "[G]it p[u]ll" })
