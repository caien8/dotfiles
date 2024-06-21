{pkgs, ...}:
{
  xsession.windowManager.bspwm = {
    enable = true;
    #package = pkgs.bspwm-unstable;

    startupPrograms = [
      # sxhkd  keys
      "pgrep -x sxhkd > /dev/null || sxhkd"  
      # polybar
      "polybar"            
      # compositor                   
      "picom"
      # Display resolution                               
      "xrandr --output Virtual-1 --mode 1920x1080" 
      # wallpapers
      "DISPLAY=:0 feh --bg-scale --randomize ~/Pictures/walls/*"  
      # polkit authentication agent 
      "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
      # cursor
      "xsetroot -cursor_name left_ptr"
      # network applet
      "nm-applet --indicator"
    ];

    monitors = {
      eDP-1 = ["1" "2" "3" "4" "5" ];
      #Virtual-1 = ["1" "2" "3" "4" "5"];
    };

    settings = {
      border_width = 3;
      window_gap = 8;
      border_radius = 15;

      normal_border_color = "c0caf5";
      active_border_color = "24283b";
      focused_border_color = "1a1b26";

      split_ratio = 0.52;
      borderless_monocle = true;
      gapless_monocle = true;
      pointer_follows_focus = true;
      focus_follows_pointer = true;
    };

    rules = {
      "Peek" = {
        state = "floating";
      };
      "Plank" = {
        manage = false;
        border = false;
        locked = true;
        focus = false;
        follow = false;
        layer = "above";
      };
      "Kupfer.py" = {
        focus = true;
      };
      "Gimp" = {
        desktop = "^8";
        state = "floating";
        follow = true;
      };
      "Screenkey" = {
        manage = false;
      };
      "Rofi" = {
        state = "floating";
      };
      "GLava" = { 
        state = "floating"; 
        layer = "below"; 
        sticky = true; 
        locked = true; 
        border = false;
        focus = false; 
        center = true; 
        follow = false;
        rectangle = "1920x1080+0+0";
      };
    };
  #extraConfig = {};
  };
}
