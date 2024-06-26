{
  services.sxhkd = {
    enable = true;
    keybindings = {
      #! APPS
      "super + Return" = "kitty";
      "super + w" = "brave";
      "super + f" = "thunar";
      "super + v" = "codium";
      "super + d" = "dmenu_run";
      "Print" = "flameshot screen --path /home/caien/Pictures/Screenshots";
      "super + Print" = "flameshot gui --path /home/caien/Pictures/Screenshots";
      "super + n" = "networkmanager_dmenu -l 9 -nf cyan -sb cyan -sf black";

      # program launcher
      "super + r" = "rofi -modi drun -show drun -line-padding 4 \
                -columns 2 -padding 50 -hide-scrollbar -terminal xfce4-terminal \
                ";

      #! KILL WINDOW
      "super + c" = "bspc node -{c,k}";
      #! RESTART SXHKD
      "super + Escape" = "pkill -USR1 -x sxhkd";
      #! RESTART/QUIT BSPWM
      "super + alt + {q,r}" = "bspc {quit,wm -r}";

      #! SWITCH LAYOUTS
      "super + Tab" = "bsp-layout next";
      "super + shift + Tab" = "bsp-layout previous";
      #! ALTERNATE LAYOUT MODES
      "super + m" = "bspc desktop -l next";
      # send the newest marked node to the newest preselected node
      "super + y" = "bspc node newest.marked.local -n newest.!automatic.local";
      # swap the current node and the biggest window
      "super + g" = "bspc node -s biggest.window";

      #! WINDOW STATES
      # set the window state
      "super + {t,shift + t,s,f}" = "bspc node -t {tiled,pseudo_tiled,floating,fullscreen";
      # set the node flags
      "super + ctrl + {m,x,y,z}" = "bspc node -g {marked,locked,sticky,private}";

      #! FOCUS/ SWAP
      # focus the node in the given direction
      "super + {_,shift + }{h,j,k,l}" = "bspc node -{f,s} {west,south,north,east}";
      
      # focus the node for the given path jump
      "super + {p,b,comma,period}" = "bspc node -f @{parent,brother,first,second}";
      
      # focus the next/previous window in the current desktop
      "super + {_,shift + }space" = "bspc node -f {next,prev}.local.!hidden.window";
      
      # focus the next/previous desktop in the current monitor
      "super + bracket{left,right}" = "bspc desktop -f {prev,next}.local";
      
      # focus the last node/desktop
      "super + {grave,Home}" = "bspc {node,desktop} -f last";
      
      # focus the older or newer node in the focus history
      "super + {o,i}" = "bspc wm -h off; \
      bspc node {older,newer} -f; \
      bspc wm -h on";
      
      # focus or send to the given desktop
      "super + {_,shift + }{1-9,0}" = "bspc {desktop -f,node -d} '^{1-9,10}'";

      #! PRESELECT
      # preselect the direction
      "super + ctrl + {h,j,k,l}" = "bspc node -p {west,south,north,east}";
      
      # preselect the ratio
      "super + ctrl + {1-9}" = "bspc node -o 0.{1-9}";
      
      # cancel the preselection for the focused node
      "super + ctrl + space" = "bspc node -p cancel";
      
      # cancel the preselection for the focused desktop
      "super + ctrl + shift + space" = "bspc query -N -d | xargs -I id -n 1 bspc node id -p cancel";

      #! MOVE/RESIZE
      # expand a window by moving one of its side outward
      "super + alt + {h,j,k,l}" = "bspc node -z {left -20 0,bottom 0 20,top 0 -20,right 20 0}";
      # contract a window by moving one of its side inward
      "super + alt + shift + {h,j,k,l}" = "bspc node -z {right -20 0,top 0 20,bottom 0 -20,left 20 0}";
      # move a floating window
      "super + {Left,Down,Up,Right}" = "bspc node -v {-20 0,0 20,0 -20,20 0}";

      #! Multimedia keys
      "XF86AudioRaiseVolume" = "amixer -q set Master 5%+ unmute";

      # Still multimedia
      "XF86AudioLowerVolume" = "amixer -q set Master 5%- unmute";

      # still
      "XF86AudioMute" = "amixer -D pulse sset Master toggle-mute";
  
      # amixer -q set Master toggle
      # Simple amixer command seems to have problems unmuting device

      # Brightness up
      "XF86MonBrightnessUp" = "brightnessctl set +5%";

      # And brightness down
      "XF86MonBrightnessDown" = "brightnessctl set 5%-";
    };
  };  
}