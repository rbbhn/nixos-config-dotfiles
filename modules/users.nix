{  pkgs, inputs, ... }: {
  users.users.rbbhn = { # Define my user account
    isNormalUser = true;
    description = "Matthew M";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
  };
  outputs = {pkgs, inputs.home-manager, ...}@inputs: {
    inputs.home-manager.nixosModules.home-manager { # Define my user home-manager config
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.rbbhn = import ./home/rbhhn;
    };
  };
}
