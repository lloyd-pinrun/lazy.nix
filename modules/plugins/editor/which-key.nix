{config, ...}: let
  inherit (config.lazy) spec;
  inherit (config.lib.lazy) mkWhichKey';
  inherit (config.lib.nerdy) md;
in {
  plugins.which-key.settings = {
    inherit spec;
    preset = "helix";
  };

  config.lazy.spec = [
    (mkWhichKey' {
      key = "<leader>b?";
      action.__raw = ''
        function() require("which-key").show({ global = false })
      '';
      desc = "Buffer Keymaps";
      icon = md.keyboard.Outline;
    })
  ];
}
