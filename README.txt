disable-bluetooth-boot.service -> /etc/systemd/system/  (then: sudo systemctl enable it)
80-battery.conf, 90-profiles.conf -> /etc/tlp.d/        (then: sudo tlp start)
hyprsunset.conf, custom.lua    -> ~/.config/hypr/
default.lua                    -> ~/.config/hypr/conf/keybindings/
.portal-fix.sh                 -> ~/  (make executable: chmod +x)
portal-fix.desktop             -> ~/.config/autostart/
bashrc                         -> ~/.bashrc (contains the vesktop alias)
Fedora boots first: not a file, set with efibootmgr (boot order 0001 before 0000)
