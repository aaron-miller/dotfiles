return {
	{ -- Git
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "[G]it [s]tatus" })
			vim.keymap.set("n", "<leader>gg", vim.cmd.Gwrite, { desc = "[G]it [g]ood (:w and :Git add)" })
			vim.keymap.set("n", "<leader>gA", ":Git commit -a<CR>", { desc = "[G]it commit --[a]ll" })
			vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", { desc = "[G]it [c]ommit" })
			vim.keymap.set("n", "<leader>gkm", ":Git checkout main<CR>", { desc = "[G]it chec[k]out [m]ain" })
			vim.keymap.set("n", "<leader>gkr", ":Git checkout ", { desc = "[G]it chec[k]out [r]ef" })
			vim.keymap.set("n", "<leader>gh", ":Git push<CR>", { desc = "[G]it pus[h]" })
			vim.keymap.set("n", "<leader>gl", ":Git pull<CR>", { desc = "[G]it pul[l]" })
			vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", { desc = "[G]it [b]lame" })
			vim.keymap.set("n", "<leader>go", ":Git log<CR>", { desc = "[G]it l[o]g" })
			vim.keymap.set("n", "<leader>gV", ":Gvdiffsplit<CR>", { desc = "[G]it diff vsplit" })
			vim.keymap.set("n", "<leader>gO", ":GBrowse<CR>", { desc = "[G]it br[O]wse" })
		end,
	},
	"tpope/vim-rhubarb", -- GitHub
	"tpope/vim-speeddating", -- Increase/decrease dates
	"tpope/vim-sleuth", -- Figure out file indent settings
	"tpope/vim-obsession", -- session management manager
	"tpope/vim-repeat", -- super power .
	"tpope/vim-surround", -- change surrounding chars like parens and quotes
	"tpope/vim-commentary", -- comment out a line with gc
}
-- vim: ts=2 sts=2 sw=2 et
