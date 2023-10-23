{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    bibata-cursors
    dconf
    apple-cursor
  ];

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };

  gtk = {
    enable = true;
    font = {
      name = "Torus";
    };
    cursorTheme = {
      package = pkgs.apple-cursor;
      name = "macOS-Monterey";
      size = 22;
    };
    theme = {
      name = "gruvbox-but-good";
    };
  };
  home.sessionVariables.GTK_THEME = "gruvbox-but-good";
}
