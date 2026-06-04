------------------------------------------------------------------------------
-- File:    ~/.config/nvim/lua/plugins.lua (archlinu @ 'silent')
-- Date:    Mon 01 Jun 2026 20:10
-- Update:  Thu 04 Jun 2026 08:09
-- Owner:   fvb - freekvb@gmail.com - https://freekvb.github.io/fvb/
-------------------------------------------------------------------------------


-- plugins

vim.pack.add({
    { src = "file:///home/fvb/.fzf" },
    { src = "https://github.com/metalelf0/black-metal-theme-neovim" },
    { src = "https://github.com/instant-markdown/vim-instant-markdown" },
    { src = "https://github.com/nvim-mini/mini.pairs" },
    { src = "https://github.com/nvim-mini/mini.statusline" },
    { src = "https://github.com/sphamba/smear-cursor.nvim" },
})

-- black metal colortheme
require("black-metal").setup({
    -- theme: bathory | black-metal-day | burzum | dark-funeral | darkthrone | emperor | gorgoroth | immortal | impaled-nazarene | khold | marduk | mayhem | nile | taake | thyrfing | venom | windir
    theme = "gorgoroth"
})
require("black-metal").load()

-- nvim mini
require("mini.pairs").setup()
require('mini.statusline').setup()

-- smear cursor
require("smear_cursor").setup()
