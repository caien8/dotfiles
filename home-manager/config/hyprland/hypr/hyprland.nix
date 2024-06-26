{
	wayland.windowManager.hyprland = {
		enable = true;
		#package = ;
		#pluigns = [];
		settings = {
			#* MONITOR	
			monitor = "eDP-1,1920x1080,0x0,1";

			#* EXECUTABLES
			exec-once = [
				"waybar"
				"hyprpaper"
				"udiskie"
				"polkit-agent-helper-1"
				"/usr/lib/polkit-kde-authentication-agent-1"
				"/home/caien/.config/hypr/autostart.sh"
				"wl-paste --type text --watch cliphist store" #Stores only text data
				"wl-paste --type image --watch cliphist store" #Stores only image data
				"wl-clip-persist --clipboard both"
			];

			#* ENV
			env = [ 
				"XCURSOR_SIZE,26" 
			];

			#* unscale XWayland
			#xwayland = {
			#  	force_zero_scaling = true;
			#};

			#* DECORATION
			decoration = {
				#* WINDOW
				rounding = 10;
				active_opacity = 1; # opacity of active windows  #! never set to 0
    			inactive_opacity = 0.93; # opacity of inactive windows 
				 #* SHADOW
    			drop_shadow = "no";
    			shadow_range = 4;
    			shadow_render_power = 3;
    			"col.shadow" = "rgba(1a1a1aee)";
    			#* DIM
    			dim_inactive = false;  # enables dimming of inactive windows
    			dim_strength = 0.3;  # how much inactive windows should be dimmed [0.0 - 1.0] #! never set to 1
				#* Blur
				blur = {
    			    enabled = false;    # enable kawase window background blur	
    			    size = 5;          # blur size
    			    passes = 1;        # the amount of passes to perform	
    			};
			};

			#* ANIMATIONS
			animations = {
			    enabled = "yes";
			    bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
				animation = [
			    	"windows, 1, 7, myBezier"
			    	"windowsOut, 1, 7, default, popin 80%"
			    	"border, 1, 10, default"
			    	"borderangle, 1, 8, default"
			    	"fade, 1, 7, default"
			    	"workspaces, 1, 6, default"
				];
			};

			#* MISC
			misc = {
			    force_default_wallpaper = 0; # Set to 0 to disable the anime mascot wallpapers
			    disable_autoreload = true;  # disable the autoreload on save   
				vfr = true;
			};

			#* GENERAL
			general = {
			    border_size = 2;   # size of the border around windows
			    gaps_in = 3;       # gaps between window
			    gaps_out = 5;      # gaps between windows and monitor edges
			    "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";   # active border color
			    "col.inactive_border" = "rgba(595959aa)";                      # inactive border color
			    layout = "dwindle"; 
			    cursor_inactive_timeout = 10;                              # in seconds, after how many seconds of cursor’s inactivity to hide it
			    allow_tearing = false;
			};
			dwindle = {
			    pseudotile = "yes"; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
			    preserve_split = "yes"; # you probably want this
			};
			master = {
			    new_is_master = true;
			};


			#* INPUT
			input = {
			    kb_layout = "us";
			    follow_mouse = 1;
			    touchpad = {
			        natural_scroll = "no";
			    };
			    sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
			};
			gestures = {
			    workspace_swipe = "on";
			    workspace_swipe_fingers = 3;
			    workspace_swipe_distance = 300;
			    workspace_swipe_invert = true;
			};


			#* VARIABLES
			"$mainMod" = "SUPER";

      		#* KEYBINDS
  			bind = [
				# APPS
				"$mainMod, Return, exec, kitty"
				"$mainMod, W, exec, brave "
				"$mainMod, f, exec, thunar "
				"$mainMod, R, exec, wofi --show drun"
				"$mainMod, D, exec, dmenu_run"
				"$mainMod, V, exec, cliphist list | wofi --dmenu | cliphist decode | wl-copy"
				#"Print, exec, flameshot screen --path /home/caien/Pictures/Screenshots"
				#"$mainMod, Print, exec, flameshot gui --path /home/caien/Pictures/Screenshots"
				"$mainMod, n, exec, networkmanager_dmenu -l 9 -nf cyan -sb cyan -sf black"
				
				"$mainMod, C, killactive, "
				"$mainMod SHIFT, r, exec, hyprctl reload"
				"$mainMod SHIFT, q, exit, "

				"$mainMod, m, togglefloating, "

				"$mainMod, P, pseudo, # dwindle"
				"$mainMod, J, togglesplit, # dwindle"
				
				# Move focus with mainMod + arrow keys
				"$mainMod, left, movefocus, l"
				"$mainMod, right, movefocus, r"
				"$mainMod, up, movefocus, u"
				"$mainMod, down, movefocus, d"
				
				# Switch workspaces with mainMod + [0-9]
				"$mainMod, 1, workspace, 1"
				"$mainMod, 2, workspace, 2"
				"$mainMod, 3, workspace, 3"
				"$mainMod, 4, workspace, 4"
				"$mainMod, 5, workspace, 5"
				"$mainMod, 6, workspace, 6"
				"$mainMod, 7, workspace, 7"
				"$mainMod, 8, workspace, 8"
				"$mainMod, 9, workspace, 9"
				"$mainMod, 0, workspace, 10"
				
				# Move active window to a workspace with mainMod + SHIFT + [0-9]"
				"$mainMod SHIFT, 1, movetoworkspace, 1"
				"$mainMod SHIFT, 2, movetoworkspace, 2"
				"$mainMod SHIFT, 3, movetoworkspace, 3"
				"$mainMod SHIFT, 4, movetoworkspace, 4"
				"$mainMod SHIFT, 5, movetoworkspace, 5"
				"$mainMod SHIFT, 6, movetoworkspace, 6"
				"$mainMod SHIFT, 7, movetoworkspace, 7"
				"$mainMod SHIFT, 8, movetoworkspace, 8"
				"$mainMod SHIFT, 9, movetoworkspace, 9"
				"$mainMod SHIFT, 0, movetoworkspace, 10"

				# Example special workspace (scratchpad)
				"$mainMod, S, togglespecialworkspace, magic"
				"$mainMod SHIFT, S, movetoworkspace, special:magic"
				
				# Scroll through existing workspaces with mainMod + scroll"
				"$mainMod, mouse_down, workspace, e+1"
				"$mainMod, mouse_up, workspace, e-1"
				
				# BRIGHTNESS
				",XF86MonBrightnessDown, exec, brightnessctl set 3%-  # BRIGHTNESS"
				",XF86MonBrightnessUp, exec, brightnessctl set +3%    # BRIGHTNESS"
				
				# VOLUME
				",XF86AudioMute, exec, pactl set-sink-mute 0 toggle        # MUTE VOLUME"
				# Microphone
				"$mainMod, XF86AudioMute, exec, amixer -q set Capture mute toggle   # Microphone"
  			];

			binde = [
				# Volume
				",XF86AudioLowerVolume, exec, amixer -q set Master 3%- unmute   			# LOWER VOLUME"
				",XF86AudioRaiseVolume, exec, amixer -q set Master 3%+ unmute   			# RAISE VOLUME"
				# Microphone
				"$mainMod, XF86AudioLowerVolume, exec, amixer -q set Capture 3%- unmute"
				"$mainMod, XF86AudioRaiseVolume, exec, amixer -q set Capture 3%+ unmute"
			];

			bindm = [
				# Move/resize windows with mainMod + LMB/RMB and dragging
				"$mainMod, mouse:272, movewindow"
				"$mainMod, mouse:273, resizewindow"
			];
		};
	};
}