{ hostname, ... }: {
  networking.hostName = "${hostname}"; # Set hostname
  networking.networkmanager.enable = true; # Enable networking
}
