{ username, ... }: {
  imports = [
    ./discord.nix
    ./minecraft.nix

    ./${username}/fastfetch-config.nix
    ./${username}/firefox-config.nix
  ];
}
