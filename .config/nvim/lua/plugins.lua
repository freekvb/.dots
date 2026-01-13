------------------------------------------------------------------------------
-- File:    ~/.config/nvim/lua/plugins.lua (archlinux @ 'silent')
-- Date:    Fri 01 Aug 2025 21:30
-- Update:  Tue 26 Aug 2025 11:23
-- Owner:   fvb - freekvb@gmail.com - https://freekvb.github.io/fvb/
-------------------------------------------------------------------------------

---- plugins ----

vim.pack.add(
    {
        { src = "file:///home/fvb/.fzf" },
        { src = "https://github.com/metalelf0/black-metal-theme-neovim" },
        { src = "https://github.com/instant-markdown/vim-instant-markdown" },
        { src = "https://github.com/echasnovski/mini.starter" },
        -- { src = "https://github.com/uZer/pywal16.nvim", as = "pywal16" },
        { src = "https://github.com/sphamba/smear-cursor.nvim" },
        { src = "https://github.com/christoomey/vim-tmux-navigator" }
    }
)

-- plugin options ----

-- black metal colortheme
require("black-metal").setup(
    {
        -- theme: bathory | black-metal-day | burzum | dark-funeral | darkthrone | emperor | gorgoroth | immortal | impaled-nazarene | khold | marduk | mayhem | nile | taake | thyrfing | venom | windir
        theme = "gorgoroth"
    }
)
require("black-metal").load()

---- pywal16
--local pywal16 = require('pywal16')
--pywal16.setup()

-- mini starter
require("mini.starter").setup(
    {
        autoopen = true, evaluate_single = false, items = nil,
        header = " ",
        footer = " ",
        content_hooks = nil,
        query_updaters = "abcdefghijklmnopqrstuvwxyz0123456789_-.",
        silent = false
    }
)

-- smear cursor
require("smear_cursor").setup(
    {
        cursor_color = white,
        smear_between_buffers = true,
        smear_between_neighbor_lines = true,
        scroll_buffer_space = true,
        legacy_computing_symbols_support = false,
        smear_insert_mode = true,
        -- options                              -- default  range
        stiffness = 0.8,                        -- 0.6      [0, 1]
        trailing_stiffness = 0.5,               -- 0.4      [0, 1]
        stiffness_insert_mode = 0.7,            -- 0.5      [0, 1]
        trailing_stiffness_insert_mode = 0.6,   -- 0.5      [0, 1]
        damping = 0.65,                         -- 0.65     [0, 1]
        damping_insert_mode = 0.7,              -- 0.7      [0, 1]
        distance_stop_animating = 0.5           -- 0.1      > 0
    }
)

