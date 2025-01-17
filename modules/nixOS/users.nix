{  pkgs, ... }: {
  users.users.rbbhn = { # Define my user account
    isNormalUser = true;
    description = "Matthew M";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
  };
}
