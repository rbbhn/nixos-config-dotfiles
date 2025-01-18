{ ... }: {
  services.displayManager.ly.enable = true;

  services.displayManager.ly.config = {
    clock = "%H:%M, %d %B, %Y";
  };
}
