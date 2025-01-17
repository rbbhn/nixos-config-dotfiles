{  pkgs, ... }: {
  boot.loader = {
    systemd-boot.enable = false; # Disable systemd-boot
    grub = { # Enable GRUB
      enable = true;
      device = "nodev";
      useOSProber = true;
      efiSupport = true;
    };
    timeout = 0; # Prevent OS choice from appearing (unless key is pressed)
  };
}
