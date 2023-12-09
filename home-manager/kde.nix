{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {

  home.packages = with pkgs; [
    qogir-icon-theme
  ];


}