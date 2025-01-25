{ hostname, username, ... }: {
  imports = [
    ./common
    ./${hostname}.nix
    ./${username}.nix
  ];
}
