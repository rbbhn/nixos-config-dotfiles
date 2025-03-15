{ ... }: {
  boot.initrd.luks.devices."luks-6d1865d9-5d49-46ca-b800-879679d08552".device = "/dev/disk/by-uuid/6d1865d9-5d49-46ca-b800-879679d08552"; # Mount LUKS devices - hardware specific
}
