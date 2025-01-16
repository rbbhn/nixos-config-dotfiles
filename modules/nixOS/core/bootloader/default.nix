{  pkgs, ... }: {
  imports = [
      grub.nix
      efi.nix
      initrd.nix
      kernelParameters.nix
  ];
}
