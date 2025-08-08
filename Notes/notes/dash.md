# dash


set dash as default system shell

> doas ln -sfT /bin/dash /bin/sh

set pacman hook so updating bash doesn't reverse automaticly

> /usr/share/libalpm/hooks/bash-update.hook


    [Trigger]
    Type = Package
    Operation = Install
    Operation = Upgrade
    Target = bash

    [Action]
    Description = Re-pointing /bin/sh symlink to dash...
    When = PostTransaction
    Exec = /usr/bin/ln -sfT dash /usr/bin/sh
    Depends = dash

