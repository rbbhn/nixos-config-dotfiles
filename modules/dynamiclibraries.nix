{  pkgs, ... }: {
  # Include dynamically linked executables (for running "impure" programs with minimal hassle)
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add missing dynamic libraries for unpackaged programs here, not in environment.systemPackages
  ];
}
