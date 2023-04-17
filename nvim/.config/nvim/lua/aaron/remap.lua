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
-- * `K`: Displays hover information about the symbol under the cursor in a floating window. `vim.lsp.buf.hover().`
-- * `gd`: Jumps to the definition of the symbol under the cursor. `vim.lsp.buf.definition().`
-- * `gD`: Jumps to the declaration of the symbol under the cursor. Some servers don't implement this feature. `vim.lsp.buf.declaration().`
-- * `gi`: Lists all the implementations for the symbol under the cursor in the quickfix window. `vim.lsp.buf.implementation().`
-- * `go`: Jumps to the definition of the type of the symbol under the cursor. `vim.lsp.buf.type_definition().`
-- * `gr`: Lists all the references to the symbol under the cursor in the quickfix window. `vim.lsp.buf.references().`
-- * `gs`: Displays signature information about the symbol under the cursor in a floating window. `vim.lsp.buf.signature_help(). If a mapping already exists for this key this function is not bound.`
-- * `<F2>`: Renames all references to the symbol under the cursor. `vim.lsp.buf.rename().`
-- * `<F3>`: Format code in current buffer. `vim.lsp.buf.format().`
-- * `<F4>`: Selects a code action available at the current cursor position. `vim.lsp.buf.code_action().`
-- * `gl`: Show diagnostics in a floating window. `vim.diagnostic.open_float().`
-- * `d`: Move to the previous diagnostic in the current buffer. `vim.diagnostic.goto_prev().`
-- * `d`: Move to the next diagnostic. `vim.diagnostic.goto_next().`


-- Completion
-- * `<Ctrl-y>`: Confirms selection.
-- * `<Ctrl-e>`: Cancel completion.
-- * `<Down>`: Navigate to the next item on the list.
-- * `<Up>`: Navigate to previous item on the list.
-- * `<Ctrl-n>`: If the completion menu is visible, go to the next item. Else, trigger completion menu.
-- * `<Ctrl-p>`: If the completion menu is visible, go to the previous item. Else, trigger completion menu.
-- * `<Ctrl-d>`: Scroll down the documentation window.
-- * `<Ctrl-u>`: Scroll up the documentation window.

