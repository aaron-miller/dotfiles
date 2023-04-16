vim.g.mapleader = " "

-- standard vim features
vim.keymap.set("n", "<leader>w", ':w<CR>', {noremap = true})
vim.keymap.set("n", "<leader>q", ':q<CR>', {noremap = true})
vim.keymap.set("n", "<leader>Q", ':q!<CR>', {noremap = true})
vim.keymap.set('n', '<leader>ev', ':vsplit $MYVIMRC<CR>', {noremap = true})
vim.keymap.set('n', '<leader>sv', ':w<CR>:so %<CR>:q<CR>', {noremap = true})

-- netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Explore)

-- Fugitive/Git/GitHub
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>ga", vim.cmd.Gwrite)
vim.keymap.set("n", "<leader>gh", ':Git push<CR>')

-- undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
