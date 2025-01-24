{ username, ... }: {
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };;

  imports = [
    ${username}.starship-config.nix
  ];
}
