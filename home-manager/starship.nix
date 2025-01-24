{ username, ... }: {
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };
  programs.fish.enable = true;
  programs.fish.shellInitLast = "echo KYS";

  imports = [
    ./${username}/starship-config.nix
  ];
}
