{ ... }: {
  services.displayManager.ly.enable = true;
  services.displayManager.ly.settings = {
    clock = "%H:%M, %d %B, %Y";
  };
}
