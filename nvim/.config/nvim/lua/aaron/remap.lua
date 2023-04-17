local telescope = require('telescope.builtin')

vim.g.mapleader = " "

-- standard vim features
vim.keymap.set("n", "<leader>c", ':bd<CR>', {noremap = true})
vim.keymap.set("n", "<leader>w", ':w<CR>', {noremap = true})
vim.keymap.set("n", "<leader>q", ':q<CR>', {noremap = true})
vim.keymap.set("n", "<leader>Q", ':q!<CR>', {noremap = true})
vim.keymap.set("n", "<leader><Tab>", '<C-^>', {noremap = true})

vim.keymap.set("n", "<C-J>", "<C-W><C-J>", {noremap = true})
vim.keymap.set("n", "<C-K>", "<C-W><C-K>", {noremap = true})
vim.keymap.set("n", "<C-L>", "<C-W><C-L>", {noremap = true})
vim.keymap.set("n", "<C-H>", "<C-W><C-H>", {noremap = true})

vim.keymap.set("n", "<leader>sc", ":noh<CR>", {noremap = true})

-- netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Explore, {noremap = true})

-- Telescope
vim.keymap.set('n', '<leader>ff', telescope.find_files,{noremap = true})
vim.keymap.set('n', '<leader>fg', telescope.live_grep,{noremap = true})
vim.keymap.set('n', '<leader>fb', telescope.buffers,{noremap = true})
vim.keymap.set('n', '<leader>fh', telescope.help_tags,{noremap = true})

vim.keymap.set('n', '<C-p>', telescope.git_files, {})

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
