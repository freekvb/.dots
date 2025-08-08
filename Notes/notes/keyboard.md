# keyboard


#### compile and flash

---

##### new qmk_firmware repo installed (dd 03 nov 2022)

---

#### ferris sweep

##### configure build environment

    qmk config user.keyboard=ferris/sweep

user.keyboard: None -> ferris/sweep
Ψ Wrote configuration to /home/fvb/.config/qmk/qmk.ini

##### create new keymap

    qmk config user.keymap=fvb

user.keymap: None -> fvb
Ψ Wrote configuration to /home/fvb/.config/qmk/qmk.ini

    qmk new-keymap

Ψ fvb keymap directory created in: /home/fvb/Programs/qmk_firmware/keyboards/ferris/keymaps/fvb
Ψ Compile a firmware with your new keymap by typing:

##### compile ferris sweep

    qmk compile -kb ferris/sweep -km fvb

##### flash ferris sweep

    qmk flash -kb ferris/sweep -km fvb

---

#### gergoplex

##### configure build environment

    qmk config freekvb.keyboard=gboards/gergoplex

##### create new keymap

    qmk new-keymap -kb <freekvb>

Ψ freekvb keymap directory created in: /home/fvb/Programs/qmk_firmware/keyboards/gboards/gergoplex/keymaps/freekvb

Ψ compile a firmware with your new keymap by typing:

##### compile gergoplex

    qmk compile -kb gboards/gergoplex -km freekvb

##### flash gergoplex

    qmk flash -kb gboards/gergoplex -km freekvb

---

#### corn

##### flash corne

    qmk flash -kb crkbd/rev1 -km fvb

##### key delay repeat rate

setting in .xprofile

    xset r rate 750 50

set per key

    xset -r xx

Using "-r" disables the key's repeat, and using "r" (without "-") enables it again.

Get the key code through "xev -event keyboard" and hitting a key. A text "keycode xx" is somewhere in the xev output.
