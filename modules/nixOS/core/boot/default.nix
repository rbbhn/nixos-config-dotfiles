{  pkgs, ... }: {
  imports = [
    ./efi.nix
    ./loader.nix
    ./initrd.nix
    ./kernelParameters.nix
    ./plymouth.nix
  ];
}
