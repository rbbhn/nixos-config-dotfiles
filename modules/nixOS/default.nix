{  pkgs, ... }: {
  imports = [
    ./boot
    ./internationalization.nix
    ./networking.nix
    ./user.nix
  ];
}
