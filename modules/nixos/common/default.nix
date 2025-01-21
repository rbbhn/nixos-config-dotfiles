{ username, ... }: {
  imports = [
    ./audio.nix
    ./bluetooth.nix
    ./boot
    ./dynamic-libraries.nix
    ./extrautils.nix
    ./fonts.nix
    ./internationalization.nix
    ./keymap.nix
    ./networking.nix
    ./nixos.nix
    ./nixpkgs.nix
    ./printing.nix
    ./shell.nix
    ./ssh.nix
    ./stylix.nix
    ./user.nix
  ];
}
