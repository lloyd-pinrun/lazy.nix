{config, ...}: let
  inherit (config.lib.lazy) mkWhichKey';
  inherit (config.lib.nerdy) md;
in {
  config.lazy.spec = [
    # quit/session
    (mkWhichKey' {
      key = "<leader>qs";
      action.__raw = ''
        function() require("persistence").load() end
      '';
      desc = "Restore Session";
      icon = md.Restore;
    })
    (mkWhichKey' {
      key = "<leader>qS";
      action.__raw = ''
        function() require("persistence").select() end
      '';
      desc = "Select Session";
      icon = md.content.save.all.Outline;
    })
    (mkWhichKey' {
      key = "<leader>ql";
      action.__raw = ''
        function() require("persistence").select() end
      '';
      desc = "Restore Last Session";
      icon = md.backup.Restore;
    })
    (mkWhichKey' {
      key = "<leader>qd";
      action.__raw = ''
        function() require("persistence").stop() end
      '';
      desc = "Don't Save Current Session";
      icon = md.content.save.alert.Outline;
    })
  ];
}
