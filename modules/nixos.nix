{  pkgs, ... }: {
  system.stateVersion = "24.11"; # Do NOT change (unless self-sabatoge will actually going to help somehow)
  nix.settings.experimental-features = [ "nix-command" "flakes" ]; # Enable Flakes & accompanying new nix command-line tool
}
