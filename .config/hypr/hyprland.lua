-------------------------------------------------------------------------------
-- File:     ~/.config/hypr/hyprland.lua  (archlinux - 'silent')
-- Date:     Tue 12 May 2026 06:00
-- Update:   Fri 15 May 2026 04:45
-- Owner:    fvb - freekvb@gmail.com - https://freekvb.github.io/fvb/
-------------------------------------------------------------------------------


---- monitors -----------------------------------------------------------------

-- silent
hl.monitor({
    output      = "HDMI-A-1",
    mode        = "2560x1080@60",
    position    = "0x0",
    scale       = "1",
})

---- small
-- hl.monitor({
--     output      = "eDP-1",
--     mode        = "1920x1080@60",
--     position    = "0x0",
--     scale       = "1",
-- })


---- standard programs --------------------------------------------------------

local terminal      = "foot"
local menu          = "rofi -show run"
local editor        = "nvim"
local browser       = "zen-browser"
local fileManager   = "yazi"


---- autostart ----------------------------------------------------------------

hl.on("hyprland.start", function ()
  hl.exec_cmd("hyprpaper -c .config/hypr/hyprpaper.conf")
  hl.exec_cmd("mpv --no-video $HOME/.config/sounds/ray-gun.mp3")
  hl.exec_cmd("dunst")
  hl.exec_cmd("udiskie")
  hl.exec_cmd("mega-cmd-server")
  hl.exec_cmd("waybar")
  hl.exec_cmd("hypridle")
  hl.exec_cmd("copyq --start-server hide clipboard")
end)


---- enviroment variables -----------------------------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "Adwaita")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "Adwaita")

---- look and feel ------------------------------------------------------------

hl.config({
    general = {
        gaps_in  = 1,
        gaps_out = 0,
        border_size = 0,
        col = {
            active_border   = { colors = {"rgba(33ccffee)", "rgba(00ff99ee)"}, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },
        resize_on_border = false,
        allow_tearing = false,
        layout = "master",
    },
    decoration = {
        rounding       = 0,
        rounding_power = 0,
        active_opacity   = 0.80,
        inactive_opacity = 0.60,
        shadow = {
            enabled      = false,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },
        blur = {
            enabled   = true,
            size      = 5,
            passes    = 2,
            vibrancy  = 0.1696,
        },
    },
    animations = {
        enabled = false,
    },
})
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })
hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })


---- layouts ------------------------------------------------------------------

hl.config({
    dwindle = {
        preserve_split = true,              -- you probably want this
    },
})

hl.config({
    master = {
        new_status = "master",
        new_on_top = true,
        mfact = 0.55,
    },
})

hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})


----  misc  -------------------------------------------------------------------

hl.config({
    misc = {
        force_default_wallpaper = 0,        -- set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = true,     -- if true disables the random hyprland logo / anime girl background. :(
    },
})


---- input --------------------------------------------------------------------

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        -- kb_options = "caps:swapescape",  -- only on small
        kb_rules   = "",

        follow_mouse = 0,
        accel_profile = adaptive,
        sensitivity = -0.5,                 -- -1.0 - 1.0, 0 means no modification.
        },

        cursor = {
            inactive_timeout = 2,
        },

--        touchpad = {                      -- only on small
--            natural_scroll = false,       -- only on small
--        },                                -- only on small
    })


-- hl.gesture({                             -- only on small
--    fingers = 3,                          -- only on small
--    direction = "horizontal",             -- only on small
--    action = "workspace"                  -- only on small
--})                                        -- only on small


---- keybindings --------------------------------------------------------------

-- set main modifier
local mainMod = "ALT"

-- general
hl.bind(mainMod .. " + space", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + return", hl.dsp.exec_cmd(menu))
local closeWindowBind = hl.bind("SUPER + q", hl.dsp.window.close())
hl.bind(mainMod .. " + t", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + f", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + q", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))

-- programs
hl.bind("SUPER + b", hl.dsp.exec_cmd("brave"))
hl.bind("SUPER + z", hl.dsp.exec_cmd("zen-browser"))
hl.bind(mainMod .. " + r", hl.dsp.exec_cmd("moc_radio"))
hl.bind(mainMod .. " + v", hl.dsp.exec_cmd("mpv_cq"))

-- waybar toggle
hl.bind(mainMod .. " + b", hl.dsp.exec_cmd("killall -SIGUSR1 waybar"))

-- calculator
hl.bind("SUPER + r", hl.dsp.exec_cmd("rofi -show calc -modi calc -no-show-match -no-sort"))

-- clipboard
hl.bind(mainMod .. " + p", hl.dsp.exec_cmd("copyq toggle"))

-- emoji
hl.bind("SUPER + e", hl.dsp.exec_cmd("rofimoji --action copy"))

-- volume
hl.bind("SUPER + period", hl.dsp.exec_cmd("pamixer --allow-boost -i 5 && vol_not"))
hl.bind("SUPER + comma", hl.dsp.exec_cmd("pamixer --allow-boost -d 5 && vol_not"))
hl.bind("SUPER + slash", hl.dsp.exec_cmd("pamixer --allow-boost --set-volume 25 && vol_not"))
hl.bind("SUPER + m", hl.dsp.exec_cmd("pamixer -t"))

-- moc
hl.bind(mainMod .. " + x", hl.dsp.exec_cmd("mocp -G"))  -- toggle pauze
hl.bind(mainMod .. " + q", hl.dsp.exec_cmd("mocp -s"))  -- stop
hl.bind("SUPER + n", hl.dsp.exec_cmd("mocp -f"))  -- next track
hl.bind("SUPER + p", hl.dsp.exec_cmd("mocp -r"))  -- previous track
hl.bind("SUPER + i", hl.dsp.exec_cmd("moc_playing"))  -- info

-- quit mpv [music]
hl.bind(mainMod .. " + q", hl.dsp.exec_cmd("mpv_kill"))

-- screenshot
hl.bind("SUPER + s", hl.dsp.exec_cmd("grim && mv $HOME/Pictures/*_grim.png $HOME/Notes/trades/tp/ && dunstify 'screenshot >> Notes/trades/tp'"))
hl.bind("SUPER + SHIFT + s", hl.dsp.exec_cmd("grim && mv $HOME/Pictures/*_grim.png $HOME/Notes/screens/ && dunstify 'screenshot >> Notes/screens'"))

-- lock and turn off monitor
hl.bind(mainMod .. " + z", hl.dsp.exec_cmd("pamixer --allow-boost --set-volume 25 && hyprlock"))


---- window movement -----------------------------------------------------

-- move window focus
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- move window
hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.focus({ direction = "down" }))

-- resize window
hl.bind(mainMod .. " + CTRL + left",  hl.dsp.window.resize({ x = -10, y = 0, relative = true}), { repeating = true })
hl.bind(mainMod .. " + CTRL + right", hl.dsp.window.resize({ x = 10, y = 0, relative = true}), { repeating = true })
hl.bind(mainMod .. " + CTRL + up",    hl.dsp.window.resize({ x = 0, y = 10, relative = true}), { repeating = true })
hl.bind(mainMod .. " + CTRL + down",  hl.dsp.window.resize({ x = 10, y = -10, relative = true}), { repeating = true })

-- move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })


---- workspace movement -------------------------------------------------------

-- scroll workspaces
hl.bind(mainMod .. " + l", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + h", hl.dsp.focus({ workspace = "e-1" }))

-- switch workspaces with mainMod + [0-9]
-- move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- special workspace (scratchpad)
hl.bind(mainMod .. " + s",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + s", hl.dsp.window.move({ workspace = "special:magic" }))

-- scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))


---- window rules -------------------------------------------------------------

-- ignore maximize requests
local suppressMaximizeRule = hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

-- fix dragging issues
hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})

hl.window_rule({
  name = "ignore maximize",
  match = {
    class = ".*"
  },
  suppress_event = "maximize",
})

hl.window_rule({
  name = "copyq",
  match = {
    class = "com.github.hluk.copyq"
  },
  float = true,
  center = true,
  size = "1230 360",
  opacity = "0.95 override 0.85 override",
})

hl.window_rule({
  name = "pavucontrol",
  match = {
    class = "org.pulseaudio.pavucontrol"
  },
  float = true,
  center = true,
  size = "1230 540",
})

hl.window_rule({
  name = "zen-browser",
  match = {
    class = "zen"
  },
  opacity = "1.0 override 0.9 override",
})

hl.window_rule({
  name = "pic-in-pic",
  match = {
    title = "Picture-in-Picture"
  },
  size = "568 320",
  move = "1982 750",
  float = true,
  pin = true,
  no_anim = true,
})

hl.window_rule({
  name = "brave",
  match = {
    class = "brave-browser"
  },
  opacity = "1.0 override 0.9 override",
})

hl.window_rule({
  name = "qutebrowser",
  match = {
    class = "org.qutebrowser.qutebrowser"
  },
  opacity = "1.0 override 0.9 override",
})

hl.window_rule({
  name = "mpv",
  match = {
    class = "mpv"
  },
  opacity = "1.0 override 0.9 override",
})

hl.window_rule({
  name = "tmux",
  match = {
    class = "tmux"
  },
  opacity = "0.95 override 0.95 override",
})

hl.window_rule({
  name = "nemo",
  match = {
    class = "nemo"
  },
  opacity = "0.95 override 0.9 override",
})

hl.window_rule({
  name = "zathura",
  match = {
    class = "org.pwmt.zathura"
  },
  opacity = "1.0 override 0.9 override",
})


---- workspace rules ----------------------------------------------------------

hl.workspace_rule({
    workspace = "6",
    gaps_in = 0,
    gaps_out = 0,
})

hl.workspace_rule({
    workspace = "7",
    gaps_in = 0,
    gaps_out = 0,
})

hl.workspace_rule({
    workspace = "8",
    gaps_in = 0,
    gaps_out = 0,
})

hl.workspace_rule({
    workspace = "9",
    gaps_in = 0,
    gaps_out = 0,
})

hl.workspace_rule({
    workspace = "special:magic",
    on_created_empty = "foot",
    gaps_out = 200
})

