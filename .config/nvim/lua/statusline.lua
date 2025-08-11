-------------------------------------------------------------------------------
-- File:    ~/.config/nvim/lua/statusline.lua (archlinux @ 'silent')
-- Date:    Sat 09 Aug 2025 14:23
-- Update:  Mon 11 Aug 2025 04:08
-- Owner:   fvb - freekvb@gmail.com - https://freekvb.github.io/fvb/
-------------------------------------------------------------------------------

---- status line ----

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

-- modes and colors
vim.cmd(
    [[
    let g:mode_colors = {
            \ 'n'       :   'StatusLineSection',
            \ 'i'       :   'StatusLineSectionI',
            \ 'c'       :   'StatusLineSectionC',
            \ 'v'       :   'StatusLineSectionV',
            \ 'V'       :   'StatusLineSectionV',
            \ "\<C-V>"  :   'StatusLineSectionV',
            \ 'r'       :   'StatusLineSectionR'
            \ }
    ]]
)

-- statusline highlights colors
vim.cmd(
    [[
    fun! StatusLineHighlights()
        hi StatusLine            guibg=grey7      guifg=grey70
        hi StatusLineNC          guibg=grey3      guifg=grey39
        hi StatusLineSection     guibg=grey15     guifg=grey70    gui=bold
        hi StatusLineSectionI    guibg=grey39     guifg=grey3     gui=bold
        hi StatusLineSectionC    guibg=#615050    guifg=grey3     gui=bold
        hi StatusLineSectionV    guibg=#b29951    guifg=grey3     gui=bold
        hi StatusLineSectionR    guibg=#476565    guifg=grey3     gui=bold
    endfun
    call StatusLineHighlights()
]]
)

-- selected filename
vim.cmd(
    [[
    fun! StatusLineFilename()
        if (&ft ==? 'netrw') | return 'netrw.lua' | endif
        if (&ft ==? 'qf') | return 'quickfix list' | endif
        return substitute(expand('%'), '^' . getcwd() . '/\?', '', 'i')
    endfun
    ]]
)

-- active statusline
vim.cmd(
    [[
    fun! StatusLineActive()
    let hl = '%#' . get(g:mode_colors, tolower(mode()), g:mode_colors.n) . '#'
    return hl
        \ . ' [%n] '
        \ . (&modified ? '  [+] ' : '     ')
        \ . ' %{StatusLineFilename()}'
        \ . ' %r '
        \ . ' %#StatusLine# '
        \ . ' %= '
        \ . hl
        \ . ' %y '
        \ . '  '
        \ . '  '
        \ . ' %v '
        \ . ' %l/%L '
        \ . '  '
        \ . ' %p%% '
        \ . ' '
endfun
]]
)

-- inactive statusline
vim.cmd(
    [[
    fun! StatusLineInactive()
    let hl = '%#''#'
    return hl
        \ . ' [%n] '
        \ . (&modified ? '  [+] ' : '     ')
        "\ . '  %{PasteForStatusline()}'
        \ . ' %{StatusLineFilename()}'
        \ . ' %r '
        \ . ' %#StatusLine# '
        \ . ' %= '
        \ . hl
        \ . ' %y '
        \ . '  '
        \ . '  '
        \ . ' %v '
        \ . ' %l/%L '
        \ . '  '
        \ . ' %p%% '
        \ . ' '
endfun
]]
)

--selecting active or inactive statusline
vim.cmd(
    [[
    augroup vimrc
        au!
        au FocusGained,VimEnter,WinEnter,BufWinEnter *
          \ setlocal statusline=%!StatusLineActive()
        au FocusLost,VimLeave,WinLeave,BufWinLeave *
          \ setlocal statusline=%!StatusLineInactive()
        au Colorscheme * call <SID>StatusLineHighlights()
    augroup END
    ]]
)

