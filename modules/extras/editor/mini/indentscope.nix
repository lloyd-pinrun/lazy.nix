{
  config,
  lib,
  ...
}: let
  inherit (config.plugins) mini;
  inherit (config.plugins) snacks;

  inherit (lib) hasAttr mkIf;
in {
  plugins = {
    mini = {
      enable = true;

      modules = {
        indentscope = mkIf (!hasAttr "indent" snacks.settings || !snacks.settings.indent.enabled) {};
      };
    };
  };

  autoCmd =
    mkIf (mini.enable && hasAttr "indentscope" mini.modules)
    [
      {
        event = ["FileType"];
        pattern = [
          "help"
          "alpha"
          "dashboard"
          "neo-tree"
          "Trouble"
          "trouble"
          "lazy"
          "mason"
          "notify"
          "toggleterm"
          "lazyterm"
          "snacks_dashboard"
        ];
        callback.__raw = ''
          function()
            vim.b.miniindentscope_disable = true
          end
        '';
      }
    ];
}
