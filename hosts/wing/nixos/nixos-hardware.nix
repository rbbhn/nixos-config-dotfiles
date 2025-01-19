{ nixos-hardware, ... }: {
  imports = [
    nixos-hardware.nixosModules.framework-13-7040-amd
  ];

  services.fwupd.enable = true; # Enable Framework BIOS updates
  hardware.framework.amd-7040.preventWakeOnAC = true; # Framework 13 wake fix
  #boot.extraModprobeConfig = "options snd-hda-intel model=dell-headset-multi"; # This was supposed to fix the issues with mic input thru the 3.5mm jack... It did not.
}
