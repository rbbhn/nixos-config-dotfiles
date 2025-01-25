{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # These packages remain UNCONFIGURED - if needed, separate into modules and configure.
    git
    wget
  ];
}
