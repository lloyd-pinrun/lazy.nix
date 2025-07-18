{
  config,
  lib,
  ...
}: let
  inherit
    (config.lib.lazy)
    icons
    mkWhichKey'
    ;

  inherit (lib) mkForce;
in {
  plugins = {
    snacks = {
      enable = mkForce true;
      settings = {
        bigfile.enabled = mkForce true;
        quickfile.enabled = mkForce true;
      };
    };

    persistence = {
      enable = mkForce true;
      lazyLoad.settings.event = "BufReadPre";
    };
  };

  lazy.spec = [
    # -- Groups --
    # scratch
    (mkWhichKey' {
      key = "<leader>.";
      icon = "";
      group = "scratch";
    })
    # quit/session
    (mkWhichKey' {
      key = "<leader>q";
      icon = icons.ui.Save;
      group = "quite/session";
    })

    # -- Keys --
    # scratch
    (mkWhichKey' {
      key = "<leader>..";
      action.__raw = "function() Snacks.scratch() end";
      desc = "Toggle Scratch Buffer";
    })
    (mkWhichKey' {
      key = "<leader>.s";
      action.__raw = "function() Snacks.scratch.select() end";
      desc = "Toggle Scratch Buffer";
    })
    (mkWhichKey' {
      key = "<leader>.p";
      action.__raw = "function() Snacks.profiler.scratch() end";
      desc = "Toggle Scratch Buffer";
    })
    # quit/session
    (mkWhichKey' {
      key = "<leader>qs";
      action.__raw = ''
        function() require("persistence").load() end
      '';
      desc = "Restore Session";
    })
    (mkWhichKey' {
      key = "<leader>qS";
      action.__raw = ''
        function() require("persistence").select() end
      '';
      desc = "Select Session";
    })
    (mkWhichKey' {
      key = "<leader>ql";
      action.__raw = ''
        function() require("persistence").select() end
      '';
      desc = "Restore Last Session";
    })
    (mkWhichKey' {
      key = "<leader>qd";
      action.__raw = ''
        function() require("persistence").stop() end
      '';
      desc = "Don't Save Current Session";
    })
  ];
}
