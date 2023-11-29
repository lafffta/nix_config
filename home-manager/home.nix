{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {

  imports = [

  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

    ##################################################################
  home = {
    username = "abjelke";
    homeDirectory = "/home/abjelke";
  };

  # basic configuration of git
  programs.git = {
    enable = true;
    userName = "Aidan Bjelke";
    userEmail = "aidanbjelke@gmail.com";
  };

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    neofetch
    htop
    cmatrix
    cowsay

    flatpak
    firefox
    spectacle

    tor-browser-bundle-bin
    vscodium
    vlc
    onlyoffice-bin
    audacity
    strawberry
    bottles
    okteta
    gimp-with-plugins
    blender
    godot_4
    obs-studio
    logseq
    syncthing
    distrobox

    steam
    lutris
    heroic
    prismlauncher

    discord
    stremio
    ungoogled-chromium

    qogir-icon-theme

    gnome.gnome-tweaks
    gnome.gnome-shell-extensions

    gnomeExtensions.blur-my-shell
    gnomeExtensions.rounded-window-corners
    gnomeExtensions.dash-to-panel
    gnomeExtensions.tiling-assistant
  ];

  programs.neovim.enable = true;

  # starship - an customizable prompt for any shell
  programs.starship = {
    enable = true;
    # custom settings
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  # alacritty - a cross-platform, GPU-accelerated terminal emulator
  programs.alacritty = {
    enable = true;
    # custom settings
    settings = {
      env.TERM = "xterm-256color";
      font = {
        size = 12;
        draw_bold_text_with_bright_colors = true;
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    # TODO add your customm bashrc here
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';

    shellAliases = {
      k = "kubectl";
      urldecode = "python3 -c 'import sys, urllib.parse as ul; print(ul.unquote_plus(sys.stdin.read()))'";
      urlencode = "python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.stdin.read()))'";
    };
  };
  
  # v0.7.1
  home.file."/.themes/Catppuccin-Mocha-Standard-Blue-Dark".source = ./Catppuccin-Mocha-Standard-Blue-Dark/Catppuccin-Mocha-Standard-Blue-Dark;

  ##################################################################

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
