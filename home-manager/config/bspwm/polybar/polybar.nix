{ pkgs, ... }:
{
  services.polybar = {
    enable = true;
    package = pkgs.polybar;
    script = "polybar bar top";
    config = {
      "colors" = {
        background = "#1a1b26";
        background-alt = "#24283b";
        foreground = "#c0caf5";
        primary = "#e0af68";
        secondary = "#9ece6a";
        alert = "#db4b4b";
        disabled = "#414868";
        blue = "#7aa2f7";  
      };
      "bar/top" = {
        monitor = "\${env:MONITOR:eDP-1}";
        width = "100%";
        height = "3%";
        radius = 6;
        fixed-center = true;

        background = "1a1b26";
        foreground = "c0caf5";

        line-size = "3pt";
        border-size = "1pt";
        border-color = "1a1b26";
        border-radius = 0;
        padding-left = 0;
        padding-right = 0;

        cursor-click = "pointer";
        cursor-scroll = "ns-resize";

        enable-ipc = true;
        wm-restack = "bspwm";
        
        modules-left = "";
        modules-center = "";
        modules-right = "battery";
       
      };
    };
    settings = {
      "module/battery" = {
        type = "internal/battery";
        full-at = 99;
        low-at = 20;
        battery = "BATT";
        adapter = "ACAD";
        poll-interval = 2;

        time-format = "%H:%M";

        format-charging = "<animation-charging> <label-charging>";
        label-charging = "%percentage%%";
        animation-charging-0 = "";
        animation-charging-1 = "";
        animation-charging-2 = "";
        animation-charging-3 = "";
        animation-charging-4 = "";
        animation-charging-framerate = 750;
        
        format-discharging = "<ramp-capacity> <label-discharging>";
        label-discharging = "%percentage%%";
        ramp-capacity-0 = "";
        ramp-capacity-1 = "";
        ramp-capacity-2 = "";
        ramp-capacity-3 = "";
        ramp-capacity-4 = "";
      };  



    };
    extraConfig = 
      ''
      font-0 = Sofia Pro:style=Bold:size=13;3
      font-1 = Material Design Icons Desktop:size=16;3
      font-2 = Material Design Icons Desktop:size=20;5
      font-3 = JetBrainsMono Nerd Font:size=27;6
      font-4 = JetBrainsMono Nerd Font:size=17;5
      font-5 = JetBrainsMono Nerd Font:size=16;4
      font-6 = Material Design Icons Desktop:size=16;4
      font-7 = Sofia Pro:style=Bold:size=18;0
      font-8 = Material Design Icons Desktop:size=18;4
      font-9 = Feather:style=Bold:size=18;6
      font-10 = Material Design Icons Desktop:size=20:style=bold;5
      font-11 = Sofia Pro:style=Bold:size=14;3
      font-12 = Material Design Icons Desktop:size=14;3
      font-13 = JetBrainsMono Nerd Font:size=14;4
      font-14 = Grid Styles:size=18;4

      [settings]
      screenchange-reload = true
      pseudo-transparency = true
      '';
  };
}