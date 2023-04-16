local ts_builtin = require('telescope.builtin')

vim.g.mapleader = " "

-- standard vim features
vim.keymap.set("n", "<leader>c", ':bd<CR>', {noremap = true})
vim.keymap.set("n", "<leader>w", ':w<CR>', {noremap = true})
vim.keymap.set("n", "<leader>q", ':q<CR>', {noremap = true})
vim.keymap.set("n", "<leader>Q", ':q!<CR>', {noremap = true})

vim.keymap.set("n", "<C-J>", "<C-W><C-J>")
vim.keymap.set("n", "<C-K>", "<C-W><C-K>")
vim.keymap.set("n", "<C-L>", "<C-W><C-L>")
vim.keymap.set("n", "<C-H>", "<C-W><C-H>")

vim.keymap.set("n", "<leader>sc", ":noh<CR>", {noremap = true})

-- netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Explore)

-- Telescope
vim.keymap.set('n', '<leader>ff', ts_builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', ts_builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', ts_builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', ts_builtin.help_tags, {})

vim.keymap.set('n', '<C-p>', ts_builtin.git_files, {})

-- Fugitive/Git/GitHub
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>ga", vim.cmd.Gwrite)
vim.keymap.set("n", "<leader>gh", ':Git push<CR>')
vim.keymap.set("n", "<leader>gl", ':Git pull<CR>')
vim.keymap.set("n", "<leader>gb", ':Git blame<CR>')
vim.keymap.set("n", "<leader>gV", ':Gvdiffsplit<CR>')
vim.keymap.set("n", "<leader>gO", ':GBrowse<CR>')

-- undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
