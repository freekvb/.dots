# webcam


#### view webcam feed on wayland

##### full tiling window

    mpv --autofit=15% av://v4l2:/dev/video0 --profile=low-latency --untimed=yes --video-latency-hacks=yes --wayland-internal-vsync=no --video-sync=display-desync --vf=hflip

##### small window [floating - alt-t]

    mpv --autofit=15% av://v4l2:/dev/video0 --profile=low-latency --untimed=yes --video-latency-hacks=yes --wayland-internal-vsync=no --video-sync=display-desync --vf=hflip


##### webcam floating lower left corner (bspwm)

    mpv --geometry=-12-12 --autofit=30% /dev/video0 --vf=hflip
    bspc rule -a guvcview | state=floating rectangle=480x270+1428+798 sticky=on layer=above

##### no lag (all wm's)

    ffplay -fflags nobuffer -avioflags direct -i /dev/videoX

