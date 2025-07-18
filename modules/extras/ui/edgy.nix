{
  config,
  lib,
  ...
}: let
  inherit (config.lazy.extras.ui) edgy;
  inherit (config.plugins) aerial neo-tree;

  inherit
    (lib)
    mkEnableOption
    mkIf
    ;
in {
  options.lazy.extras.ui.edgy.enable = mkEnableOption "edgy.nvim";

  config = mkIf edgy.enable {
    plugins.edgy = {
      enable = true;

      settings = {
        animate.enabled = false;

        left = [
          (mkIf neo-tree.enable {
            title = "Files";
            ft = "neo-tree";
            filter = ''
              function(buf)
                return vim.b[buf].neo_tree_source == "filesystem"
              end
            '';
            open = "Neotree";
          })

          (mkIf neo-tree.enable {
            title = "Git";
            ft = "neo-tree";

            filter = ''
              function(buf)
                return vim.b[buf].neo_tree_source == "git_status"
              end
            '';

            pinned = true;
            open = "Neotree position=right git_status";
          })

          (mkIf neo-tree.enable {
            title = "Buffers";
            ft = "neo-tree";

            filter = ''
              function(buf)
                return vim.b[buf].neo_tree_source == "buffers"
              end
            '';

            pinned = true;
            open = "Neotree position=top buffers";
          })

          (mkIf aerial.enable
            && neo-tree.enable {
              title = "Outline";
              ft = "aerial";

              filter = ''
                function(buf)
                  return vim.b[buf].neo_tree_source == "aerial"
                end
              '';

              pinned = true;
              open = "AerialOpen";
            })
        ];

        wo = {
          signcolumn = "no";
          spell = false;
          winbar = false;
          winfixheight = false;
          winfixwidth = false;
          winhighlight = "";
        };
      };
    };
  };
}
