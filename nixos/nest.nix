{ hostname, ... }: {
  imports = [
    ./${hostname}
  ];
}