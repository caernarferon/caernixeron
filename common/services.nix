{
  config,
  pkgs,
  ...
}: {
  services = {
    devmon.enable = true;
    gvfs.enable = true;
    tailscale.enable = true;
    dbus.enable = true;
    flatpak.enable = true;
    ratbagd.enable = true;
    gnome.gnome-keyring.enable = true;
    printing = {
      enable = true;
      logLevel = "debug";
      drivers = [
        pkgs.cups-kyodialog
      ];
    };
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
    xserver = {
      enable = true;
      displayManager.sddm = {
        enable = true;
        wayland.enable = true;
      };
      layout = "";
      xkbVariant = "";
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
    logind = {
      extraConfig = "HandlePowerKey=ignore";
    };
  };
  hardware.bluetooth.enable = true;
}
