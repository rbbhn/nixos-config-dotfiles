{ ... }: {
  boot.initrd.luks.devices."luks-ef9df4c6-1d01-40e9-a50f-37188dfe9655".device = "/dev/disk/by-uuid/ef9df4c6-1d01-40e9-a50f-37188dfe9655"; # Mount LUKS devices - hardware specific
}
