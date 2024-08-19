require('config.lazy')

-- Load LSP and completion configurations
require('config.lsp')
require('config.nvim-cmp')

-- Setup keybindings
require('config.keybindings')
require('config.autocmds')

-- Set relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- set file tree settings
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_preview = 1
-- Configure Netrw buffer: make it non-editable, show line numbers, no wrapping, and set it to read-only
vim.g.netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro'

-- Define a custom command to reload init.lua
vim.cmd([[command! ReloadLuaConfig source ~/.config/nvim/init.lua]])

-- Only selects the code colorscheme
vim.cmd.colorscheme('catppuccin')
-- enable 24-bit colour
vim.opt.termguicolors = true

-- set the default notification system to use notify
vim.notify = require("notify")

-- Enable Inline diagnostics
vim.diagnostic.config({
    virtual_text = true
})
