local telescope = require('telescope.builtin')

vim.g.mapleader = " "

-- standard vim features
vim.keymap.set("n", "<leader>c", ':bd<CR>')
vim.keymap.set("n", "<leader>w", ':w<CR>')
vim.keymap.set("n", "<leader>W", ':wq<CR>')
vim.keymap.set("n", "<leader>q", ':q<CR>')
vim.keymap.set("n", "<leader>Q", ':q!<CR>')
vim.keymap.set("n", "<leader><Tab>", '<C-^>')

vim.keymap.set("n", "<C-J>", "<C-W><C-J>")
vim.keymap.set("n", "<C-K>", "<C-W><C-K>")
vim.keymap.set("n", "<C-L>", "<C-W><C-L>")
vim.keymap.set("n", "<C-H>", "<C-W><C-H>")

vim.keymap.set("n", "<leader>sc", ":noh<CR>")

-- netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Explore)

-- Telescope
vim.keymap.set('n', '<leader>pf', telescope.find_files)
vim.keymap.set('n', '<leader>pg', telescope.live_grep)
vim.keymap.set('n', '<leader>pb', telescope.buffers)
vim.keymap.set('n', '<leader>ph', telescope.help_tags)
vim.keymap.set('n', '<leader>pt', telescope.tags)

vim.keymap.set('n', '<C-p>', telescope.git_files)

-- Fugitive/Git/GitHub
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>ga", vim.cmd.Gwrite)
vim.keymap.set("n", "<leader>gC", ':Git commit<CR>')
vim.keymap.set("n", "<leader>gh", ':Git push<CR>')
vim.keymap.set("n", "<leader>gl", ':Git pull<CR>')
vim.keymap.set("n", "<leader>gb", ':Git blame<CR>')
vim.keymap.set("n", "<leader>go", ':Git log<CR>')
vim.keymap.set("n", "<leader>gV", ':Gvdiffsplit<CR>')
vim.keymap.set("n", "<leader>gO", ':GBrowse<CR>')

-- undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- LSP
--
-- local opts = { buffer = ev.buf }
--     vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
--     vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
--     vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
--     vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
--     vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
--     vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
--     vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
--     vim.keymap.set('n', '<space>wl', function()
--       print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--     end, opts)
--     vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
--     vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
--     vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
--     vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
--     vim.keymap.set('n', '<space>f', function()
--       vim.lsp.buf.format { async = true }
--     end, opts)
