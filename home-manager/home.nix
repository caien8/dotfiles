{ config, pkgs, ... }:
{
	imports = [
		./modules/themes
		./modules/apps
		./config/hyprland
	];

	services = {
		udiskie = {
			enable = true;
	    	automount = true;
	    	notify = true;
	    	tray = "auto";
	  	};
	};

	home.file = {};	
	home.username = "caien";
	home.homeDirectory = "/home/caien";
	home.sessionVariables = {
		EDITOR = "nvim";
		TERMINAL = "kitty";
		XCURSOR_THEME = "Bibata-Modern-Classic";
	};
	home.packages = with pkgs; [
		bat
		gotop
		brightnessctl
		brave
		htop
		tree
		vscodium
		#librewolf
		cava
		glava
		xfce.thunar
		dunst
		feh
		flameshot
		#polybar
		#rofi
		pavucontrol
		polkit
		polkit-kde-agent
		networkmanagerapplet
		dmenu
		networkmanager_dmenu
		openjdk
		bluej
		hyprpaper
	];
	home.stateVersion = "23.11"; 
	programs.home-manager.enable = true;
}
