{config, username, ...}: {
  xdg.mimeApps = {
    enable = config.home-manager.graphical.enable;
    defaultApplications = {
      "inode/directory" = "org.gnome.nautilus.desktop";

      "application/zip" = "org.gnome.nautilus.desktop";
      "application/vnd.rar" = "org.gnome.nautilus.desktop";
      "application/x-7z-compressed" = "org.gnome.nautilus.desktop";
      "text/html" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/about" = "firefox.desktop";
      "x-scheme-handler/unknown" = "firefox.desktop";
      "x-scheme-handler/tg" = "org.telegram.desktop.desktop";
    };
  };
  xdg.configFile."mimeapps.list".force = true;
}
