{ pkgs, ... }: {
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
        rust-analyzer = {
          enable = true;
          installRustc = true;
          installCargo = true;
        };
        rnix-lsp = {
          enable = true;
        };
        nil_ls = {
          enable = true;
        };
      };
    };
  };
}
