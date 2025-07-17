{ config, lib, ... }: let
  inherit (config.plugins) snacks;
  inherit (lib) hasAttr mkIf;
in {
  plugins.snacks.settings.bufdelete.enabled = true;

  keymaps = mkIf (snacks.enable && hasAttr "bufdelete" snacks.settings && snacks.settings.bufdelete.enabled) [
    {
      mode = "n";
      key = "<leader>bd";
      action.__raw = "Snacks.bufdelete()";
      options.desc = "Delete Buffer";
    }
    {
      mode = "n";
      key = "<leader>bD";
      action.__raw = "Snacks.bufdelete.all()<cr>";
      options.desc = "Delete All Buffers";
    }
    {
      mode = "n";
      key = "<leader>bo";
      action.__raw = "Snacks.bufdelete.other()";
      options.desc = "Delete Other Buffers";
    }
  ];
}
