{  pkgs, ... }: {
  users.users.rbbhn = { # Define my user account
    isNormalUser = true;
    description = "Matthew M";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
  };
  inputs.home-manager.nixosModules.home-manager { # Define my user home-manager config
    home-manager.users.rbbhn = import ./home/rbhhn;
  };
}
