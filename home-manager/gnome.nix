{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {

  # Catppuccin GTK theme v0.7.1
  home.file."/.themes/Catppuccin-Mocha-Standard-Blue-Dark".source = ./Catppuccin-Mocha-Standard-Blue-Dark/Catppuccin-Mocha-Standard-Blue-Dark;

  home.packages = with pkgs; [
    qogir-icon-theme

    gnome.gnome-tweaks
    gnome.gnome-shell-extensions

    gnomeExtensions.blur-my-shell
    gnomeExtensions.rounded-window-corners
    gnomeExtensions.dash-to-panel
    gnomeExtensions.tiling-assistant
  ];


}