# desktop specific nixos options
{
  config,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    /etc/nixos/hardware-configuration.nix
  ];

  # networking, firewall, and hostname
  networking = {
    hostName = "nixerpc";
    networkmanager.enable = true;
    firewall.enable = true;
  };

  # swap
  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 8 * 1024;
    }
  ];


  # env variables
  environment.sessionVariables = {
    XCURSOR_SIZE = "24";
    LIBVA_DRIVER_NAME = "nvidia";
    XDG_SESSION_TYPE = "wayland";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    WLR_NO_HARDWARE_CURSORS = "1";
    __GL_THREADED_OPTIMIZATIONS = "0";
    SSH_AUTH_SOCK = "/run/user/1000/keyring/ssh";
  };

  # nvidia drivers
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.production;
  };

  # you probably shouldn't change this, but if you want to please read the documentation first
  system.stateVersion = "23.05";
}
