{
  config,
  lib,
  ...
}: let
  inherit (config.lazy.extras) snacks;

  inherit (lib) mkEnableOption mkIf;
  inherit (config.lib.nixvim) listToUnkeyedAttrs mkRaw;
in {
  options.lazy.extras.snacks.enable = mkEnableOption "snacks";

  imports = [./keymaps.nix];
  config = mkIf snacks.enable {
    plugins.snacks = {
      enable = true;

      settings = {
        bigfile.enabled = true;

        image = {
          enabled = true;
          border = "none";
          doc.inline = false;
        };

        indent.enabled = true;

        notifier = {
          enabled = true;
          style = "minimal";
          top_down = false;
        };

        picker = {
          enabled = true;
          sources.explorer.layout.layout.positition = "right";
          layout.present = "telescope";
          win.input.keys = {
            "\\" = (listToUnkeyedAttrs ["vsplit"]) // {mode = "n";};
            "-" = (listToUnkeyedAttrs ["split"]) // {mode = "n";};
          };
        };

        # TODO: track https://github.com/folke/snacks.nvim/issues/1360
        scroll.enabled = false;
        quickfile.enabled = true;
        works.enabled = true;
      };
    };
  };

  autoCmd = [
    {
      desc = "Pre init Function";
      event = ["VimEnter"];
      callback =
        mkRaw #lua
        
        ''
          -- Taken from https://github.com/folke/snacks.nvim?tab=readme-ov-file#-usage
          function()
            -- Setup some globals for debugging (lazy-loaded)
            _G.dd = function(...)
              Snacks.debug.inspect(...)
            end
            _G.bt = function()
              Snacks.debug.backtrace()
            end
            vim.print = _G.dd -- Override print to use snacks for `:=` command

            -- Create some toggle mappings
            Snacks.toggle.diagnostics():map("<leader>ud")
            Snacks.toggle.line_number():map("<leader>ul")
            Snacks.toggle.inlay_hints():map("<leader>uh")
            Snacks.toggle.treesitter():map("<leader>uT")
            Snacks.toggle.option("spell",
              { name = "Spelling" }):map("<leader>us")
            Snacks.toggle.option("wrap",
              { name = "Wrap" }):map("<leader>uw")
            Snacks.toggle.option("relativenumber",
              { name = "Relative Number" }):map("<leader>uL")
            Snacks.toggle.option("conceallevel",
              { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>uc")
            Snacks.toggle.option("background",
              { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
          end
        '';
    }
  ];
}
