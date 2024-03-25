{ pkgs
, inputs
, ...
}: {
  imports = [
    ./config.nix
    ./style.nix
  ];
  programs.waybar = {
    enable = false;
    package = inputs.waybar.packages.${pkgs.system}.default;
    systemd.enable = true;
  };
}
