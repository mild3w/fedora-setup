systemctl --user stop xdg-desktop-portal-hyprland xdg-desktop-portal 2>/dev/null
systemctl --user start --ignore-dependencies xdg-desktop-portal-hyprland xdg-desktop-portal

# Wait a moment for outputs to settle, then launch hyprsunset
sleep 2
pgrep -x hyprsunset || hyprsunset &
