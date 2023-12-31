{pkgs, ...}: {
  programs.nixvim = {
    enable = true;
    extraConfigLua = "vim.cmd('set cmdheight=0')";
    colorschemes.gruvbox.enable = true;
    extraPlugins = with pkgs.vimPlugins; [
      {
        plugin = suda-vim;
      }
    ];
    plugins = {
      oil = {
        enable = true;
      };
      lualine = {
        enable = true;
        theme = "gruvbox";
      };
      nvim-colorizer = {
        enable = true;
      };
      nvim-tree = {
        enable = true;
        autoReloadOnWrite = true;
        hijackCursor = true;
        openOnSetup = true;
      };
      gitsigns = {
        enable = true;
      };
      trouble = {
        enable = true;
      };
      nvim-cmp = {
        enable = true;
        autoEnableSources = true;
        sources = [
          {name = "nvim_lsp";}
          {name = "path";}
          {name = "buffer";}
          {name = "luasnip";}
        ];

        mapping = {
          "<CR>" = "cmp.mapping.confirm({ select = true })";
        };
      };
      lsp = {
        keymaps = {
          silent = true;
          diagnostic = {
            "<leader>k" = "goto_prev";
            "<leader>j" = "goto_next";
          };

          lspBuf = {
            gd = "definition";
            K = "hover";
          };
        };
        enable = true;
        servers = {
          pyright = {
            enable = true;
          };
          rust-analyzer = {
            enable = true;
          };
          rnix-lsp = {
            enable = true;
          };
          nil_ls = {
            enable = true;
          };
        };
      };
      treesitter = {
        enable = true;
      };
    };
  };
}
