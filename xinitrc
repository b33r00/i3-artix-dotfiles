userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $userresources ]; then
    xrdb -merge $userresources
fi

if [ -f $usermodmap ]; then
    xmodmap $usermodmap
fi

if [ -f "$sysmodmap" ]; then
    xmodmap "$sysmodmap"
fi


# Start runsvdir for user services
[ -z "$(pgrep -u $USER runsvdir)" ] && nohup runsvdir ~/runit/run > ~/.config/runit/runsvdir.log 2>&1 &
redshift &
dunst &
exec dbus-run-session i3 
