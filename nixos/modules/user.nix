{ config, pkgs, ... }:

{
    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.caien = {
        isNormalUser = true;
        description = "caien";
        extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
        packages = with pkgs; [];
    };

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
        neovim 
        wget
        kitty 
        git
        udisks2
        nix-prefetch-git
        #home-manager
        home-manager
        # virtualization
        qemu
        qemu_kvm
        libvirt
        virt-manager
        virt-viewer        # A viewer for remote virtual machines
        dnsmasq            # An integrated DNS, DHCP and TFTP server for small networks
        vde2               # Virtual Distributed Ethernet, an Ethernet compliant virtual network
        bridge-utils       # An userspace tool to configure linux bridges 
        libguestfs         # Tools for accessing and modifying virtual machine disk images
    ];


    programs.dconf.enable = true;
    #nixpkgs.config.allowUnfree = true;

    # VIRTUALIZATION
    virtualisation.libvirtd.enable = true;

    #virtualisation.virtualbox.host.enable = true;
    #virtualisation.virtualbox.host.enableExtensionPack = true;
    #virtualisation.virtualbox.guest.enable = true;

}
