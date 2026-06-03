------------------------------------------------------------------------------
-- File:    ~/.config/nvim/lua/functions.lua (archlinu @ 'silent')
-- Date:    Mon 01 Jun 2026 19:30
-- Update:  Mon 01 Jun 2026 21:14
-- Owner:   fvb - freekvb@gmail.com - https://freekvb.github.io/fvb/
-------------------------------------------------------------------------------


-- functions

-- clear command line
vim.api.nvim_create_autocmd("CmdlineLeave", {
    callback = function()
        vim.fn.timer_start(500, function()
            print(" ")
        end)
    end
})

-- stop automatic commentings
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.opt.formatoptions:remove({ "c", "r", "o" })
    end,
    group = general,
    desc = "Disable automatic comment continuation",
})

-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.hl.hl_op()
    end,
})

-- return to last edit position at opening file
vim.api.nvim_create_autocmd('BufReadPost', {
    callback = function(args)
        local valid_line = vim.fn.line([['"]]) >= 1 and vim.fn.line([['"]]) < vim.fn.line('$')
        local not_commit = vim.b[args.buf].filetype ~= 'commit'
        if valid_line and not_commit then
            vim.cmd([[normal! g`"]])
        end
    end,
})

-- automatically leave insert mode
vim.cmd(
    [[
    au CursorHoldI * stopinsert
    ]]
)
-- set 5 seconds for insert mode
vim.cmd(
    [[
    au InsertEnter * let updaterestore=&updatetime | set updatetime=5000
    au InsertLeave * let &updatetime=updaterestore
    ]]
)

-- netrw keymap function
vim.cmd(
    [[
	function! NetrwMapping()
       	nmap <buffer> <c-l> <c-w>l
  		nmap <buffer> h u
  		nmap <buffer> l <cr>
        nmap <buffer> <space> mf
        nmap <buffer> <Leader><space> mu
        nmap <buffer> nf %:w<CR>:buffer #<CR>
        nmap <buffer> nd d
        nmap <buffer> cw R
        nmap <buffer> pc mtmc
        nmap <buffer> pm mtmm
        nmap <buffer> ! mx
	endfunction
	augroup netrw_mapping
  		autocmd!
  		autocmd filetype netrw call NetrwMapping()
	augroup END
	]]
)

-- close hidden buffer
vim.cmd(
    [[
    autocmd FileType netrw setl bufhidden=delete
    ]]
)

-- close netrw if it's the only buffer open
vim.cmd(
    [[
    autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), '&filetype') == 'netrw' || &buftype == 'quickfix' |q|endif
    ]]
)

