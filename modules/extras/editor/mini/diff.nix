{ lib, config, ... }: let
  inherit (config.plugins) mini;
  inherit (lib) hasAttr mkIf;
in {
  plugins.mini = {
    enable = true;
    modules.diff.view.style = "sign";
  };

  keymaps = mkIf (mini.enable && hasAttr "diff" mini.modules) [
    {
      mode = "n";
      key = "<leader>ugo";
      action.__raw = "MiniDiff.toggle_overlay";
      options = {
        desc = "Git Overlay toggle";
        silent = true;
      };
    }
  ];
}
