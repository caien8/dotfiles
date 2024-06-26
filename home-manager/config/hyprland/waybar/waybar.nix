{ pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        fixed-center = "true";

        #mode = "hide";
        #start_hidden = true;
        #modifier = "Mod4";
        #modifier-reset = "press";
        #id = "bar-0";
        #ipc = true;
        reload_style_on_change = true;

        modules-left = [ "custom/l_end" "cpu" "custom/padd" "memory" "custom/r_end" "custom/l_end" "hyprland/workspaces" "custom/r_end" ];
        modules-center = [ "custom/l_end" "clock" "custom/r_end" ];
        modules-right = [ "custom/l_end" "network" "custom/r_end" "custom/l_end" "group/utils" "custom/padd" "battery" "custom/r_end" ];

        #* LEFT MODULES
        "cpu" = {
          interval = 10;
          format = "󰍛 {usage}%";
          on-click = "kitty -e htop";
        }; 
        "memory" = {
          interval = 30;
          format = "󰾆 {percentage}%";
          format-alt = "󰾅 {used}GB";
          max-length = 10;
          tooltip = true;
          tooltip-format = " {used:0.1f}GB/{total:0.1f}GB";
          on-click-right = "kitty -e gotop";
        };
        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          on-click = "activate";
          on-scroll-up = "hyprctl dispatch workspace e-1";
          on-scroll-down = "hyprctl dispatch workspace e+1";
          #persistent_workspaces = {
          #    "1" = [];
          #    "2" = [];
          #    "3" = [];
          #    "4" = [];
          #    "5" = [];
          #    "6" = [];
          #    "7" = [];
          #    "8" = [];
          #    "9" = [];
          #    "10" = [];
          #};
        };

        #* CENTER MODULES
        "clock" = {
          format = "{: %I:%M %p 󰃭 %a %d}";
          format-alt = "{:󰥔 %H:%M  %b %Y}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
		  calendar = {
			    mode = "year";
			    mode-mon-col = 3;
			    weeks-pos = "right";
			    on-scroll = 1;
			    format = {
			        months =     "<span color='#cdd6f4'><b>{}</b></span>";
			        days =      "<span color='#cdd6f4'><b>{}</b></span>";
			        #weeks =      "<span color='#99ffdd'><b>W{}</b></span>";
			        weekdays =   "<span color='#a6adc8'><b>{}</b></span>";
			        today =      "<span color='#fc023c'><b>{}</b></span>";
			    };
        	};
			actions = {
                on-click-forward = "tz_up";
                on-click-right = "mode";
                on-click-backward = "tz_down";
                on-scroll-up = "shift_up";
                on-scroll-down = "shift_down";
            };
        };

        #* RIGHT MODULES
        "network" = {
          #interface = "wlp2*"; # (Optional) To force the use of this interface
          format-wifi = "󰤨 {signalStrength}%";
          format-alt = "󰤨 {essid}";
          format-ethernet = "󱘖 Wired";
          tooltip-format = "󱘖 {ipaddr}  {bandwidthUpBytes}  {bandwidthDownBytes}";
          format-linked = "󱘖 {ifname} (No IP)";
          format-disconnected = " Disconnected";
          
          interval = 5;
          on-click-right = "networkmanager_dmenu -l 9 -nf cyan -sb cyan -sf black";
        };
        #"custom/cliphist" = {
        #    format = "{}";
        #    exec = "echo ; echo 󰅇 clipboard history";
        #    on-click = "sleep 0.1 && ~/.config/waybar/scripts/cliphist.sh c ${mod_pos}";
        #    #on-click-right = "sleep 0.1 && ~/.config/waybar/scripts/cliphist.sh d";
        #    on-click-middle = "sleep 0.1 && ~/.config/waybar/scripts/cliphist.sh w ${mod_pos}";
        #    interval = 86400; # once every day
        #    tooltip = true;
        #};

		"group/utils" = {
			orientation = "horizontal";
      drawer = {
				transition-duration = 1000;
				transition-left-to-right = true;
			};
			modules = [
				"pulseaudio"
				"pulseaudio#microphone"
				"custom/padd"
				"backlight"
        "custom/padd"
			];
		};
        "backlight" = {
            format = "{icon} {percent}";
            format-icons = [ "" "" "" "" "" "" "" "" "" ];
            on-scroll-up = "brightnessctl set +1%";
            on-scroll-down = "brightnessctl set 1%-";
            interval = 2;
        };
        "pulseaudio" = {
            format = "{icon} {volume}";
            format-muted = "󰝟";
            on-click = "pavucontrol -t 3";
            on-click-middle = "pactl set-sink-mute 0 toggle";
            on-scroll-up = "amixer -q set Master 1%+ unmute";
            on-scroll-down = "amixer -q set Master 1%- unmute";
            tooltip-format = "{icon} {volume}%";
            scroll-step = 5;
            format-icons = {
                headphone = "";
                hands-free = "";
                headset = "";
                phone = "";
                portable = "";
                car = "";
                default = ["" "" ""];
            };
        };
    
        "pulseaudio#microphone" = {
            format = "{format_source}";
            format-source =  "  {volume}";
            format-source-muted = " ";
            on-click = "pavucontrol -t 4";
            on-click-middle = "amixer -q set Capture mute toggle";
            on-scroll-up = "amixer -q set Capture 1%+ unmute";
            on-scroll-down = "amixer -q set Capture 1%- unmute";
            tooltip-format = "{format_source}%";
            scroll-step = 5;
        };
    
        "battery" = {
            bat = "BATT";
            interval = 2;
            full-at = 95;
            states = {
                good = 80;
                critical = 20;
            };
            format = "{icon} {capacity}";
            format-charging = " {capacity}%";
            format-plugged = " {capacity}%";
            format-alt = "{time} {icon}";
            format-icons = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
        };

        #* CUSTOM MODULES
        "custom/l_end" = {
          format = " ";
          interval = "once";
          tooltip = false;
        };

        "custom/r_end" = {
          format = " ";
          interval = "once";
          tooltip = false;
        };
        "custom/padd" = {
          format = " ";
          interval = "once";
          tooltip = false;
        };

      };
    };
  };
}