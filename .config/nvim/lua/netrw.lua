------------------------------------------------------------------------------
-- File:    ~/.config/nvim/lua/netrw.lua (archlinu @ 'silent')
-- Date:    Thu 04 Jun 2026 16:00
-- Update:  Thu 04 Jun 2026 16:07
-- Owner:   fvb - freekvb@gmail.com - https://freekvb.github.io/fvb/
-------------------------------------------------------------------------------


-- netrw

-- settings
vim.g.netrw_keepdir = 0
vim.g.netrw_winsize = -62
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 4
vim.g.netrw_bufsettings = "noma nomod nu rnu nobl nowrap ro"

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

