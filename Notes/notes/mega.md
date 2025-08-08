# mega


#### upload a file or folder

    mega-put /path/to/my/temporary_resource /exportedstuff/

#### make a public link

    mega-export -a  /exportedstuff/temporary_resource | awk '{print $4}'

#### make a public link expiering after x time

    mega-export -a  /exportedstuff/temporary_resource --expire=10M | awk '{print $4}'

#### backup

    backup Notes [/local/path/myfolder] Note [/mega/path] --period="0 0 5 * * *" --num-backups=2

This will configure a backup of “myfolder” into /mega/path that will be carried out at 5:00 A.M. (UTC) every day.
It will store the last 2 copies. A first backup will be carried out immediately.

