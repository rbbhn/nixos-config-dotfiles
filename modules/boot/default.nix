{  pkgs, ... }: {
  imports = [
    ./display-manager.nix
    ./efi.nix
    ./loader.nix
    ./initrd.nix
    ./kernel-parameters.nix
    ./plymouth.nix
  ];
}
