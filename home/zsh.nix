{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  programs = {
    zsh = {
      enable = true;
      defaultKeymap = "emacs";
      history = {
        path = "/home/nixer/.config/zsh/histfile";
      };
      shellAliases = {
        rebuild = "${inputs.nh.packages.${pkgs.system}.default}/bin/nh os switch";
        rm = "rm -i";
      };
      syntaxHighlighting.enable = true;
      autosuggestion.enable = true;
    };
  };
}
