{ pkgs, username, ... }: {
  users.users.${username} = { # Define my user account
    isNormalUser = true;
    description = "${username}";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
  };
}
