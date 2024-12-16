case "$*" in
        ' set wallpaper')
            _wallpaper=''
            source $DWM/statusbar/temp
            if [ "$_wallpaper" = 'r' ]; then
                feh --randomize --bg-fill ~/Pictures/wallpaper/*
            else
                feh --randomize --bg-fill ~/Pictures/nwallpaper/*
            fi
            echo ' set wallpaper'
            echo ' open picture'
            echo ' update statusbar'
            [ "$(ps x | grep -v grep | grep 'start-clash')" ] && echo ' close clash' || echo ' open clash'
            [ "$(ps aux | grep picom | grep -v 'grep\|rofi\|nvim')" ] && echo ' close picom' || echo ' open picom'
            ;;
        ' open picture')
            # coproc (feh -A "ln -s %F /home/fan/Pictures/wallpaper/%N"  -S mtime -Z -.  --cache-size 1024MiB  ~/Pictures/Sankaku/)
            # coproc (feh -A "ln -s %F /home/fan/Pictures/wallpaper/%N" -Z -.  --cache-size 1024MiB  ~/Pictures/Sankaku/)
            # coproc (feh -A "ln -s %F /home/fan/Pictures/wallpaper/%N" --randomize -Z -.  --cache-size 1024MiB  ~/Pictures/Sankaku/)
            echo rand
            echo time
            echo refresh
            ;;
        'time')
            coproc (feh -f "/home/fan/time" --edit -A "ln -f %F /home/fan/Pictures/wallpaper/%N" --action1 "ln -f %F /home/fan/Pictures/nwallpaper/%N" --action5 "adb push %F /sdcard/Pictures/sankaku/"  --action9 "feh --bg-fill %F" -Z -.  -cache-size 1024MiB)
            ;;
        'rand')
            coproc (feh --edit -A "ln -f %F /home/fan/Pictures/wallpaper/%N" --action1 "ln -f %F /home/fan/Pictures/nwallpaper/%N" --action5 "adb push %F /sdcard/Pictures/sankaku/"  --action9 "feh --bg-fill %F" --randomize -Z -.  --cache-size 1024MiB  ~/Pictures/Sankaku/)
            ;;
        'refresh')
            rm -rf /home/fan/time
            coproc (feh -f "/home/fan/time" --edit -A "ln -f %F /home/fan/Pictures/wallpaper/%N" --action1 "ln -f %F /home/fan/Pictures/nwallpaper/%N" --action5 "adb push %F /sdcard/Pictures/sankaku/"  --action9 "feh --bg-fill %F"  -Z -. -S mtime  --cache-size 1024MiB ~/Pictures/Sankaku/)
            ;;
        ' update statusbar')
            coproc ($DWM/statusbar/statusbar.sh updateall > /dev/null 2>&1)
            ;;
        ' open clash')
            echo ikuuu
            echo ajia
            echo gla
            ;;
        'ikuuu')
            # $HOME/.config/clash/proxy.sh start
            coproc ($HOME/.config/clash/start-clash.sh ikuuu > /dev/null 2>&1)
            $DWM/statusbar/statusbar.sh updateall
            ;;
        'ajia')
            # $HOME/.config/clash/proxy.sh start
            coproc ($HOME/.config/clash/start-clash.sh ajia > /dev/null 2>&1)
            $DWM/statusbar/statusbar.sh updateall
            ;;
        'gla')
            # $HOME/.config/clash/proxy.sh start
            coproc ($HOME/.config/clash/start-clash.sh gla > /dev/null 2>&1)
            $DWM/statusbar/statusbar.sh updateall
            ;;
        ' close clash')
            # $HOME/.config/clash/proxy.sh stop
            $HOME/.config/clash/stop-clash.sh > /dev/null 2>&1
            $DWM/statusbar/statusbar.sh updateall > /dev/null
            ;;
        ' open picom')
            coproc (picom  --config ~/scripts/config/picom.conf > /dev/null 2>&1)
            ;;
        ' close picom')
            killall picom
            ;;
    "")
        # echo ' set wallpaper'
        [ "$(ps x | grep -v grep | grep 'start-clash')" ] && echo ' close clash' || echo ' open clash'
        echo ' open picture'
        echo ' update statusbar'
        [ "$(ps aux | grep picom | grep -v 'grep\|rofi\|nvim')" ] && echo ' close picom' || echo ' open picom'
        ;;
esac
