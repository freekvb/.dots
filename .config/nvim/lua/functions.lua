------------------------------------------------------------------------------
-- File:    ~/.config/nvim/lua/functions.lua (archlinu @ 'silent')
-- Date:    Mon 01 Jun 2026 19:30
-- Update:  Thu 04 Jun 2026 08:08
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
        vim.hl.hl_op({higroup = 'Visual', timeout = 200})
    end,
})

-- start terminal in insert mode
vim.api.nvim_create_autocmd({ 'TermOpen' }, {
    pattern = '*',
    command = 'startinsert'
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
vim.api.nvim_create_autocmd({ 'CursorHoldI' }, {
    pattern = '*',
    command = 'stopinsert',
})
-- set 5 seconds for insert mode
vim.api.nvim_create_autocmd({ 'InsertEnter' }, {
    pattern = '*',
    command = 'let updaterestore=&updatetime | set updatetime=5000'
})
vim.api.nvim_create_autocmd({ 'InsertLeave' }, {
    pattern = '*',
    command = 'let &updatetime=updaterestore'
})

-- close hidden buffer
vim.api.nvim_create_autocmd({ 'FileType' }, {
    pattern = 'netrw',
    command = 'set bufhidden=delete'
})

