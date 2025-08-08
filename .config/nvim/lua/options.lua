-------------------------------------------------------------------------------
-- File:    ~/.config/nvim/lua/options.lua (archlinux @ 'silent')
-- Date:    Fri 01 Aug 2025 21:30
-- Update:  Mon 04 Aug 2025 09:56
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
vim.o.scrolloff = 10
vim.o.virtualedit = "all"
vim.opt.fillchars = {eob = " "}

-- split buffers
vim.o.splitright = true
vim.o.splitbelow = true

-- search case insensitive
vim.o.ignorecase = true
-- enable smart case search
vim.o.smartcase = true

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
vim.opt.completeopt = "menu,menuone,noselect,popup,fuzzy"
vim.o.pumheight = 15

-- auto completion
local triggers = {'.'}
vim.api.nvim_create_autocmd('InsertCharPre', {
  buffer = vim.api.nvim_get_current_buf(),
  callback = function()
    if vim.fn.pumvisible() == 1 or vim.fn.state('m') == 'm' then
      return
    end
    local char = vim.v.char
    if vim.list_contains(triggers, char) then
      local key = vim.keycode('<C-x><C-n>')
      vim.api.nvim_feedkeys(key, 'm', false)
    end
  end
})

-- folding (curly brackets)
vim.o.foldmethod = "marker"

-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost",
    {
        group = augroup,
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

-- automatically leave insert mode
vim.cmd(
    [[
    au CursorHoldI * stopinsert
    ]]
)

-- insert mode inactive time
vim.cmd(
    [[
    au InsertEnter * let updaterestore=&updatetime | set updatetime=5000
    au InsertLeave * let &updatetime=updaterestore
    ]]
)

-- instant markdown
vim.g["instant_markdown_autostart"] = 0
vim.g["instant_markdown_browser"] = "qutebrowser --target window"

-- command line
vim.o.showmode = false
vim.o.showcmd = false
vim.o.cmdheight = 0
vim.opt.shortmess:append("acsSW")
vim.o.inccommand = ""

-- providers
vim.g["python3_host_prog"] = "/usr/bin/python3"
vim.g["loaded_perl_provider"] = 0
vim.g["loaded_node_provider"] = 0
vim.g["loaded_ruby_provider"] = 0

