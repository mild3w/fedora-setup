hl.on("hyprland.start", function ()
    hl.exec_cmd("pgrep -x hyprsunset || hyprsunset")
end)
