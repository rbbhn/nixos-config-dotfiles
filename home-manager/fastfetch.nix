{ ... }: {
  programs.fastfetch.enable = true;
  programs.fastfetch.settings = {
    logo = {
      type = "data";
      source = "     .-.\n    /'v'\\\n   (/   \\)\n=====\"=\"=-\n     |_|";
      padding = {
        left = 0;
        right = 2;
        top = 1;
      };
    };
    display = {
      separator = " > ";
      color = {
        separator = "34";
      };
    };
    modules = [
      "break"
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
        type = "uptime";
        key = "{#34}└{#0;36} UP   ";
        format = "{1}";
        outputColor = "36";
      }
      "break"
    ];
  };
}
