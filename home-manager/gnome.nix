{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {

  imports = [
    ./gnomeExtensions.nix
  ];


  home.packages = with pkgs.gnome; [
    gnome-tweaks
    gnome-shell-extensions
  ];

  gtk = {
    enable = true;

    iconTheme = {
      name = "Qogir-dark";
      package = pkgs.qogir-icon-theme;
    };

    # theme = {
    #   name = "Catppuccin-Frappe-Standard-Blue-Dark";
    #   package = pkgs.catppuccin-gtk;
    # };

    cursorTheme = {
      name = "Qogir-dark";
      package = pkgs.qogir-icon-theme;
    };

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };

  # home.sessionVariables.GTK_THEME = "Catppuccin-Frappe-Standard-Blue-Dark";

}