{ username, ... }: {
  imports = [
    ./discord.nix
    ./fastfetch.nix
    ./minecraft.nix
    # ./starship.nix
  ];
}
