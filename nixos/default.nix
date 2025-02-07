{ hostname, username, ... }: {
  imports = [
    ./default
    ./${hostname}.nix
    ./${username}.nix
  ];
}
