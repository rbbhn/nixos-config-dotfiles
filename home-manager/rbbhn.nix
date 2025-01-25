{ username, ... }: {
  imports = [
    ./discord.nix
    ./minecraft.nix
    ./starship.nix
  ];
}
