{ pkgs, ...}:
{
  programs.bash = {
    enable = true;
    historySize = 10000;
    shellAliases = {
      ls = "ls --color=tty";
      ll = "ls -l";
      l = "ls -alh";
      fr = "find / -name ";
      nv = "nvim";
      snv = "sudo nvim";
      hm = "home-manager switch";
      nx = "nix-shell -p ";
      nxe = "nix-env -iA ";
      nxu = "nix-env --uninstall ";
      nrs = "nixos-rebuild switch";
      snrs = "sudo nixos-rebuild switch --upgrade";
      ngc = "nix-collect-garbage";
      nd = "sudo nix-collect-garbage -d";
    };
    enableCompletion = true;
    bashrcExtra = "
    bind 'set show-all-if-ambiguous on'
    bind 'TAB:menu-complete'
    ";
  };
}