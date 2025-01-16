{  pkgs, ... }: {
  boot.loader.efi = {
    canTouchEfiVariables = true;
    efiSysMountPoint = "/boot"; # EFI stub mount point
  };
}
