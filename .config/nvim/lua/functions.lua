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

-- netrw keymap function
vim.api.nvim_create_autocmd('filetype', {
    pattern = 'netrw',
    desc = 'Better mappings for netrw',
    callback = function()
        local bind = function(lhs, rhs)
            vim.keymap.set('n', lhs, rhs, {remap = true, buffer = true})
        end
        bind('<c-l>', '<c-w>l')
        bind('h', 'u')
        bind('l', '<cr>')
        bind('<space>', 'mf')
        bind('<leader><space>', 'mu')
        bind('nf', '%:w<cr>:buffer #<cr>')
        bind('nd', 'd')
        bind('cw', 'R')
        bind('pc', 'mtmc')
        bind('pm', 'mtmm')
        bind('!', 'mx')
    end
})

-- close hidden buffer
vim.api.nvim_create_autocmd({ 'FileType' }, {
    pattern = 'netrw',
    command = 'set bufhidden=delete'
})

-- close netrw if it's the only buffer open
vim.api.nvim_create_autocmd({ 'WinEnter' }, {
    pattern = '*',
    command = "if winnr('$') == 1 && getbufvar(winbufnr(winnr()), '&filetype') == 'netrw' || &buftype == 'quickfix' |q|endif"
})

-- no dubble netrw buffers
vim.g.NetrwIsOpen = 0
local function toggle_netrw()
    if vim.g.NetrwIsOpen then
        -- Iterate over all current buffers
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
            if vim.api.nvim_buf_get_option(buf, 'filetype') == 'netrw' then
                -- Forcefully wipe the netrw buffer
                vim.api.nvim_buf_delete(buf, { force = true })
            end
        end
        vim.g.NetrwIsOpen = 0
    else
        vim.g.NetrwIsOpen = 1
        vim.cmd('Lexplore')
    end
end

