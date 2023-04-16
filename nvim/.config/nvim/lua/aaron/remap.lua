vim.g.mapleader = " "

-- standard vim features
vim.keymap.set("n", "<leader>w", ':w<CR>', {noremap = true})
vim.keymap.set("n", "<leader>q", ':q<CR>', {noremap = true})
vim.keymap.set("n", "<leader>Q", ':q!<CR>', {noremap = true})
vim.keymap.set('n', '<leader>ev', ':vsplit $MYVIMRC<CR>', {noremap = true})
vim.keymap.set('n', '<leader>sv', ':w<CR>:so %<CR>', {noremap = true})

vim.keymap.set('n', '<leader>sc', ':noh<CR>', {noremap = true})

-- netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Explore)

-- Fugitive/Git/GitHub
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>ga", vim.cmd.Gwrite)
vim.keymap.set("n", "<leader>gh", ':Git push<CR>')
vim.keymap.set("n", "<leader>gl", ':Git pull<CR>')
vim.keymap.set("n", "<leader>gb", ':Git blame<CR>')
vim.keymap.set("n", "<leader>gV", ':Gvdiffsplit<CR>')

-- undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
