{  pkgs, ... }: {
  boot.loader.systemd-boot.enable = false; # Disable systemd-boot
  boot.loader.grub = { # Enable GRUB
    enable = true;
    device = "nodev";
    useOSProber = true;
    efiSupport = true;
  };
}
