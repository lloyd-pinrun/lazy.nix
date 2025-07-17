{ config, lib, ... }: let
  inherit (config.lazy.extras.ui) indent-blankline mini-indentscope;
  inherit (config.plugins) snacks;

  inherit (lib)
    mkEnableOption
    mkIf
    mkMerge
    toList
    ;
in {
  options.lazy.extras.ui.indent-blankline.enable = mkEnableOption "indent-blankline";
  
  config = mkIf indent-blankline.enable (mkMerge [
    {
      assertions = toList {
        assertion = (!mini-indentscope.enable);
        message = "indent-blankline should not be used if mini-indentscope is enabled";
      };
    }

    (mkIf snacks.enable {
      snacks.settings.indent.enabled = false;
    })

    {
      plugins.indent-blankline = {
        enable = true;

        luaConfig = {
          post = ''
            local hooks = require "ibl.hooks"
            hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
          '';
        };

        settings = {
          indent.char = "┊";
          whitespace.remove_blankline_trail = false;

          scope = {
            enabled = true;
            show_start = false;
            show_exact_scope = true;
            highlight = [
              "RainbowRed"
              "RainbowYellow"
              "RainbowBlue"
              "RainbowOrange"
              "RainbowGreen"
              "RainbowViolet"
              "RainbowCyan"
            ];
          };
          exclude = {
            buftypes = [
              "terminal"
              "nofile"
              "quickfix"
              "prompt"
            ];
            filetypes = [
              "lspinfo"
              "packer"
              "checkhealth"
              "help"
              "man"
              "gitcommit"
              "TelescopePrompt"
              "TelescopeResults"
              "\'\'"
              "help"
              "alpha"
              "dashboard"
              "neo-tree"
              "Trouble"
              "lazy"
            ];
          };
        };
      };

      extraConfigLua = ''
        local indent_blankline_augroup = vim.api.nvim_create_augroup("indent_blankline_augroup", { clear = true })
          vim.api.nvim_create_autocmd("ModeChanged", {
            group = indent_blankline_augroup,
            pattern = "[vV\x16]*:*",
            command = "IBLEnable",
            desc = "Enable indent-blankline when exiting visual mode",
          })

          vim.api.nvim_create_autocmd("ModeChanged", {
            group = indent_blankline_augroup,
            pattern = "*:[vV\x16]*",
            command = "IBLDisable",
            desc = "Disable indent-blankline when exiting visual mode",
          })
      '';
    }
  ])
}
