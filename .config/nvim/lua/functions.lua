------------------------------------------------------------------------------
-- File:    ~/.config/nvim/lua/functions.lua (archlinu @ 'silent')
-- Date:    Mon 01 Jun 2026 19:30
-- Update:  Mon 01 Jun 2026 21:14
-- Owner:   fvb - freekvb@gmail.com - https://freekvb.github.io/fvb/
-------------------------------------------------------------------------------


-- functions

-- open help in vertical split
vim.api.nvim_create_autocmd("FileType", {
    pattern = "help",
    command = "wincmd L | vert resize 141",
})

-- clear command line
vim.api.nvim_create_autocmd("CmdlineLeave", {
    callback = function()
        vim.fn.timer_start(500, function()
            print(" ")
        end)
    end
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
	endfunction
	augroup netrw_mapping
  		autocmd!
  		autocmd filetype netrw call NetrwMapping()
	augroup END
	]]
)
