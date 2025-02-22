-- center screen when jumping up/down a page
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Lets me hop around windows easier
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Use which-key for fancyness
local wk = require("which-key")

wk.add({
	-- general
	{ "<leader>ns", ":source %<CR>", desc = "[n]eovim [s]ource" },
	{ "<leader>E", ":Ex<CR>", desc = "[E]xplore dir (:Ex)" },
	{ "<leader>W", ":w<CR>", desc = "[W]rite buffer (:w)" },
	{ "<leader>Q", ":q<CR>", desc = "[Q]uit (:q)" },

	-- buffers
	{
		"<leader>b",
		group = "[b]uffer",
		expand = function()
			return require("which-key.extras").expand.buf()
		end,
	},
	{ "<leader>bd", ":bd<CR>", desc = "[B]uffer [d]elete (:bd)" },

	-- Diagnostic keymaps
	{ "[d", vim.diagnostic.goto_prev, desc = "Go to previous [D]iagnostic message" },
	{ "]d", vim.diagnostic.goto_next, desc = "Go to next [D]iagnostic message" },

	-- Git
	{ "<leader>g", group = "[g]it" },
	{ "<leader>gs", vim.cmd.Git, desc = "[G]it [s]tatus" },
	{ "<leader>gg", vim.cmd.Gwrite, desc = "[G]it [g]ood (:w and :Git add)" },
	{ "<leader>gA", ":Git commit -a<CR>", desc = "[G]it commit --[a]ll" },
	{ "<leader>gc", ":Git commit<CR>", desc = "[G]it [c]ommit" },
	{ "<leader>gkm", ":Git checkout main<CR>", desc = "[G]it chec[k]out [m]ain" },
	{ "<leader>gkr", ":Git checkout ", desc = "[G]it chec[k]out [r]ef" },
	{ "<leader>gh", ":Git push<CR>", desc = "[G]it pus[h]" },
	{ "<leader>gl", ":Git pull<CR>", desc = "[G]it pul[l]" },
	{ "<leader>gb", ":Git blame<CR>", desc = "[G]it [b]lame" },
	{ "<leader>go", ":Git log<CR>", desc = "[G]it l[o]g" },
	{ "<leader>gV", ":Gvdiffsplit<CR>", desc = "[G]it diff vsplit" },
	{ "<leader>gO", ":GBrowse<CR>", desc = "[G]it br[O]wse" },
})
