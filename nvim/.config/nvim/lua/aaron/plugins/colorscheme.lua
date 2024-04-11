return {
	-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
	"catppuccin/nvim",
	priority = 1000, -- Make sure to load this before all the other start plugins.
	config = function()
		require("catppuccin").setup({
			flavour = "macchiato",
			transparent_background = true,
			dim_inactive = {
				enabled = false,
			},
			integrations = {
				cmp = true,
				dap = true,
				dap_ui = true,
				gitsigns = true,
				treesitter = true,
				mason = true,
				notify = true,
				which_key = true,
				telescope = {
					enabled = true,
				},
			},
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
