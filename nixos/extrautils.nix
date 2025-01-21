{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # These packages remain UNCONFIGURED - if needed, configure with home-manager
    git
    wget
  ];
}
