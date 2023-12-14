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

  # dconf dump /org/gnome/
  dconf.settings = {

    # First we enable every extension that we install above
    "org/gnome/shell".enabled-extensions = [
      "blur-my-shell@aunetx"
      "dash-to-panel@jderose9.github.com"
      "rounded-window-corners@yilozt"
      "tiling-assistant@leleat-on-github"
      "user-theme@gnome-shell-extensions.gcampax.github.com"
      "appindicatorsupport@rgcjonas.gmail.com"
      "arcmenu@arcmenu.com"
      "Vitals@CoreCoding.com"
      "openweather-extension@jenslody.de"
    ]; 
    "org/gnome/shell".disabled-extensions = [];

    "org/gnome/shell/extensions/arcmenu" = {
      arc-menu-icon=5;
      distro-icon=1;
      enable-standlone-runner-menu=false;
      hide-overview-on-startup=false;
      menu-background-color="rgba(48,48,49,0.98)";
      menu-border-color="rgb(60,60,60)";
      menu-button-appearance="Icon";
      menu-button-icon="Distro_Icon";
      menu-foreground-color="rgb(223,223,223)";
      menu-item-active-bg-color="rgb(25,98,163)";
      menu-item-active-fg-color="rgb(255,255,255)";
      menu-item-hover-bg-color="rgb(21,83,158)";
      menu-item-hover-fg-color="rgb(255,255,255)";
      menu-layout="Windows";
      menu-separator-color="rgba(255,255,255,0.1)";
      prefs-visible-page=0;
      # search-entry-border-radius=(true, 25);
      show-activities-button=false;
    };

    "org/gnome/shell/extensions/blur-my-shell/panel" = {
      blur=true;
      customize=true;
      sigma=1;
    };

    "org/gnome/shell/extensions/dash-to-panel" = {
      animate-appicon-hover=true;
      # animate-appicon-hover-animation-extent={"RIPPLE": 4, "PLANK": 4, "SIMPLE": 1};
      # animate-appicon-hover-animation-travel={"SIMPLE": 0.14999999999999999, "RIPPLE": 0.40000000000000002, "PLANK": 0.0};
      appicon-margin=8;
      appicon-padding=4;
      available-monitors=[0];
      dot-position="BOTTOM";
      hot-keys=true;
      hotkeys-overlay-combo="TEMPORARILY";
      leftbox-padding=-1;
      # panel-anchors="{"0":"MIDDLE"}";
      # panel-element-positions="{"0":[{"element":"showAppsButton","visible":false,"position":"stackedTL"},{"element":"activitiesButton","visible":false,"position":"stackedTL"},{"element":"leftBox","visible":true,"position":"stackedTL"},{"element":"taskbar","visible":true,"position":"centerMonitor"},{"element":"centerBox","visible":true,"position":"stackedBR"},{"element":"rightBox","visible":true,"position":"stackedBR"},{"element":"dateMenu","visible":true,"position":"stackedBR"},{"element":"systemMenu","visible":true,"position":"stackedBR"},{"element":"desktopButton","visible":true,"position":"stackedBR"}]}";
      # panel-lengths="{"0":100}";
      # panel-sizes="{"0":32}";
      primary-monitor=0;
      show-appmenu=true;
      show-apps-icon-file="/home/abjelke/Documents/nix_config/home-manager/pokeball-collection/pokeball.svg";
      status-icon-padding=-1;
      stockgs-keep-dash=false;
      stockgs-keep-top-panel=false;
      trans-gradient-bottom-opacity=0.01;
      trans-panel-opacity=0.0;
      trans-use-custom-gradient=false;
      trans-use-custom-opacity=true;
      trans-use-dynamic-opacity=false;
      tray-padding=-1;
      window-preview-title-position="TOP";
    };

    "org/gnome/shell/extensions/openweather" = {
      city="51.0456064,-114.057541>Calgary, Alberta, Canada>0";
      refresh-interval-current=1800;
    };

    "org/gnome/shell/extensions/rounded-window-corners" = {
      # custom-rounded-corner-settings=@a{sv} {};
      # global-rounded-corner-settings={"padding": <{"left": <uint32 1>, "right": <uint32 1>, "top": <uint32 1>, "bottom": <uint32 1>}>, "keep_rounded_corners": <{"maximized": <false>, "fullscreen": <false>}>, "border_radius": <uint32 12>, "smoothing": <uint32 0>};
      # settings-version=uint32 5;
    };

    "org/gnome/shell/extensions/tiling-assistant" = {
      active-window-hint-color="rgb(53,132,228)";
      last-version-installed=40;
      # overridden-settings={"org.gnome.mutter.edge-tiling": <@mb nothing>, "org.gnome.desktop.wm.keybindings.maximize": <@mb nothing>, "org.gnome.desktop.wm.keybindings.unmaximize": <@mb nothing>, "org.gnome.mutter.keybindings.toggle-tiled-left": <@mb nothing>, "org.gnome.mutter.keybindings.toggle-tiled-right": <@mb nothing>};
    };
    "org/gnome/shell/extensions/user-theme" = {
      name="Catppuccin-Frappe-Standard-Blue-Dark";
    };

  };


}