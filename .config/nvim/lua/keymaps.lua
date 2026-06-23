------------------------------------------------------------------------------
-- File:    ~/.config/nvim/lua/keymaps.lua (archlinu @ 'silent')
-- Date:    Mon 01 Jun 2026 19:00
-- Update:  Thu 04 Jun 2026 15:54
-- Owner:   fvb - freekvb@gmail.com - https://freekvb.github.io/fvb/
-------------------------------------------------------------------------------


-- keymaps

vim.g.mapleader = ","

vim.keymap.set("n", ";", ":")
vim.keymap.set("n", "<leader>w", ":write<cr>")
vim.keymap.set("n", "<leader>q", ":quit<cr>")
vim.keymap.set("n", "<leader>wq", ":wq<cr>")

-- update and source
vim.keymap.set("n", "<leader>s", ":update<cr> :source<cr>")

-- prevent accidentally record functionality
vim.keymap.set("n", "q", "<nop>")
vim.keymap.set("n", "Q", "q")

-- navigate buffers
vim.keymap.set("n", "bl", ":ls<cr>")
vim.keymap.set("n", "bn", ":bnext<cr>")
vim.keymap.set("n", "bp", ":bprevious<cr>")
vim.keymap.set("n", "bq", ":bdelete<cr>")
vim.keymap.set("n", "bo", ":ls<cr>:b<space>")

-- splits [right, bottom]
vim.keymap.set("n", "<leader>v", ":vsplit<cr>:vert resize 141<cr>:e<space>")
vim.keymap.set("n", "<leader>h", ":split<cr>")
-- terminal split rihght, resized and in insert mode
vim.keymap.set("n", "<leader>t", ":vsplit<bar>vert resize 141<bar>term<cr>")
-- exit terminal to normal mode window
vim.keymap.set("t", "<esc>", "<c-\\><c-n>", {})

-- splits navigation
vim.keymap.set("n", "<c-h>", "<c-w>h")
vim.keymap.set("n", "<c-j>", "<c-w>j")
vim.keymap.set("n", "<c-k>", "<c-w>k")
vim.keymap.set("n", "<c-l>", "<c-w>l")

-- toggle netrw
vim.keymap.set("n", "<leader>nn", ":Lexplore<cr>")
vim.keymap.set("n", "<leader>nd", ":Lexplore %:p:h<cr>")

-- toggle autocompletion
vim.keymap.set("n", "<leader>a", ":set invac<cr>")

-- fuzzy find [fzf]
vim.keymap.set("n", "<leader>f", ":FZF --no-border ~<cr>")
-- fzf in working directory
vim.keymap.set("n", "<leader>fd", ":FZF --no-border %:p:h<cr>")
 
-- clear highlighting from search
vim.keymap.set("n", "<esc>", ":nohlsearch<cr>", { silent = true })
-- search and replace word under cursor
vim.keymap.set("n", "<space><space>", [[:%s/\<<c-r>=expand('<cword>')<cr>\>/]])

-- easy folding
vim.keymap.set("n", "z", "za<space>0")

-- new note [nn] save [and quit] finished $HOME/Notes/notes/[title]
vim.keymap.set("n", "sn", [[:w<cr>:!save_note<cr>:q<cr>]])
-- new local note [nn] save [and quit] finished $HOME/Notes/notes_local/[title]
vim.keymap.set("n", "sl", [[:w<cr>:!save_note_local<cr>:q<cr>]])
-- new scratch note [nn] save [and quit] finished $HOME/Notes/notes_scratch/[title]
vim.keymap.set("n", "ss", [[:w<cr>:!save_note_scratch<cr>:q<cr>]])
-- blog entry
vim.keymap.set("n", "be", [[:/#<cr><cr><cr>jO<c-r>=strftime('%a %d %b %Y %H:%M')<cr><cr><cr><esc>2ko]])
-- insert shebang
vim.keymap.set("n", "sb", [[i#!/bin/sh<cr><cr>]])

 -- hyperlinks in markdown
vim.keymap.set('n', '<leader>l', 'i[]()<Left><Left><Left><Esc>a')
vim.keymap.set('v', '<leader>l', '"ac[<C-r>"]()<Esc><Left>a')

-- instant markdown
vim.keymap.set("n", "md", ":InstantMarkdownPreview<cr>")
vim.keymap.set("n", "mds", ":InstantMarkdownStop<cr>")

-- header update
vim.keymap.set("n", "<leader>u", [[gg/Update<cr>2wc$<c-r>=strftime('%a %d %b %Y %H:%M')<cr><esc>03j:nohlsearch<cr>]])

