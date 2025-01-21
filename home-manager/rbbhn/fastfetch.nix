{ ... }: {
  programs.fastfetch.enable = true;
  programs.fastfetch.settings = {
    logo = {
      type = "data";
      color = {
        "1" = "90";
      };
      source = "    .-.\n   /^v^\\\n  (/   \\)\n====\"=\"=-\n    |_|";
      padding = {
        left = 0;
        right = 2;
      };
    };
    display = {
      separator = " ➤ ";
      color = {
        separator = "90";
      };
    };
    modules = [
      {
        type = "title";
        format = "{#1;35}{user-name}{#0;1;37}@{#0;1;35}{host-name}{#}";
      }
      {
        type = "os";
        key = "{#90}┌{#0;91} OS   ";
        format = "{2}";
        outputColor = "91";
      }
      {
        type = "packages";
        key = "{#90}├{#0;93} PKGS ";
        format = "{1}";
        outputColor = "93";
      }
      {
        type = "shell";
        key = "{#90}├{#0;92} SHELL";
        format = "{1}";
        outputColor = "92";
      }
      {
        type = "datetime";
        key = "{#90}└{#0;94} DATE ";
        format = "{6} {11}";
        outputColor = "94";
      }
    ];
  };
}