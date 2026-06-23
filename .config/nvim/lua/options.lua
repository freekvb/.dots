------------------------------------------------------------------------------
-- File:    ~/.config/nvim/lua/options.lua (archlinu @ 'silent')
-- Date:    Mon 01 Jun 2026 19:40
-- Update:  Sat 06 Jun 2026 08:52
-- Owner:   fvb - freekvb@gmail.com - https://freekvb.github.io/fvb/
-------------------------------------------------------------------------------


-- options

vim.o.clipboard = "unnamedplus"

vim.o.number = true
vim.o.relativenumber = true

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.linebreak = true
vim.o.breakindent = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.cursorline = true
vim.o.scrolloff = 15
vim.o.virtualedit = "all"
vim.opt.fillchars = { eob = " " }
vim.o.foldmethod = "marker"
vim.o.showmode = false

vim.o.swapfile = false
vim.o.undofile = true

vim.o.splitright = true
vim.o.splitbelow = true

-- completion
vim.opt.completeopt = "menuone,noselect,longest,fuzzy"
vim.o.pumheight = 5
vim.o.pumborder = "single"

-- instant markdown
vim.g["instant_markdown_autostart"] = 0
vim.g["instant_markdown_browser"] = "qutebrowser --target window"

