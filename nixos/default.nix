{ hostname, ... }: {
  imports = [
    ./${hostname}.nix # Import machine-specific modules

    ./audio.nix
    ./bluetooth.nix
    ./boot
    ./customization
    ./internationalization.nix
    ./keymap.nix
    ./networking.nix
    ./nix
    ./printing.nix
    ./shell.nix
    ./ssh.nix
    ./user.nix
  ];
}
