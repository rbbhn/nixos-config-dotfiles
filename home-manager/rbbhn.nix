{ username, ... }: {
  imports = [
    ./minecraft.nix

    ./${username}/fastfetch-config.nix
    ./${username}/firefox-config.nix
  ];
}
