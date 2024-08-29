-- Set file tree settings
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_preview = 1
-- Configure Netrw buffer: make it non-editable, show line numbers, no wrapping, and set it to read-only
vim.g.netrw_bufsettings = "noma nomod nu rnu nobl nowrap ro"

local opt = vim.opt

-- Set relative line numbers
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4

-- Tabs & indentations
opt.tabstop = 2 -- 2 spaces for tabs
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- Expand tab to spaces
opt.autoindent = true -- Copy indent from current line when starting new one

opt.wrap = true

-- Search settings
opt.ignorecase = true -- Ignore case when searching
opt.smartcase = true -- Assumes you want case-sensitive search when including mixed case in search query

-- Highlight current line
opt.cursorline = true

-- Turn on termguicolors for colorschemes to work
opt.termguicolors = true
opt.signcolumn = "yes" -- Show sign column so that text doesn't shift

-- Allow backspace on indent, end of line or insert mode start position
opt.backspace = "indent,eol,start"

-- Use system clipboard as default register(to copy outside of vim)
opt.clipboard:append("unnamedplus")

-- Split windows
opt.splitright = true -- Split vertical window to the right
opt.splitbelow = true -- Split horizontal window to the bottom

-- Define a custom command to reload init.lua
vim.cmd([[command! ReloadLuaConfig source ~/.config/nvim/init.lua]])
