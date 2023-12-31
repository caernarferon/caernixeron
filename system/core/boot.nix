{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    kernelModules = ["kvm-intel"];
    supportedFilesystems = ["ntfs"];
    loader = {
      systemd-boot.enable = lib.mkForce false;
      efi.canTouchEfiVariables = true;
    };
    lanzaboote = {
      enable = true;
      pkiBundle = "/etc/secureboot";
    };
  };
  environment.systemPackages = [
    inputs.nh.packages.${pkgs.system}.default
    inputs.lanzaboote.packages.${pkgs.system}.lzbt
    inputs.lanzaboote.packages.${pkgs.system}.stub
  ];
}
