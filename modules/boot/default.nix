{  pkgs, ... }: {
  imports = [
    ./displaymanager.nix
    ./efi.nix
    ./loader.nix
    ./initrd.nix
    ./kernelParameters.nix
    ./plymouth.nix
  ];
}
