------------------------------------------------------------------------------
-- File:    ~/.config/nvim/lua/keymaps.lua (archlinux @ 'silent')
-- Date:    Fri 01 Aug 2025 21:30
-- Update:  Mon 11 Aug 2025 04:17
-- Owner:   fvb - freekvb@gmail.com - https://freekvb.github.io/fvb/
-------------------------------------------------------------------------------

---- keymaps ----

vim.g.mapleader = ","
vim.keymap.set("n", ";", ":")
vim.keymap.set("n", "<leader>w", ":write<cr>")
vim.keymap.set("n", "<leader>q", ":quit<cr>")
vim.keymap.set("n", "<leader>wq", ":wq<cr>")

-- prevent accidentally record functionality
vim.keymap.set("n", "q", "<nop>")
vim.keymap.set("n", "Q", "q")

-- toggle relativenumber
vim.keymap.set("n", "<leader>r", ":set invrnu<cr>")

-- navigate buffers
vim.keymap.set("n", "<leader>b", ":ls<cr>")
vim.keymap.set("n", "<s-l>", ":bnext<cr>")
vim.keymap.set("n", "<s-h>", ":bprevious<cr>")
vim.keymap.set("n", "<leader>bd", ":bdelete<cr>")
vim.keymap.set("n", "<leader>gb", ":ls<cr>:b<space>")

-- split window [right, bottom]
vim.keymap.set("n", "<leader>v", ":vsplit<cr>:vert resize 144<cr>:e<space>")
vim.keymap.set("n", "<leader>h", ":split<cr>")
-- window navigation
vim.keymap.set("n", "<c-h>", "<c-w>h")
vim.keymap.set("n", "<c-j>", "<c-w>j")
vim.keymap.set("n", "<c-k>", "<c-w>k")
vim.keymap.set("n", "<c-l>", "<c-w>l")
-- terminal split below, resized and in insert mode
vim.keymap.set("n", "<leader>t", ":sp<bar>res15<bar>term<cr>")
-- window normal mode [terminal start in insert mode]
vim.keymap.set("t", "<esc>", "<c-\\><c-n>", {})

-- toggle netrw
vim.keymap.set("n", "<leader>n", ":Lexplore<cr>")
-- open in working directory
vim.keymap.set("n", "<leader>nd", ":Lexplore %:p:h<cr>")

-- fuzzy find [fzf]
vim.keymap.set("n", "<leader>f", ":FZF --no-border ~<cr>")
-- fzf in working directory
vim.keymap.set("n", "<leader>fd", ":FZF --no-border %:p:h<cr>")
-- quickfix grep <string>
vim.keymap.set("n", "<leader>fg", [[:Grep ]])

-- show quickfix list
vim.keymap.set("n", "<leader>co", ":copen<cr>")
-- hide quickfix list
vim.keymap.set("n", "<leader>cc", ":cclose<cr>")
-- next quickfix location
vim.keymap.set("n", "[", ":cnext<cr>")
-- previous quickfix location
vim.keymap.set("n", "]", ":cprev<cr>")

-- search and replace word under cursor
vim.keymap.set("n", "<space><space>", [[:%s/\<<c-r>=expand('<cword>')<cr>\>/]])
-- search and replace all instances given term
vim.keymap.set("n", "<s-s>", [[:%s//gI<Left><Left><Left>]])
-- clear highlighting from the search
vim.keymap.set("n", "<esc>", ":nohlsearch<cr><esc>")

-- toggle spell checking
vim.keymap.set("n", "<leader>s", ":setlocal spell! spelllang=en_us,nl<cr>")
-- corect mis spell
vim.keymap.set("n", "<leader>c", "li<C-x>s")
-- next mis spell
vim.keymap.set("n", "<n>", "]s")

-- toggle auto completion
vim.keymap.set("n", "<leader>a", ":set invac<cr>")

-- easy folding
vim.keymap.set("n", "z", "za<space>0")

-- instant markdown [qutebrowser]
vim.keymap.set("n", "md", ":InstantMarkdownPreview<cr>")
vim.keymap.set("n", "mds", ":InstantMarkdownStop<cr>")

-- new note [nn] save [and quit] finished $HOME/Notes/notes/[title]
vim.keymap.set("n", "sn", [[:w<cr>:!save_note<cr>:q<cr>]])
-- new local note [nn] save [and quit] finished $HOME/Notes/local_notes/[title]
vim.keymap.set("n", "sl", [[:w<cr>:!save_note_local<cr>:q<cr>]])
-- blog entry
vim.keymap.set("n", "<leader>be", [[:/#<cr><cr><cr>jO<c-r>=strftime('%a %d %b %Y %H:%M')<cr><cr><cr><esc>2ko]])
-- insert shebang
vim.keymap.set("n", "sb", [[i#!/bin/sh<cr><cr>]])

-- header update
vim.keymap.set("n", "<leader>u", [[gg/Update<cr>2wc$<c-r>=strftime('%a %d %b %Y %H:%M')<cr><esc>03j:nohlsearch<cr>]])

