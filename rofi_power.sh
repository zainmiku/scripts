case $(echo -e '󰤄 睡眠\n 关机\n 重启\n 休眠' | rofi -dmenu -window-title power) in
    "󰤄 睡眠") systemctl suspend ;;
    " 关机") poweroff ;;
    " 重启") reboot ;;
    " 休眠") systemctl hibernate ;;
esac
