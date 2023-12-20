# desktop specific nixos options
{
  config,
  lib,
  nixpkgs,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../../modules/novideo
  ];

  # networking, firewall, and hostname
  networking = {
    hostName = "eeloo";
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
  # you probably shouldn't change this, but if you want to please read the documentation first
  system.stateVersion = "23.11";
}
