# notes


#### nieuwe notitie

##### nieuwe notities maken doe je zo:

- openen in vim met 'nn' in de terminal
- markdown preview live in chrome
- save notes
- [N] sn :saveas ~/Notes/*title*.md
- save zet (zettelkasten) notes (timestamped)
- [N] sz :saveas ~/Notes/zet/<C-R>=strftime("%Y%m%d%H%M%S%z")<CR>.md<CR>
- save trade notes (timestamp)
- [N] st :saveas ~/Notes/Trade/<C-R>=strftime("%a %d %b %Y %H:%M")<CR>.md<CR>
- insert last trade screenshot in trade note with timestamp above screenshot

```vim
    nnoremap tp :r!tp<CR>$3hDi<CR>[![trade](./tp/<Esc>:r!tp<CR>i<Backspace><Esc>$li)](./tp/<Esc>:r!tp<CR>i<Backspace><Esc>$li)<CR><CR>
```

##### markdown

- automatisch saved as .md dus
- markdown preview <leader>md
- markdown preview stop <leader>mds

---

#### lynx bookmark in md


##### add last lynx bookmark

script 'lxa'

```sh

    #!/bin/sh

    # copy last given (n) lynx bookmarks
    # and paste them in markdown format

    count=1
    if test -n "$1"; then
        count="$1"
    fi

    IFS=$'\n'
    html=($(tail -"${count}" ~/.config/lynx/lynx_bookmarks.html | pandoc -f html -t markdown --wrap=none))

    for line in ${html[@]}; do
       [[ $line =~ ^\[(.+)\]\((.+)\) ]]
       echo "* [${BASH_REMATCH[1]}] <${BASH_REMATCH[2]}>"
    done

```

nvim command

```vim
    :r! lxa
```

