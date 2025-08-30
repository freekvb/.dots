# pacman


#### update mirrorlist

    doas reflector --latest 10 --sort rate --protocol https --save /etc/pacman.d/mirrorlist

#### kernel downgrade

    doas pacman -U /var/cache/pacman/pkg/linux-'version'-x86_64.pkg.tar.zst

#### packages

total

    pacman -Q | wc -l

explicitly installed

    pacman -Qe | wc -l

foreign (arch build system) aur

    pacman -Qm | wc -l

remove orphans

    pacman -Qtdq | pacman -Rns -

#### Clean the package cache in Arch Linux using Paccache

To clean all packages, except the 3 most recent versions, run the following command:

    doas paccache -r

Still want to remove more packages? Of course, you can! Paccache allows you to
decide how many recent versions you want to keep. For instance, run the following
command if you want to keep only one most recent version:

    doas paccache -rk 1

(Where, k indicates to keep num of each package in the cache.)

To remove all cached versions of uninstalled packages, re-run paccache with u flag:

    doas paccache -ruk0

(Where, u flag indicates the uninstalled packages.)

---

#### paru

    paru -Sc : delete only the cache of unused versions are deleted, maintaining the last working version accessible if needed

    paru -c : remove unneeded dependencies (i.e. make depends)

