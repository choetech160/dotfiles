-- add list of plugins to install
--
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ { import = "j.plugins" }, { import = "j.plugins.lsp" } }, {
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},

	-- packer can manage itself
	--	"wbthomason/packer.nvim",

	"nvim-lua/plenary.nvim", -- lua functions that many plugins use

	--use("https://codeberg.org/oahlen/iceberg.nvim") -- preferred colorscheme
	-- "cocopon/iceberg.vim",
	--  install = {
	--    colorscheme = {'iceberg'}
	--  },
	"christoomey/vim-tmux-navigator", -- tmux & split window navigation

	"szw/vim-maximizer", -- maximizes and restores current window

	-- essential plugins
	"tpope/vim-surround", -- add, delete, change surroundings (it's awesome)
	"inkarkat/vim-ReplaceWithRegister", -- replace with register contents using motion (gr + motion)

	-- commenting with gc
	-- "numToStr/Comment.nvim",

	-- file explorer
	"nvim-tree/nvim-tree.lua",

	-- vs-code like icons
	"nvim-tree/nvim-web-devicons",

	-- statusline
	--"nvim-lualine/lualine.nvim",

	-- fuzzy finding w/ telescope
	-- {
	-- 	"nvim-telescope/telescope-fzf-native.nvim",
	-- 	run = "make",
	-- }, -- dependency for better sorting performance
	-- { "nvim-telescope/telescope.nvim", branch = "0.1.x" }, -- fuzzy finder

	-- autocompletion
	--  "hrsh7th/nvim-cmp", -- completion plugin
	-- "hrsh7th/cmp-buffer", -- source for text in buffer
	-- "hrsh7th/cmp-path", -- source for file system paths
	--
	-- -- snippets
	-- "L3MON4D3/LuaSnip", -- snippet engine
	-- "saadparwaiz1/cmp_luasnip", -- for autocompletion
	-- "rafamadriz/friendly-snippets", -- useful snippets

	-- managing & installing lsp servers, linters & formatters
	-- "williamboman/mason.nvim", -- in charge of managing lsp servers, linters & formatters
	-- "williamboman/mason-lspconfig.nvim", -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	"neovim/nvim-lspconfig", -- easily configure language servers
	"hrsh7th/cmp-nvim-lsp", -- for autocompletion
	"hrsh7th/cmp-cmdline", -- for cmd line autocompletion
	-- {
	-- 	"glepnir/lspsaga.nvim",
	-- 	branch = "main",
	-- 	dependencies = {
	-- 		{ "nvim-tree/nvim-web-devicons" },
	-- 		{ "nvim-treesitter/nvim-treesitter" },
	-- 	},
	-- }, -- enhanced lsp uis
	"jose-elias-alvarez/typescript.nvim", -- additional functionality for typescript server (e.g. rename file & update imports)
	"onsails/lspkind.nvim", -- vs-code like icons for autocompletion

	-- formatting & linting
	--"jayp0521/mason-null-ls.nvim", -- bridges gap b/w mason & null-ls

	-- treesitter configuration
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })()
		end,
	},

	-- auto closing
	"windwp/nvim-autopairs", -- autoclose parens, brackets, quotes, etc...
	{ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }, -- autoclose tags
	-- git integration
	{
		"lewis6991/gitsigns.nvim", -- show line modifications on left hand side
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"tpope/vim-fugitive",
	},
})
