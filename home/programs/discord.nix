{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    (discord.override {
      withOpenASAR = true;
      withVencord = true;
    })
    webcord-vencord
  ];
}
