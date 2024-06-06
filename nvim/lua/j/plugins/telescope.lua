-- local telescope_setup, telescope = pcall(require, "telescope")
-- if not telescope_setup then
-- 	return
-- end
--
-- local actions_setup, actions = pcall(require, "telescope.actions")
-- if not actions_setup then
-- 	return
-- end
--
-- telescope.setup({
-- 	defaults = {
-- 		mappings = {
-- 			i = {
-- 				["<C-k>"] = actions.move_selection_previous,
-- 				["<C-j>"] = actions.move_selection_next,
-- 				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
-- 			},
-- 		},
-- 	},
-- })
--
-- telescope.load_extension("fzf")
return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	tag = "0.1.3", -- tags nneed to be checked for some errors, sometimes telescope is unusable https://www.reddit.com/r/neovim/comments/1791a7x/all_of_a_sudden_i_cant_use_telescope/
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "truncate " },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
		})

		telescope.load_extension("fzf")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
	end,
}
