vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Colorschemes
    use 'folke/tokyonight.nvim'

    -- tpope
    use 'tpope/vim-fugitive' -- Git
    use 'tpope/vim-rhubarb' -- GitHub
    use 'tpope/vim-speeddating' -- Increase/decrease dates
    use 'tpope/vim-sleuth' -- Figure out file indent settings
    use 'tpope/vim-obsession' -- session management manager
    use 'tpope/vim-repeat' -- super power .
    use 'tpope/vim-surround' -- change surrounding chars like parens and quotes
    use 'tpope/vim-commentary' -- comment out a line with gc

    -- other vimscript plugins
    use 'mbbill/undotree'

    -- Lua plugins
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = {{'nvim-lua/plenary.nvim'}}
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({
                with_sync = true
            })
            ts_update()
        end
    }

    -- LSP config
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'}, -- Required
            { -- Optional
                'williamboman/mason.nvim',
                run = function() pcall(vim.cmd, 'MasonUpdate') end
            }, {'williamboman/mason-lspconfig.nvim'}, -- Optional
            -- Autocompletion
            {'hrsh7th/nvim-cmp'}, -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'} -- Required
        },

        use {
            'nvim-lualine/lualine.nvim',
            requires = {'nvim-tree/nvim-web-devicons', opt = true}
        }

    }

    -- Snippets
    use "rafamadriz/friendly-snippets"

	use({
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		tag = "v<CurrentMajor>.*",
		-- install jsregexp (optional!:).
		run = "make install_jsregexp"
	})

end)

