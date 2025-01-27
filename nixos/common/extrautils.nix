{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # These packages remain UNCONFIGURED - if needed, separate into modules and configure.
    git
    wget

    # Pull progs. out and make individual modules when programs gain home-manager configs
    # This is the big todo - these progs. should NOT be in this place.
    # TUI
    progress
    lazygit
    ranger
    gh
    glow

    # GUI
    kdePackages.kate
    spotify
    keepassxc
    vlc
    ghostty
    logseq
  ];

  #Logseq fix
  nixpkgs.overlays = [
  (
    final: prev: {
      logseq = prev.logseq.overrideAttrs (oldAttrs: {
        postFixup = ''
          makeWrapper ${prev.electron_20}/bin/electron $out/bin/${oldAttrs.pname} \
            --set "LOCAL_GIT_DIRECTORY" ${prev.git} \
            --add-flags $out/share/${oldAttrs.pname}/resources/app \
            --add-flags "\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+--ozone-platform-hint=auto --enable-features=WaylandWindowDecorations}}" \
            --prefix LD_LIBRARY_PATH : "${prev.lib.makeLibraryPath [ prev.stdenv.cc.cc.lib ]}"
        '';
      });
    }
  )
  ];

  # Install apps
  programs.firefox.enable = true;
}
