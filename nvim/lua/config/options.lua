-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2 -- 2 space for tabing
opt.shiftwidth = 2 -- to change it, switch both here (ie to 4)
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true -- if searching smallcase, will also discover capital letter words
opt.smartcase = true -- if searching for capital cases, small cases will get ignored

-- cursor line
opt.cursorline = true

-- appearance
--opt.termguicolors = true
-- opt.background = "dark"
-- opt.signcolumn = "yes"
--
-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
-- opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

opt.backup = false
opt.writebackup = false
opt.swapfile = false
