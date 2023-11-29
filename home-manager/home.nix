{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {

  imports = [
    ./terminal.nix

    ./gnome.nix
  ];

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
    # Browsers
    firefox
    ungoogled-chromium
    mullvad-browser
    tor-browser-bundle-bin

    # Essential
    flatpak
    distrobox
    bottles

    # Productivity
    vscodium
    onlyoffice-bin
    okteta
    logseq
    obs-studio
    gimp-with-plugins
    blender
    godot_4

    # Entertainment
    discord
    stremio
    steam
    lutris
    heroic
    prismlauncher

    # Utilities
    spectacle
    vlc
    audacity
    cmus
    syncthing
    
  ];

  ##################################################################

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
