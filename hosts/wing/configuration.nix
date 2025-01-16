{ config, pkgs, inputs, ... }:

{
  # =============================================
  # Basic System Configuration
  # =============================================

  imports = [
    ./hardware-configuration.nix
    inputs.nixos-hardware.nixosModules.framework-13-7040-amd
  ];
  
  
  boot = {
    loader = {
      systemd-boot.enable = false; # Disable systemd-boot
      grub = { # Enable GRUB
        enable = true;
        device = "nodev";
        useOSProber = true;
        efiSupport = true;
      };
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot";
    };
    initrd.enable = true;
    initrd.systemd.enable = true;
    initrd.luks.devices."luks-ef9df4c6-1d01-40e9-a50f-37188dfe9655".device = "/dev/disk/by-uuid/ef9df4c6-1d01-40e9-a50f-37188dfe9655"; # Encrypted disk..
    kernelParams = [ "quiet" ]; # "Silent" booting
    plymouth.enable = true; # Enable Plymouth
  };

  networking.hostName = "wing"; # Set hostname
  networking.networkmanager.enable = true; # Enable networking
  time.timeZone = "America/Chicago"; # Set timezone
  i18n.defaultLocale = "en_US.UTF-8"; # Set locale

  # Framework 13 specific hardware fixes
  hardware.framework.amd-7040.preventWakeOnAC = true;
  #boot.extraModprobeConfig = "options snd-hda-intel model=dell-headset-multi"; # This was supposed to fix the issues with mic input thru the 3.5mm jack... It did not.

  # Define my user account
  users.users.rbbhn = {
    isNormalUser = true;
    description = "Matthew M";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
  };



  # =============================================
  # Packages, Apps, Fonts, and Dynamic Libraries
  # =============================================

  # Install packages
  environment.systemPackages = with pkgs; [
    plymouth
    catppuccin-plymouth
    kdePackages.kate
    (discord.override { withVencord = true; withOpenASAR = true; })
    prismlauncher
    spotify
    keepassxc
    vlc
    git
    wget
    openjdk
    inputs.ghostty.packages.x86_64-linux.default
    fastfetch
    gh
  ];

  # Install apps
  programs.firefox.enable = true;
  programs.steam.enable = true;
  programs.fish.enable = true;

  # Include fonts
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Terminus" ]; })
  ];

  # Include dynamically linked executables (for running "impure" programs with minimal hassle)
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add missing dynamic libraries for unpackaged programs here, not in environment.systemPackages
  ];



  # =============================================
  # Services
  # =============================================

  services.xserver.xkb.layout = "us"; # Configure keymap (X11)
  services.printing.enable = true; # Enable printing
  hardware.bluetooth.enable = true; # Enable Bluetooth
  services.openssh.enable = true; # Enable the OpenSSH daemon
  services.fwupd.enable = true; # Enable Framework BIOS updates

  # Firewall
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];

  # Enable KDE Plasma Desktop Environment & SDDM
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Enable audio with pipewire
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true; # If you want to use JACK applications, uncomment this
  };



  # =============================================
  # Nix and NixOS Configuration
  # =============================================

  system.stateVersion = "24.11"; # Do NOT change (unless self-sabatoge will actually going to help somehow)
  nix.settings.experimental-features = [ "nix-command" "flakes" ]; # Enable Flakes & accompanying new nix command-line tool
  nixpkgs.config.allowUnfree = true; # Allow unfree packages

}
