{ pkgs, username, ... }: {
  imports = [
    ./${username}.nix # Import user specific modules. Done this way so that username.nix can import modules that are the same between users that not all users have, and /username/default.nix can import modules that are unique to each user.

    ./default-programs.nix
    ./home-manager.nix # DO NOT REMOVE
    ./stylix.nix
  ];

  # Remember to config. DE/WM, steam, git, and wget!
}
