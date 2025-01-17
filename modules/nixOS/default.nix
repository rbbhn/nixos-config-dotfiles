{  pkgs, ... }: {
  imports = [
    ./audio.nix
    ./bluetooth.nix
    ./boot
    ./dynamiclibraries.nix
    ./fonts.nix
    ./internationalization.nix
    ./keymap.nix
    ./networking.nix
    ./nixox.nix
    ./nixpkgs.nix
    ./printing.nix
    ./ssh.nix
    ./users.nix
  ];
}
