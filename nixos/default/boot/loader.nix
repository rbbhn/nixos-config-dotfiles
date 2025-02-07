{  pkgs, ... }: {
  boot.loader = {
    systemd-boot.enable = false; # Disable systemd-boot
    grub = { # Enable GRUB
      enable = true;
      device = "nodev";
      useOSProber = true;
      efiSupport = true;
      configurationLimit = 4; # Prevent /boot from filling and locking up the system from building
    };
  };
}
