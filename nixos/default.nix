{ hostname, username, ... }: {
  imports = [
    ./${hostname}.nix
    ./${username}.nix
    ./common
  ];
}
