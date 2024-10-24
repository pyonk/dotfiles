local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	{ "wbthomason/packer.nvim" },
	{ "neovim/nvim-lspconfig" },
	{
		"williamboman/mason.nvim",
		dependencies = { "williamboman/mason-lspconfig.nvim" },
		config = function()
			require("config.mason")
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/vim-vsnip",
		},
		config = function()
			require("config.nvim_cmp")
		end,
	},
	{
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = function()
			require("config.lspsaga")
		end,
	},
	{
		"SmiteshP/nvim-navic",
		dependencies = "neovim/nvim-lspconfig",
	},
	{
		dependencies = {
			"kyazdani42/nvim-web-devicons",
		},
		"folke/trouble.nvim",
		config = function()
			require("config.trouble")
		end,
	},
	{
		"folke/lsp-colors.nvim",
		config = function()
			require("config.lsp_colors")
		end,
	},
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("config.nvim-lint")
		end,
	},
	{
		"folke/tokyonight.nvim",
		config = function()
			require("config.tokyonight")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
			"windwp/nvim-ts-autotag",
			"nvim-treesitter/playground",
		},
		config = function()
			require("config.tree_sitter")
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"telescope-fzf-native.nvim",
			{
				name = "telescope-hugo.nvim",
				dev = true,
				dir = "/Users/pyonk/dev/pyonk/telescope-hugo.nvim/",
			},
			"delphinus/telescope-memo.nvim",
		},
		config = function()
			require("config.telescope")
		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"smoka7/hop.nvim",
		config = function()
			require("config.hop")
		end,
	},
	{
		"j-hui/fidget.nvim",
		config = function()
			require("config.fidget")
		end,
	},
	{
		"petertriho/nvim-scrollbar",
		dependencies = { "nvim-hlslens" },
		config = function()
			require("config.scrollbar")
		end,
	},
	{
		"kevinhwang91/nvim-hlslens",
		config = function()
			require("config.hlslens")
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"kyazdani42/nvim-web-devicons",
			opt = true,
		},
		config = function()
			require("config.lualine")
		end,
	},
	{
		"klen/nvim-test",
		config = function()
			require("config.nvim_test")
		end,
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	-- non lua plugins
	{ "editorconfig/editorconfig-vim" },
	{ "tpope/vim-commentary" },
	{
		"lambdalisue/gina.vim",
		config = function()
			require("config.gina")
		end,
	},
	{
		"lambdalisue/fern.vim",
		dependencies = {
			"lambdalisue/fern-git-status.vim",
			"lambdalisue/fern-renderer-nerdfont.vim",
			"lambdalisue/nerdfont.vim",
		},
		config = function()
			require("config.fern")
		end,
	},
	{
		{
			"vim-denops/denops.vim",
		},
		{
			"lambdalisue/guise.vim",
			dependencies = { "vim-denops/denops.vim" },
		},
		{
			"lambdalisue/gin.vim",
			dependencies = { "vim-denops/denops.vim" },
			config = function()
				require("config.gin")
			end,
		},
	},
	{ "machakann/vim-sandwich" },
	{
		"simeji/winresizer",
		config = function()
			require("config.winresizer")
		end,
		opt = true,
		keys = { "n", "<C-e>" },
	},
	{ "fatih/vim-go" },
	{
		"stevearc/conform.nvim",
		config = function()
			require("config.conform")
		end,
		opts = {},
	},
})
