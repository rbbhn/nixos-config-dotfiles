{ ... }: {
  programs.fastfetch.enable = true;
  programs.fastfetch.settings = {
    logo = {
      type = "data";
      source = "     .-.\n    /^v^\\\n   (/   \\)\n=====\"=\"=-\n     |_|";
      padding = {
        left = 0;
        right = 2;
      };
    };
    display = {
      separator = " > ";
      color = {
        separator = "34";
      };
    };
    modules = [
      {
        type = "title";
        format = "{#1;34}{user-name}{#0;1}@{#0;1;34}{host-name}{#}";
      }
      {
        type = "os";
        key = "{#34}┌{#0;31} OS   ";
        format = "{2}";
        outputColor = "31";
      }
      {
        type = "packages";
        key = "{#34}├{#0;33} PKGS ";
        format = "{1}";
        outputColor = "33";
      }
      {
        type = "shell";
        key = "{#34}├{#0;35} SHELL";
        format = "{1}";
        outputColor = "35";
      }
      {
        type = "datetime";
        key = "{#34}└{#0;36} DATE ";
        format = "{6} {11}";
        outputColor = "36";
      }
    ];
  };
}
