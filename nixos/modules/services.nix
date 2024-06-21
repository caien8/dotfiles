{ pkgs, ...}:
{
  # XSERVER
  services.xserver = {
    enable = true;
    xkb.layout = "us";
  };

  # DESKTOP MANAGER
  #services.desktopManager.plasma6.enable = true;
  #services.xserver.desktopManager.plasma5.enable = true;

  # Hyprland
  programs.hyprland.enable = true;

  # DISPLAY MANAGER
  # services.xserver.displayManager.sddm = {
  #  enable = true;
  #  wayland.enable = true;
  #  wayland.compositor = "kwin";
    # theme = "chili";
    # settings.Theme = {
    #  Current = "sddm-sugar-candy";
    #  ThemeDir = "/sddmt";
    #};
  #};

  # UDISKS2
  services.udisks2.enable = true;
  services.udisks2.mountOnMedia = true;
  services.udisks2.settings = {
    "udisks2.conf" = {
      defaults.encryption = "luks2";
      udisks2.modules = [ "*" ];
      udisks2.modules_load_preference = "ondemand";
    };
  };

  # Enable CUPS
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.brlaser ];  # Brother printer driver
  
  # Mount, trash, other functionalities
  services.gvfs.enable = true;

  # Enable Sound
  sound.enable = true;
  hardware = {
    pulseaudio.enable = true;
    # Video Support
    opengl = {
      enable = true;
      driSupport32Bit = true;
      driSupport = true;
    };
    # Crypto wallet
    # ledger.enable = true;
  };

}
