-- local status, treesitter = pcall(require, "nvim-treesitter.configs")
-- if not status then
-- 	return
-- end
--
-- treesitter.setup({
-- 	highlight = {
-- 		enable = true,
-- 	},
-- 	indent = { enable = true },
-- 	autotag = { enable = true },
-- 	ensure_installed = {
-- 		"json",
-- 		"javascript",
-- 		"typescript",
-- 		"tsx",
-- 		"yaml",
-- 		"html",
-- 		"css",
-- 		"markdown",
-- 		"svelte",
-- 		"graphql",
-- 		"bash",
-- 		"lua",
-- 		"vim",
-- 		"dockerfile",
-- 		"gitignore",
-- 	},
-- 	auto_install = true,
-- })

return {
	"nvim-treesitter/nvim-treesitter",
	opts = {
		ensure_installed = {
			"bash",
			"html",
			"javascript",
			"json",
			"lua",
			"markdown",
			"markdown_inline",
			"python",
			"query",
			"regex",
			"tsx",
			"typescript",
			"vim",
			"yaml",
		},
    sync_install = false,
    highlight = {
      enable = true
    }
	},
}
