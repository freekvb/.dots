# nvim_nightly


#### command line color

```vim
---- command line color
--vim.cmd([[
--    autocmd VimEnter * highlight Normal guibg=black guifg=white
--    autocmd CmdLineEnter * set winhighlight=Normal:NormalNC | highlight Normal guibg=#615050 guifg=white | highlight NormalNC guibg=black guifg=white
--    autocmd CmdLineLeave * highlight Normal guibg=black guifg=white
--]])
```

#### quickfix bufferlist

```vim
-- buflist to quickfix list [Vitaly Kurin]
vim.keymap.set("n", "<leader>b", function()
    local qf_list = {}
    for _, buf in ipairs(vim.fn.getbufinfo()) do
        if buf.listed == 1 then
            table.insert(qf_list, {
                filename = buf.name ~= '' and buf.name or '[No Name]',
                text = ':' .. buf.bufnr
            })
        end
    end
    vim.fn.setqflist(qf_list, 'r')
    vim.cmd('copen')
end, {})
```

#### colortheme 'base16-black-metal' plugin

```vim
    -- { src = "https://github.com/metalelf0/black-metal-theme-neovim" },

    ---- black metal colortheme
    --require("black-metal").setup(
    --    {
    --        -- theme: bathory | black-metal-day | burzum | dark-funeral | darkthrone | emperor | gorgoroth | immortal | impaled-nazarene | khold | marduk | mayhem | nile | taake | thyrfing | venom | windir
    --        theme = "mayhem"
    --    }
    --)
    --require("black-metal").load()
    --vim.cmd(":hi statusline guibg=grey3")
```

#### vim-supertab

- pacman install
- works tab for menu tab / shift tab to scroll
- one thing though, scroll from bottom to top
- change <C-n> to <C-P> in 'usr/share/vim/vimfiles/plugin/supertab.vim'

#### clevertab

- didn't work anymore (?) .. using 'vim-supertab' now (pacman install)
    ```vim
        -- tab completion
        vim.cmd(
            [[
            function! CleverTab()
                if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
                    return '\<Tab>'
                else
                    return '\<C-N>'
                endif
            endfunction
            inoremap <Tab> <C-R>=CleverTab()<CR>
        ]]
        )
    ```
- this one (clevertab) sort of works
    ```vim
        vim.cmd([[
        function! CleverTab()
          if pumvisible()
            return "\<C-n>"
          endif
          if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
            return "\<tab>"
          elseif exists('&omnifunc') && &omnifunc != ''
            return "\<C-x>\<C-o>"
          else
            return "\<C-n>"
          endif
        endfunction
        inoremap <tab> <C-R>=CleverTab()<cr>
        ]])
    ```

