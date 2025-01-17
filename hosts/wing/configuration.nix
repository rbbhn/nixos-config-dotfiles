{ config, pkgs, inputs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./../../modules
    inputs.nixos-hardware.nixosModules.framework-13-7040-amd
  ];

  boot.initrd.luks.devices."luks-ef9df4c6-1d01-40e9-a50f-37188dfe9655".device = "/dev/disk/by-uuid/ef9df4c6-1d01-40e9-a50f-37188dfe9655"; # Mount LUKS devices - hardware specific
  services.fwupd.enable = true; # Enable Framework BIOS updates
  hardware.framework.amd-7040.preventWakeOnAC = true; # Framework 13 wake fix
  #boot.extraModprobeConfig = "options snd-hda-intel model=dell-headset-multi"; # This was supposed to fix the issues with mic input thru the 3.5mm jack... It did not.











  # Install apps
  programs.firefox.enable = true;
  programs.steam.enable = true;

  # Enable KDE Plasma Desktop Environment
  services.desktopManager.plasma6.enable = true;
}
