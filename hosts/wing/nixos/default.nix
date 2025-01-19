{ ... }: {
  imports = [
    ./hardware-configuration.nix
    ./hardware.nix
    ./luks.nix
  ];

  # Install apps
  programs.firefox.enable = true;
  programs.steam.enable = true;

  # Enable KDE Plasma Desktop Environment
  services.desktopManager.plasma6.enable = true;
}
