-------------------------------------------------------------------------------
-- File:    ~/.config/nvim/lua/options.lua (archlinux @ 'silent')
-- Date:    Fri 01 Aug 2025 21:30
-- Update:  Sun 31 May 2026 00:49
-- Owner:   fvb - freekvb@gmail.com - https://freekvb.github.io/fvb/
-------------------------------------------------------------------------------

---- options ----

vim.o.clipboard = "unnamed,unnamedplus"

vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.o.swapfile = false
vim.o.undofile = true
vim.opt.undodir = vim.fn.stdpath('cache') .. '/undo'
vim.o.scrolloff = 15
vim.o.virtualedit = "all"
vim.opt.fillchars = { eob = " " }

-- split windows right/below
vim.o.splitright = true
vim.o.splitbelow = true

-- open help in vertical split
vim.api.nvim_create_autocmd("FileType", {
	pattern = "help",
	command = "wincmd L | vert resize 141",
})

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

-- commandline fuzzy find
vim.o.wildmenu = true
vim.opt.wildmode = "noselect"
vim.opt.wildoptions = "pum,fuzzy"
vim.o.wildignorecase = true
vim.opt.iskeyword:append("-")
vim.api.nvim_create_autocmd("CmdlineChanged", {
    pattern = ":",
    callback = function()
        vim.fn.wildtrigger()
    end
})

-- no auto continue comments on new line
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("no_auto_comment", {}),
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})

-- completion
vim.opt.complete:append("kspell")
vim.opt.completeopt = "menuone,noselect,longest,fuzzy"
vim.o.pumheight = 10

-- folding (curly brackets)
vim.o.foldmethod = "marker"

-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.hl.hl_op()
    end,
})

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

-- cursorline disabled in insert mode
vim.cmd(
    [[
    autocmd VimEnter * highlight CursorLine gui=bold,italic guibg=grey3 guifg=NONE
    autocmd InsertEnter * highlight CursorLine guibg=0 guifg=NONE
    autocmd InsertLeave * highlight CursorLine gui=bold,italic guibg=grey3 guifg=NONE
    ]]
)

-- cursorcolumn
vim.o.cursorcolumn = true

-- cursorcolumn disabled in insert mode
vim.cmd(
    [[
    autocmd VimEnter * highlight CursorColumn guibg=grey3 guifg=NONE
    autocmd InsertEnter * highlight CursorColumn guibg=0 guifg=NONE
    autocmd InsertLeave * highlight CursorColumn guibg=grey3 guifg=NONE
    ]]
)

-- markdown highlighting
vim.cmd(
    [[
    au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
    ]]
)

-- instant markdown
vim.g["instant_markdown_autostart"] = 0
vim.g["instant_markdown_browser"] = "qutebrowser --target window"

-- providers
vim.g["loaded_python3_provider"] = 0
vim.g["loaded_perl_provider"] = 0
vim.g["loaded_node_provider"] = 0
vim.g["loaded_ruby_provider"] = 0

-- command line
vim.o.showmode = false
vim.o.showcmd = false
vim.o.cmdheight = 1
vim.opt.shortmess:append("aAcCsSTW")
vim.o.inccommand = "split"

-- clear command line
vim.api.nvim_create_autocmd("CmdlineLeave", {
    callback = function()
        vim.fn.timer_start(500, function()
            print(" ")
        end)
    end
})

-- don't trigger autocmd when executing macro
vim.cmd([[
  xnoremap @ :<C-U>execute "noautocmd '<,'>norm! " . v:count1 . "@" . getcharstr()<cr>
  nnoremap @ <cmd>execute "noautocmd norm! " . v:count1 . "@" . getcharstr()<cr>
]])

-- lsp
vim.lsp.enable({ "lua_ls" })
vim.o.winborder = "single"

-- lsp auto completion [C-space in insert to toggle]
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end
    end,
})

