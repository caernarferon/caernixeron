{
  inputs,
  inputs',
  osConfig,
  lib,
  ...
}: let
  device = osConfig.modules.device;
  env = osConfig.modules.usrEnv;
  sys = osConfig.modules.system;
  acceptedTypes = ["laptop" "desktop" "hybrid" "lite"];
in {
  imports = [inputs.anyrun.homeManagerModules.default];
  config = lib.mkIf (builtins.elem device.type acceptedTypes && (sys.video.enable && env.isWayland)) {
    programs.anyrun = {
      enable = true;
      config = {
        plugins = with inputs'.anyrun.packages;
          [
            applications
            rink
            translate
            randr
            shell
            symbols
            translate
          ]
          ++ [inputs'.anyrun-nixos-options.packages.default];

        # the x coordinate of the runner
        #x.relative = 800;
        # the y coordinate of the runner
        #y.absolute = 500.0;
        y.fraction = 0.02;

        # Hide match and plugin info icons
        hideIcons = false;

        # ignore exclusive zones, i.e. Waybar
        ignoreExclusiveZones = false;

        # Layer shell layer: Background, Bottom, Top, Overlay
        layer = "overlay";

        # Hide the plugin info panel
        hidePluginInfo = false;

        # Close window when a click outside the main box is received
        closeOnClick = false;

        # Show search results immediately when Anyrun starts
        showResultsImmediately = false;

        # Limit amount of entries shown in total
        maxEntries = 10;
      };

      extraConfigFiles = {
        "applications.ron".text = ''
          // Also show the Desktop Actions defined in the desktop files, e.g. "New Window" from LibreWolf
          desktop_actions: true,
          max_entries: 10,
          // The terminal used for running terminal based desktop entries, if left as `None` a static list of terminals is used
          // to determine what terminal to use.
          terminal: Some("footclient"),
        '';

        "symbols.ron".text = ''
          Config(
            // The prefix that the search needs to begin with to yield symbol results
            prefix: ":sy",

            // Custom user defined symbols to be included along the unicode symbols
            symbols: {
              // "name": "text to be copied"
              "shrug": "¯\\_(ツ)_/¯",
            },

            // The number of entries to be displayed
            max_entries: 3,
          )
        '';

        "translate.ron".text = ''
          Config(
            prefix: ":tr",
            language_delimiter: ">",
            max_entries: 3,
          )
        '';

        "nixos-options.ron".text = let
          nixos-options = osConfig.system.build.manual.optionsJSON + "/share/doc/nixos/options.json";
          neovim-flake-options = inputs'.neovim-flake.packages.docs-json + "/share/doc/neovim-flake/options.json";
          options = builtins.toJSON {
            ":nix" = [nixos-options];
            ":vim" = [neovim-flake-options];
          };
        in ''
          Config(
            options: ${options},
            min_score: 5,
          )
        '';
      };

      extraCss = ''
        * {
          transition: 200ms ease;
          font-family: Lexend;
          font-size: 1.3rem;
        }

        #window,
        #match,
        #entry,
        #plugin,
        #main {
          background: transparent;
        }

        #match:selected {
          background: rgba(203, 166, 247, 0.7);
        }

        #match {
          padding: 3px;
          border-radius: 16px;
        }

        #entry, #plugin:hover {
          border-radius: 16px;
        }

        box#main {
          background: rgba(30, 30, 46, 0.7);
          border: 1px solid #28283d;
          border-radius: 24px;
          padding: 8px;
        }
      '';
    };
  };
}