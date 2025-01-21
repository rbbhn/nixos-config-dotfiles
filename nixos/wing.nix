{ hostname, ... }: {
  imports = [
    ./${hostname}
    ./de-wms/plasma6.nix
  ];
}