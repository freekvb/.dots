# nvim


##### short messages

```vim
    -- statusline.lua
    -- prompt message options
set.shortmess = "atToOFc" < add I
```

##### fzf no statusline

```vim
    -- no statusline when using fzf
    vim.cmd([[
    autocmd! FileType fzf
    autocmd  FileType fzf set laststatus=0 noruler
      \| autocmd BufLeave <buffer> set laststatus=2 ruler
    ]])
```

##### split windows

```vim
    -- split windows (using dbm.nvim plugin)
    -- 'split' horizontal below
    set.splitbelow = true
    -- 'vsplit' vertical on the right
    set.splitright = true
    -- open split
    keymap("n", "sp", ":split<cr>", opts)
    -- 'vsplit' in dwm master stack ratio
    keymap("n", "vs", ":vsplit<cr>:vert resize 132<cr>", opts)
    -- navigate split windows
    keymap("n", "<c-h>", "<c-w>h", opts)
    keymap("n", "<c-j>", "<c-w>j", opts)
    keymap("n", "<c-k>", "<c-w>k", opts)
    keymap("n", "<c-l>", "<c-w>l", opts)
    -- terminal in split below, resize and start insert mode
    keymap("n", "<leader>st", ":sp<bar>resize15<bar>term<cr>", opts)
    vim.cmd([[
    	autocmd TermOpen * startinsert
    ]])
    keymap("t", "<esc>", "<c-\\><c-n>", {})
    -- plugin dbm
    keymap("n", "<leader>st",   ":DBM split<cr>:terminal<cr>", opts)
    vim.cmd([[
    	autocmd TermOpen * startinsert
    ]])
    keymap("t", "<esc>", "<c-\\><c-n>", {})
```

##### netrw

```vim
    " netrw
     netrw file manager "
     display info on the top of window
    let g:netrw_banner = 1 "
     tree-view
    let g:netrw_liststyle = 3 "
     sort is affecting only: directories on the top, files below
    let g:netrw_sort_sequence = '[\/]$,*' "
     use the previous window to open file
    let g:netrw_browse_split = 0 "
     open Netrw
    nnoremap <leader>n :Vex<CR>
```

##### recording a macro

Each register is identified by a letter a to z.

To enter a macro, type:

    q<letter><commands>q

To execute the macro <number> times (once by default), type:

    <number>@<letter>

So, the complete process looks like:

    qd	start recording to register d
    ...	your complex series of commands
    q	stop recording
    @d	execute your macro
    @@	execute your macro again

##### paste

Paste without new line

Put this in your .vimrc file:
```vim
    "Paste yanked line without line breaks before/after cursor position
    nnoremap gP i<CR><Esc>PkJxJx
    nnoremap gp a<CR><Esc>PkJxJx
```

Example:

```vim
    <span style="color:">danger</span>
```

Now you can type gp to insert #D51B3F after color: while my cursor is at : in
Normal mode.

---

How can I paste some text that I yanked at the end of the line? Currently I'm
doing it by pressing $p. Is there any way to do this with a single keystroke?

---

A couple more keystrokes, but will allow you to position the text or add other
content before pasting:

    a

position the cursor where you would like to paste the text

    Ctrl+r"

Explanation: Ctrl+r inserts the contents of a register. " is the unnamed
register, containing the text of the last delete or yank.

I find myself doing this a lot when pasting comments. :)


##### trade notes

```vim
    -- trade notes ('nt' in terminal in '$HOME/Notes/trades' directory)
    -- save trade note [time stamp]
    keymap("n", "st", [[:saveas $HOME/Notes/trades/<c-r>=strftime("%d %b %Y %H:%M:%S")<cr>.md<cr>]], opt)
    -- insert last trade screenshot in trade note with timestamp above screenshot
    keymap(
    	"n",
    	"tp",
    	[[:r!tp<cr>i######<space><esc>$3hDi<cr>[![trade](./tp/<esc>:r!tp<cr>i<backspace><esc>$li)](./tp/<esc>:r!tp<cr>i<backspace><esc>$li)<cr><cr><esc>]],
    	opts
    )
    -- insert title time stamp
    keymap("n", "<leader>t", [[:r!dt<cr>kddo---<cr><esc>]], opts)
    -- insert Agenda
    keymap("n", "tc", [[:r!trade_calendar<cr>]], opts)
    -- insert Narratief
    keymap("n", "tn", [[:r!trade_narrative<cr>]], opts)
    -- insert Executie
    keymap("n", "te", [[:r!trade_execution<cr>34k]], opts)
    -- insert Checklijst
    keymap("n", "tl", [[:r!trade_list<cr>13kdd11k12li]], opts)
    -- insert Samenvatting
    keymap("n", "ts", [[:r!trade_summarize<cr>]], opts)
    -- insert Resultaat
    keymap("n", "tr", [[:r!trade_result<cr>]], opts)
```


##### auto brackets

```vim
    ---- automatically close brackets, parenthesis and quotes
    --keymap("i", "'", "''<left>", opts)
    --keymap("i", "\"", "\"\"<left>", opts)
    --keymap("i", "(", "()<left>", opts)
    --keymap("i", "[", "[]<left>", opts)
    --keymap("i", "{", "{}<left>", opts)
    --keymap("i", "{;", "{};<left><left>", opts)
    --keymap("i", "/*", "/**/<left><left>", opts)
```

##### auto completion

```vim
    ---- auto completion
    --local triggers = {'.'}
    --vim.api.nvim_create_autocmd('InsertCharPre', {
    --  buffer = vim.api.nvim_get_current_buf(),
    --  callback = function()
    --    if vim.fn.pumvisible() == 1 or vim.fn.state('m') == 'm' then
    --      return
    --    end
    --    local char = vim.v.char
    --    if vim.list_contains(triggers, char) then
    --      local key = vim.keycode('<C-x><C-n>')
    --      vim.api.nvim_feedkeys(key, 'm', false)
    --    end
    --  end
    --})
```
