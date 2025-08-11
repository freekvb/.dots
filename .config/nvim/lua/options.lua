-------------------------------------------------------------------------------
-- File:    ~/.config/nvim/lua/options.lua (archlinux @ 'silent')
-- Date:    Fri 01 Aug 2025 21:30
-- Update:  Sun 10 Aug 2025 23:44
-- Owner:   fvb - freekvb@gmail.com - https://freekvb.github.io/fvb/
-------------------------------------------------------------------------------

---- options ----

vim.o.clipboard = "unnamed,unnamedplus"

vim.o.number = true
vim.o.relativenumber = true
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.o.swapfile = false
vim.o.undofile = true
vim.o.scrolloff = 15
vim.o.virtualedit = "all"
vim.opt.fillchars = {eob = " "}

-- split windows right/below
vim.o.splitright = true
vim.o.splitbelow = true

-- start terminal in insert mode
vim.cmd(
    [[
    autocmd TermOpen * startinsert
    ]]
)

-- search case insensitive
vim.o.ignorecase = true
-- enable smart case search
vim.o.smartcase = true

-- quickfix grep <string> [<leader>fg]
vim.cmd(
    [[
    command! -nargs=+ Grep execute 'silent grep! <args>' | copen
    ]]
)

-- fuzzy file finding
vim.opt.path:append("**")
-- wildmenu
vim.o.wildmenu = true
-- auto complete like shell
vim.o.wildmode = "longest:full,full"
-- case insensitive
vim.o.wildignorecase = true
-- dash is part of word
vim.opt.iskeyword:append("-")

-- completion
vim.opt.complete:append("kspell")
vim.opt.completeopt = "menuone,noselect,longest,fuzzy"
vim.o.pumheight = 10

-- folding (curly brackets)
vim.o.foldmethod = "marker"

-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", { group = augroup,
        callback = function()
        vim.highlight.on_yank()
    end,
    }
)

-- remove trailing white space
vim.cmd(
    [[
    autocmd BufWritePre * %s/\s\+$//e
    ]]
)

-- return to last edit position at opening file
vim.cmd(
    [[
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    ]]
)

-- cursorline
vim.o.cursorline = true
-- cursorcolumn
vim.o.cursorcolumn = true

-- cursorline disabled in insert mode
vim.cmd(
    [[
    autocmd VimEnter * highlight CursorLine gui=bold,italic guibg=grey3 guifg=NONE
    autocmd InsertEnter * highlight CursorLine guibg=0 guifg=NONE
    autocmd InsertLeave * highlight CursorLine gui=bold,italic guibg=grey3 guifg=NONE
    ]]
)

-- cursorcolumn disabled in insert mode
vim.cmd(
    [[
    autocmd VimEnter * highlight CursorColumn guibg=grey3 guifg=NONE
    autocmd InsertEnter * highlight CursorColumn guibg=0 guifg=NONE
    autocmd InsertLeave * highlight CursorColumn guibg=grey3 guifg=NONE
    ]]
)

-- instant markdown
vim.g["instant_markdown_autostart"] = 0
vim.g["instant_markdown_browser"] = "qutebrowser --target window"

-- providers
vim.g["python3_host_prog"] = "/usr/bin/python3"
vim.g["loaded_perl_provider"] = 0
vim.g["loaded_node_provider"] = 0
vim.g["loaded_ruby_provider"] = 0

-- command line
vim.o.showmode = false
vim.o.showcmd = false
vim.o.cmdheight = 1
vim.opt.shortmess:append("aAcsSW")
vim.o.inccommand = ""

