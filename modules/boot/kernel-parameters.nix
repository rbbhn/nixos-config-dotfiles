{  pkgs, ... }: {
  boot.kernelParams = [
    "quiet" # "Silent" booting
  ];
}
