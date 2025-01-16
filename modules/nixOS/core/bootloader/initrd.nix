{  pkgs, ... }: {
  boot.initrd = {
    enable = true;
    systemd.enable = true;
  };
}
