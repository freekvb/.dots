------------------------------------------------------------------------------
-- File:    ~/.config/nvim/lua/options.lua (archlinu @ 'silent')
-- Date:    Mon 01 Jun 2026 19:40
-- Update:  Mon 01 Jun 2026 21:16
-- Owner:   fvb - freekvb@gmail.com - https://freekvb.github.io/fvb/
-------------------------------------------------------------------------------


-- options

vim.o.clipboard = "unnamed,unnamedplus"

vim.o.number = true
vim.o.relativenumber = true

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.cursorline = true
vim.o.showmode = false
vim.o.scrolloff = 15
vim.o.virtualedit = "all"
vim.opt.fillchars = { eob = " " }
vim.o.foldmethod = "marker"
vim.o.winborder = "single"

vim.o.undofile = true
vim.opt.undodir = vim.fn.stdpath('cache') .. '/undo'

vim.o.splitright = true
vim.o.splitbelow = true

-- completion
vim.opt.complete:append("kspell")
vim.opt.completeopt = "menuone,noselect,longest,fuzzy"
vim.o.pumheight = 10

-- netrw
vim.g.netrw_keepdir = 0
vim.g.netrw_winsize = -62
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 4

-- instant markdown
vim.g["instant_markdown_autostart"] = 0
vim.g["instant_markdown_browser"] = "qutebrowser --target window"

