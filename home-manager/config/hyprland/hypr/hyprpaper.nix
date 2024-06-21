{ pkgs, ... }:
{
  services.hyprpaper = {
    enable = true;
    package = pkgs.hyprpaper;
    settings = {
      ipc = "off";
      #splash = false;
      #splash_offset = 2.0;
      #preload = [ "/home/caien/.config/hypr/wallpaper/apex_octane.jpg" ];
      wallpaper = [ "eDP-1, contain:/home/caien/.config/hypr/wallpaper/apex_octane.jpg" ];
    
    };

  };
}