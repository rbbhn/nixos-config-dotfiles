{ ... }: {
  home.packages = with pkgs; [
    prismlauncher
    openjdk
  ];
}
