{inputs, ...}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    enableMan = true;
    extraConfigVim = "set number\nset shiftwidth=4\nset smarttab";
    colorschemes.vscode = {
      enable = true;
      settings.transparent = true;
    };
    plugins = {
      nix.enable = true;
      oil.enable = true;
      web-devicons.enable = true;
      gitblame.enable = true;
      colorizer.enable = true;
      treesitter.enable = true;
      ############## LSP ###############
      trouble.enable = true;
      lspkind.enable = false;
      lsp-lines.enable = true;
      lsp-format.enable = true;
      lualine = {
        enable = true;
        settings = {
          disabled_filetypes = {
            __unkeyed-1 = "startify";
            __unkeyed-2 = "neo-tree";
            statusline = [
              "dap-repl"
            ];
            winbar = [
              "aerial"
              "dap-repl"
              "neotest-summary"
            ];
          };
          globalstatus = true;

          sections = {
            lualine_a = [
              "mode"
            ];
            lualine_b = [
              "branch"
            ];
            lualine_c = [
              "diff"
              {
                __unkeyed-1 = "filename";
                newfile_status = true;
                path = 3;
                shorting_target = 150;
              }
            ];
            lualine_x = [
              "diagnostics"
              {
                __unkeyed-1 = {
                  __raw = ''
                    function()
                        local msg = ""
                        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
                        local clients = vim.lsp.get_clients()
                        if next(clients) == nil then
                            return msg
                        end
                        for _, client in ipairs(clients) do
                            local filetypes = client.config.filetypes
                            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                                return client.name
                            end
                        end
                        return msg
                    end
                  '';
                };
                color = {
                  #fg = "#ffffff";
                };
                icon = " ";
              }
              "encoding"
              "fileformat"
              "filetype"
            ];
            lualine_y = [
              {
                __unkeyed-1 = "aerial";
                colored = true;
                cond = {
                  __raw = ''
                    function()
                      local buf_size_limit = 1024 * 1024
                      if vim.api.nvim_buf_get_offset(0, vim.api.nvim_buf_line_count(0)) > buf_size_limit then
                        return false
                      end

                      return true
                    end
                  '';
                };
                dense = false;
                dense_sep = ".";
                depth = {
                  __raw = "nil";
                };
                sep = " ) ";
              }
            ];
            lualine_z = [
              {
                __unkeyed-1 = "location";
              }
            ];
          };
        };
      };

      lspsaga = {
        enable = true;
        lightbulb.virtualText = false;
        lightbulb.sign = false;
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
          rust_analyzer = {
            enable = true;
            installRustc = true;
            installCargo = true;
          };
          nil_ls = {
            enable = true;
            settings = {
              nix.flake.autoArchive = false;
            };
          };
        };
      };
    };
  };
}
