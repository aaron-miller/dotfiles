return {
	"vim-test/vim-test", -- run tests inside of vim, using vimux's temp terminals
	config = function()
		vim.keymap.set("n", "<leader>tt", ":TestNearest<CR>", { desc = "[T]est" })
		vim.keymap.set("n", "<leader>tf", ":TestFile<CR>", { desc = "[T]est" })
		vim.keymap.set("n", "<leader>ta", ":TestFile<CR>", { desc = "[T]est" })
	end,
}
