{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModule

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  ##################################################################
  home.username = "abjelke";
  home.homeDirectory = "/home/abjelke";

  # basic configuration of git
  programs.git = {
    enable = true;
    userName = "Aidan Bjelke";
    userEmail = "aidanbjelke@gmail.com";
  };

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    git
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    curl

    nnn # terminal file manager

    # archives
    zip
    xz
    unzip
    p7zip

    # `nom` works just like `nix` with more details log output
    nix-output-monitor

    neofetch
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

  home.file."/.themes/CustomShellTheme/gnome-shell/gnome-shell.css".source = ./Gnome-topbar-le-dots/Gnome-shell.css;
  home.file."/.themes/CustomShellTheme/gnome-shell/toggle10-off.svg".source = ./Gnome-topbar-le-dots/toggle10-off.svg;
  home.file."/.themes/CustomShellTheme/gnome-shell/toggle10-on.svg".source = ./Gnome-topbar-le-dots/toggle10-on.svg;

  ##################################################################

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
