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
    neofetch
    htop
    cmatrix
    cowsay

    flatpak
    firefox
    spectacle

    mullvad-browser
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
  ];

  programs.neovim.enable = true;

  ##################################################################

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
