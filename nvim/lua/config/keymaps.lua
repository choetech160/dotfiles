-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always
-- set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.g.mapleader = " " -- leader key allow to configure keybinds, shortcuts etc, the default leader key is \
local keymap = vim.keymap
-- general keymaps
keymap.set("i", "jk", "<ESC>") -- in INSERT mode, hitting jk has the same effect as ESC
keymap.set("n", "<leader>nh", ":nohl<CR>") -- in normal mode, hitting leader (space)+nh will clear search hilighting
keymap.set("n", "x", '"_x') -- in NORMAL mode when pressing x, delete the character but won't copy into a register

keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>") -- increase or decrease number by hitting space-- or space-+, can do 5" "+ to increase by 5

keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- nvim tree
-- keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- Noice
keymap.set("n", "<leader>nd", "<cmd>Noice dismiss<cr>") -- dismiss all Noice messages

-- gitsigns
keymap.set("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>")
