{  pkgs, ... }: {
  imports = [
    ./audio.nix
    ./bluetooth.nix
    ./boot
    ./dynamiclibraries.nix
    #./extrautils.nix
    ./fonts.nix
    ./internationalization.nix
    ./keymap.nix
    ./networking.nix
    ./nixox.nix
    ./nixpkgs.nix
    ./printing.nix
    ./shell.nix
    ./ssh.nix
    ./users.nix
  ];
}
