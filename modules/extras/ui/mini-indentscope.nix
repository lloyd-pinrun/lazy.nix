{ config, lib, ... }: let
  inherit (config.extras.ui) indent-blankline mini-indentscope;
  inherit (config.plugins) snacks;

  inherit (lib)
    mkEnableOption
    mkIf
    mkMerge
    toList
    ;
in {
  options.lazy.extras.ui.mini-indentscope.enable = mkEnableOption "mini-indentscope";

  config = mkIf mini-indentscope.enable (mkMerge [
    {
      assertions = toList {
        assertion = (!indent-blankline.enable);
        message = "mini-indentscope should not be used if indent-blankline is enabled";
      };
    }

    (mkIf snacks.enable {
      plugins.snacks.settings.indent.enabled = false;
    })

    {
      plugins.mini = {
        enable = true;

        modules.indentscope = {
          symbol = "┊";
          options.try_as_border = true;
        };
      };

      extraConfigLua = ''
        vim.api.nvim_create_autocmd("FileType", {
          pattern = {
            "Trouble",
            "alpha",
            "dashboard",
            "fzf",
            "help",
            "lazy",
            "mason",
            "neo-tree",
            "notify",
            "snacks_dashboard",
            "snacks_notif",
            "snacks_terminal",
            "snacks_win",
            "toggleterm",
            "trouble",
          },
          callback = function()
            vim.b.miniindentscope_disable = true
          end,
        })

        vim.api.nvim_create_autocmd("User", {
          pattern = "SnacksDasboardOpened",
          callback = function(data)
            vim.b[data.bug].miniindentscope_disable = true
          end
        })
      '';
    }
  ]);
}
