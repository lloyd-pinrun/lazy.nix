{ lib, config, ... }: let
  inherit (config.plugins) mini;
  inherit (config.plugins) snacks;
  inherit (lib) hasAttr mkIf;
in {
  plugins.mini.modules.bufremove = mkIf (!snacks.enable || (snacks.enable && (!hasAttr "bufdelete" snacks.settings || !snacks.settings.bufdelete.enabled))) { };

  keymaps =
    mkIf (mini.enable && hasAttr "bufremove" mini.modules)
      [
        {
          mode = "n";
          key = "<C-w>";
          action.__raw = ''require("mini.bufremove").delete'';
          options = {
            desc = "Close buffer";
            silent = true;
          };
        }
        {
          mode = "n";
          key = "<leader>bc";
          action.__raw = ''
            function ()
              local current = vim.api.nvim_get_current_buf()

              local get_listed_bufs = function()
                return vim.tbl_filter(function(bufnr)
                 return vim.api.nvim_buf_get_option(bufnr, "buflisted")
                end, vim.api.nvim_list_bufs())
              end

              for _, bufnr in ipairs(get_listed_bufs()) do
                if bufnr ~= current
                then require("mini.bufremove").delete(bufnr)
                end
              end
            end
          '';
          options = {
            desc = "Close all buffers but current";
          };
        }
      ];
}
