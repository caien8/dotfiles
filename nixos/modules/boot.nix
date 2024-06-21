{ pkgs, ... }:
{
    # SYSTEMD-BOOT
    # boot.loader.systemd-boot.enable = true;
    # boot.loader.efi.canTouchEfiVariables = true;
  
    # GRUB
    boot.loader = { 
        efi.canTouchEfiVariables = true;
        efi.efiSysMountPoint = "/boot";
        grub = { 
            enable = true;
            devices = [ "nodev" ];
            efiSupport = true;
            useOSProber = true;
            theme = pkgs.stdenv.mkDerivation {
                pname = "distro-grub-themes";
                version = "3.1";
                src = pkgs.fetchFromGitHub {
                    owner = "AdisonCavani";
                    repo = "distro-grub-themes";
                    rev = "v3.1";
                    hash = "sha256-ZcoGbbOMDDwjLhsvs77C7G7vINQnprdfI37a9ccrmPs=";
                };
            installPhase = "cp -r customize/nixos $out";
            };
        };
    };

    # Virtual-Machine
    # boot.loader.grub.enable = true;
    # boot.loader.grub.device = "/dev/vda";
    # boot.loader.grub.useOSProber = true;
}
