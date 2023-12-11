{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {

  home.packages = with pkgs; [
    qogir-icon-theme
    catppuccin-kde
    catppuccin-gtk

    # latte-dock

    touchegg
  ];


}