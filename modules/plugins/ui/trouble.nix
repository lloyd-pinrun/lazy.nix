{ config, lib, ... }: let
  inherit (config.lib.lazy) icons mkWhichKey';
in {
  plugins.trouble = {
    enable = true;
    lazyLoad.settings.cmd = [ "Trouble" ];

    settings = {
      auto_close = true;

      modes = {
        preview_split = {
          mode = "diagnostics";
          preview = {
            type = "split";
            relative = "win";
            position = "right";
            size = "0.5";
          };
        };

        preview_float = {
          mode = "diagnostics";
          preview = {
            type = "float";
            relative = "editor";
            border = "rounded";
            title = "Preview";
            title_pos = "center";
            position = [ 0 (-2) ];
            size = {width = 0.3; height = 0.3;};
            zindex = 200;
          };
        };
      };
    };
  };

  lazy.spec = [
    # -- Groups --
    # diagnostics/quickfix
    (mkWhichKey' { key = "<leader>x"; icon = icons.ui.traffic_light.Outlined; group = "diagnostics/quickfix"; })
    (mkWhichKey' { key = "<leader>xx"; action = "<cmd>Trouble diagnostics toggle<cr>"; desc = "Diagnostics"; })
    ()
  ];
}
