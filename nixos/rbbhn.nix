{ username, ... }: {
  imports = [
    ./programs/de-wms/plasma6.nix
    ./programs/steam.nix
    ./programs/fastfetch.nix
    ./${username}/fastfetch-config.nix
  ];
}
