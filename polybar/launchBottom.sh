# Terminate already running bar instances
killall -q polybar

# Wait until processes have been shutdown
while pgrep -u $UID -x polybar >/dev/null ; do sleep 1 ; done

# Launch bar
polybar bottom -r
