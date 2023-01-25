local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end
vim.cmd([[packadd packer.nvim]])
return require("packer").startup(function()

	use "wbthomason/packer.nvim"

	-- STARTUP
	use 'goolord/alpha-nvim'
	use 'Shatur/neovim-session-manager'
	use 'lewis6991/impatient.nvim'

	-- THEMES
	use({
		"catppuccin/nvim",
		as = "catppuccin",
	})
	use 'bluz71/vim-nightfly-guicolors'
	use 'olimorris/onedarkpro.nvim'
	use 'EdenEast/nightfox.nvim'
	use 'folke/tokyonight.nvim'
	use 'rebelot/kanagawa.nvim'
	use  'ellisonleao/gruvbox.nvim'
	use 'sainnhe/everforest'

	-- SYNTAX HIGHLIGHTING
	use('nvim-treesitter/nvim-treesitter', {run = ":TSUpdate"})
	use 'nvim-treesitter/playground'

	-- FILE EXPLORERATION
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons",
		},
		tag = "nightly",
	})
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- BUFFERS & TABS
	use 'nanozuki/tabby.nvim'

	-- STATUSLINE
	use({
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	})
	use "j-hui/fidget.nvim"

	-- TERMINAL
	use { -- I just love this plugin
		"akinsho/toggleterm.nvim",
		tag = '*',
	}

	-- COMPLETION
	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
		{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},

			-- Snippets
			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'},
		}
	}

	use 'hrsh7th/cmp-cmdline'

	use {
		'gelguy/wilder.nvim',
		config = function()
			-- config goes here
			local wilder = require('wilder')
			wilder.setup({modes = {':', '/', '?'}})
			wilder.set_option('renderer', wilder.popupmenu_renderer({
				highlighter = wilder.basic_highlighter(),
				left = {' ', wilder.popupmenu_devicons()},
				right = {' ', wilder.popupmenu_scrollbar()},
				wilder.popupmenu_palette_theme({
					-- 'single', 'double', 'rounded' or 'solid'
					-- can also be a list of 8 characters, see :h wilder#popupmenu_palette_theme() for more details
					border = 'rounded',
					max_height = '75%',      -- max height of the palette
					min_height = 0,          -- set to the same as 'max_height' for a fixed height window
					prompt_position = 'bottom', -- 'top' or 'bottom' to set the location of the prompt
					reverse = 0,             -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'
				})
			}))
		end,
	}

	-- GIT INTEGRATION
	use({
		"lewis6991/gitsigns.nvim",
	})
	use({
		"tpope/vim-fugitive",
	})
	use 'kdheepak/lazygit.nvim'

	-- SHIFTS vs TABS
	use("tpope/vim-sleuth")

	-- SURROUNDS
	use("tpope/vim-surround")
	use("alvan/vim-closetag")
	use("jiangmiao/auto-pairs")

	-- COMMENTS
	use("preservim/nerdcommenter")
	use {
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
	}

	-- FILETYPES/SYNTAX-TYPES
	use("lervag/vimtex")
	use "kkharji/sqlite.lua" -- requires $ luarocks install sqlite luv

	-- OTHER
	--use("lukas-reineke/indent-blankline.nvim") # not sure if I want to keep this
	use('mrjones2014/smart-splits.nvim')
	use 'mbbill/undotree'
	use "itchyny/vim-cursorword"

	-- THEME CREATION
	use('rktjmp/lush.nvim')

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
