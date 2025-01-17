{  pkgs, ... }: {
  imports = [
    ./audio.nix
    ./boot
    ./internationalization.nix
    ./networking.nix
    ./users.nix
  ];
}
