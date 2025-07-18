{
  config,
  lib,
  ...
}: let
  inherit (config.plugins) mini;
  inherit (lib) hasAttr mkIf;
in {
  plugins.mini = {
    enable = true;
    modules.files = {};
  };

  # TODO: separate CWD and root dir
  keymaps = mkIf (mini.enable && lib.hasAttr "files" mini.modules) [
    {
      mode = "n";
      key = "<leader>E";
      action.__raw = "MiniFiles.open()";
      options = {
        desc = "Mini Files";
      };
    }
  ];
}
