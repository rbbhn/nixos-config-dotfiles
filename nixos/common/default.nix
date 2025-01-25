{ ... }: {
  imports = [
    ./audio.nix
    ./bluetooth.nix
    ./boot
    ./customization
    ./dynamic-libraries.nix
    ./fonts.nix
    ./extrautils.nix
    ./internationalization.nix
    ./keymap.nix
    ./networking.nix
    ./nix
    ./printing.nix
    ./shell.nix
    ./ssh.nix
    ./stylix.nix
    ./user.nix
  ];
}
