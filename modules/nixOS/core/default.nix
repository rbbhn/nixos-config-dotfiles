{  pkgs, ... }: {
  imports = [
    ./boot
    ./internationalization.nix
    ./network.nix
    ./user.nix
  ];
}
