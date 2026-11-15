local mainMod = "SUPER"
hl.on("hyprland.start", function ()
    hl.exec_cmd("mako")
    hl.exec_cmd("noctalia")
    hl.exec_cmd("pgrep -x hyprsunset || hyprsunset")
end)
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd("kitty"), { description = "Terminal" })
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("firefox-bin"), { description = "Browser" })
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("thunar"), { description = "Files" })
hl.bind(mainMod .. " + Q", hl.dsp.window.close(), { description = "Close window" })
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd("loginctl terminate-user mildew"), { description = "Exit" })
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }), { description = "Fullscreen" })
hl.bind(mainMod .. " + M", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }), { description = "Maximize" })
hl.bind(mainMod .. " + T", hl.dsp.window.float({ action = "toggle" }), { description = "Float" })
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }), { description = "Focus left" })
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }), { description = "Focus right" })
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }), { description = "Focus up" })
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }), { description = "Focus down" })
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true, description = "Move window" })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true, description = "Resize window" })
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.resize({ x = 100, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.resize({ x = -100, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.resize({ x = 0, y = 100, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.resize({ x = 0, y = -100, relative = true }), { repeating = true })
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end
hl.bind("PRINT", hl.dsp.exec_cmd('grim - | wl-copy'))
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })
hl.config({ input = { touchpad = { natural_scroll = true } } })
hl.on("hyprland.start", function () hl.exec_cmd("gentoo-pipewire-launcher") end)
hl.bind(mainMod .. " + ALT + left", hl.dsp.window.swap({ direction = "l" }))
hl.bind(mainMod .. " + ALT + right", hl.dsp.window.swap({ direction = "r" }))
hl.bind(mainMod .. " + ALT + up", hl.dsp.window.swap({ direction = "u" }))
hl.bind(mainMod .. " + ALT + down", hl.dsp.window.swap({ direction = "d" }))
hl.bind(mainMod .. " + K", hl.dsp.layout("swapsplit"))
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("scratchpad"))
hl.bind(mainMod .. " + SHIFT + S", function() hl.dispatch(hl.dsp.window.float({ action = "toggle" })); hl.dispatch(hl.dsp.window.move({ workspace = "special:scratchpad" })) end)
hl.bind(mainMod .. " + G", hl.dsp.group.toggle())
hl.bind(mainMod .. " + ALT + T", function() hl.dispatch(hl.dsp.window.float({ action = "toggle" })); hl.dispatch(hl.dsp.window.pin()) end)
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Noctalia binds
hl.bind("SUPER+S", hl.dsp.exec_cmd("noctalia msg panel-toggle control-center"))
hl.bind("SUPER+comma", hl.dsp.exec_cmd("noctalia msg settings-toggle"))

-- Hyprland animations on
hl.config({ animations = { enabled = true } })

-- no Hyprland animation on top of Noctalia's own
hl.layer_rule({ name = "noctalia-no-anim", match = { namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd|window-switcher)$" }, no_anim = true })
hl.bind("SUPER+Super_L", hl.dsp.exec_cmd("noctalia msg panel-toggle launcher"), { release = true })

-- only layers (screenshot selector) fade, everything else stays instant
hl.curve("fadeCurve", { type = "bezier", points = { {0.23, 1}, {0.32, 1} } })

hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd([[pkill -x slurp || { r=$(slurp -b '#00000066' -c '#ffffffcc' -s '#ffffff1a' -w 2) && sleep 0.4 && grim -g "$r" - | wl-copy; }]]))

for _, leaf in ipairs({ "layers", "layersIn", "layersOut" }) do
  hl.animation({ leaf = leaf, enabled = true, speed = 4, bezier = "fadeCurve", style = "fade" })
end
hl.layer_rule({ name = "selection-fade", match = { namespace = "selection" }, animation = "fade" })

hl.env("XCURSOR_THEME", "Adwaita")
hl.env("XCURSOR_SIZE", "18")
hl.env("HYPRCURSOR_THEME", "Adwaita")
hl.env("HYPRCURSOR_SIZE", "18")

for _, leaf in ipairs({ "fadeLayers", "fadeLayersIn", "fadeLayersOut" }) do
  hl.animation({ leaf = leaf, enabled = true, speed = 4, bezier = "fadeCurve" })
end

hl.config({
  general = {
    border_size = 2,
    col = {
      active_border = "rgba(ffb4a2ee)",
      inactive_border = "rgba(3a2a26aa)",
    },
  },
  decoration = {
    rounding = 12,
  },
})

hl.animation({ leaf = "layers", enabled = false })


hl.config({ dwindle = { preserve_split = true } })


