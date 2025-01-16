{  pkgs, ... }: {
  imports = [
    ./efi.nix
    ./grub.nix
    ./initrd.nix
    ./kernelParameters.nix
    ./plymouth.nix
  ];
}
