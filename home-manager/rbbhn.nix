{ username, ... }: {
  imports = [
    ./${username}

    ./discord.nix
    ./minecraft.nix
  ];
}
