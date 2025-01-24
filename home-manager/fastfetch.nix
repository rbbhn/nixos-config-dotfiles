{ username, ... }: {
  programs.fastfetch = {
    enable = true;
  };

  imports = [
    ${username}.fastfetch-config.nix
  ];
}
