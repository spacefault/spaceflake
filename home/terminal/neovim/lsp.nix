{pkgs, ...}: {
  plugins = {
    trouble.enable = true;
    lspkind.enable = true;
    lsp-lines.enable = true;
    lspsaga.enable = true;
    lsp-format.enable = true;
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
        rust_analyzer = {
          enable = true;
          installRustc = true;
          installCargo = true;
        };
        nil_ls = {
          enable = true;
        };
      };
    };
  };
}
