{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {

  imports = [
    ./terminal.nix

    # ./kde.nix
  ];

  ##################################################################
  home = {
    username = "aidanb";
    homeDirectory = "/home/aidanb";
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
    podman
    docker
    wine
    bottles

    # Productivity
    vscodium
    onlyoffice-bin
    okteta
    obs-studio
    gimp-with-plugins
    blender
    dotnet-sdk_8

    # Entertainment
    discord
    stremio
    steam
    steam-run
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
