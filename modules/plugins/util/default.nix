{ config, lib, ... }: let
  inherit (config.lib.lazy)
    icons
    mkWhichKey'
    ;

  inherit (lib) mkForce;
in {
  plugins = {
    snacks = {
      enable = mkForce true;
      settings = {
        bigfile.enabled = true;
        quickfile.enabled = true;
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
    (mkWhichKey' { key = "<leader>."; icon = ""; group = "scratch"; })
    # quit/session
    (mkWhichKey' { key = "<leader>q"; icon = icons.ui.Save; group = "quite/session"; })

    # -- Keys --
    # scratch
    (mkWhichKey' { key = "<leader>.."; action.__raw = "function() Snacks.scratch() end"; desc = "Toggle Scratch Buffer"; })
    (mkWhichKey' { key = "<leader>.s"; action.__raw = "function() Snacks.scratch.select() end"; desc = "Toggle Scratch Buffer"; })
    (mkWhichKey' { key = "<leader>.p"; action.__raw = "function() Snacks.profiler.scratch() end"; desc = "Toggle Scratch Buffer"; })
  ];
}

