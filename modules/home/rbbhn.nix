{ pkgs, inputs, username, stateVersion, ... }: {
  imports = [
    ./stylix.nix
  ];

  home.username = "${username}";
  home.homeDirectory = "/home/${username}";

  home.packages = with pkgs; [
    pipes
    cmatrix
    fastfetch
  ];

  programs.fastfetch.enable = true;
  programs.fastfetch.settings = {
    logo = "null";
    display = {
      separator = " > ";
    };
    modules = [
      {
        type = "os";
        key = "OS";
        keyColor = "31";
      }
      {
        type = "packages";
        key = "Packages";
        keyColor = "32";
      }
      {
        type = "board";
        key = "Board";
        keyColor = "33";
      }
      {
        type = "shell";
        key = "Shell";
        keyColor = "34";
      }
      {
        type = "wm";
        key = "WM";
        keyColor = "35";
      }
    ];
  };

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.stateVersion = "${stateVersion}";
}
