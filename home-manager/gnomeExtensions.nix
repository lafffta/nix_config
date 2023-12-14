{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  
  home.packages = with pkgs.gnomeExtensions; [
    blur-my-shell
    rounded-window-corners
    dash-to-panel
    tiling-assistant
    arcmenu
    appindicator
    vitals
    openweather
  ];


}