# bare_dots


## bare git repo

- set up a bare git repo for dot and config files
- no simlinking needed, that's nice

[.dots on github](https://github.com/freekvb/.dots)

#### set up the repo

##### make a local bare repo

```sh
    git init --bare $HOME/.dots
    alias dot='/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME'
    echo "alias dot='/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME'" >> $HOME/.config/zsh/aliasrc
    dot config --local status.showUntrackedFiles no
```

##### open a new '.dots' repo on github

```sh
    dot remote add origin <remote-url>
```

##### and work it

- leave file in it's own directory
- add to repo: dot add file
- commit file: dot commit -m 'file added'
- push to github

```sh
    dot add file
    dot commit -m 'file added'
    dot push -u origin main
```

##### update repo

```sh
    dot status
    dot add -u .
    dot commit -m 'update .. or some other message'
    dot push
        or
    dot add -u . && dot commit -m 'update' && dot push
```

**dotu** alias(rc) for the regular update


---


#### install config files

- put .dots in .gitignore (don't track itself)
- git clone the files to your machine
- local repo settings same as orginal machine
- so, alias, dir, worktree (must be $HOME if bare)
- place the files in their directory

```sh
    echo "alias dot='/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME' >> $SHELL(?)"
    echo ".dots" >> .gitignore
    git clone --bare <remote-git-repo-url> $HOME/.dots/
    dot config --local status.showUntrackedFiles no
    alias dot='/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME'
    dot checkout
```

##### update system

- save (stash) changed local files
- download (pull) remote repo and update system
- reapply saved (stashed) local files

```sh
    dot status
    dot stash
    dot pull
    dot stash pop
        or
    dot stash && dot pull && dot stash pop
```

**dotd** alias(rc) for the regular repo download system update
