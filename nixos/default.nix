{ hostname, ... }: {
  imports = [
    ./${hostname}.nix # Import machine specific modules. Done this way so that hostname.nix can import modules that are the same between hosts that not all hosts have, and /hostname/default.nix can import modules that are unique to each host.

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
