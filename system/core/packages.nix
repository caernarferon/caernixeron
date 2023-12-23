{
  config,
  inputs,
  pkgs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    # Hyprland Requirements
    handbrake
    swayosd
    gtklock
    scrcpy
    grim
    gvfs
    kitty
    greetd.tuigreet
    libnotify
    kooha
    playerctl
    polkit
    polkit_gnome
    slurp
    swaylock-effects
    swww
    udiskie
    udisks
    wireplumber
    wlogout
    wlsunset
    wl-clipboard
    xdg-user-dirs
    dunst
    element-desktop-wayland
    gruvbox-dark-gtk
    jq
    socat
    gnome3.gnome-control-center
    gnome3.gnome-settings-daemon
    cliphist
    swayidle
    tealdeer
    brightnessctl
    neofetch
    # Internet
    (pkgs.discord.override {
      withOpenASAR = true;
      withVencord = true;
    })
    webcord-vencord
    firefox
    google-chrome
    thunderbird
    wget
    gnome.gnome-calendar
    microsoft-edge-dev

    # Text Editors
    neovim
    bat
    vscode

    # Entertainment
    ffmpeg
    mpv
    spotify
    ckan
    imv

    # Creative
    obs-studio
    blender
    steam-run

    #fonts
    monaspace

    # audio
    pavucontrol
    # Customization
    # Misc
    git
    gnome.nautilus
    htop
    keepassxc
    killall
    networkmanagerapplet
    piper
    virt-manager
    inputs.anyrun.packages.${pkgs.system}.anyrun-with-all-plugins
    inputs.watershot.packages.${pkgs.system}.default
    inputs.eww-tray.packages.${pkgs.system}.eww-wayland
    inputs.prismlauncher.packages.${pkgs.system}.default
    inputs.nh.packages.${pkgs.system}.default
    inputs.lanzaboote.packages.${pkgs.system}.lzbt
    inputs.lanzaboote.packages.${pkgs.system}.stub

    cups-filters

    # School

    # Programming
    (python3.withPackages (ps:
      with ps; [
        pandas
        matplotlib
        requests
        rich
        nextcord
        gst-python
        python-dotenv
      ]))
    nodejs
    newt
    ripgrep
    docker-client
    cargo
    gcc
    qemu
    gopls
    pyright
    nodejs
    clang
  ];
  programs = {
    nix-ld.enable = true;
    steam = {
      enable = true;
    };
    zsh = {
      enable = true;
    };
    seahorse = {
      enable = true;
    };
    dconf = {
      enable = true;
    };
    gnupg = {
      agent = {
        enable = true;
        enableSSHSupport = true;
        enableExtraSocket = true;
        pinentryFlavor = "gnome3";
      };
    };
    kdeconnect = {
      enable = true;
    };
  };
}