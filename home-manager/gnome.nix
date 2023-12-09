{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {

  home.packages = with pkgs; [
    qogir-icon-theme
    catppuccin-gtk

    gnome.gnome-tweaks
    gnome.gnome-shell-extensions

    gnomeExtensions.blur-my-shell
    gnomeExtensions.rounded-window-corners
    gnomeExtensions.dash-to-panel
    gnomeExtensions.tiling-assistant
  ];


}