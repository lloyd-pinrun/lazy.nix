{ config, lib, ... }: let
  inherit (config.extras) snacks;
  inherit (config.extras.ui) mini-animate smear-cursor;

  inherit (lib)
    mkEnableOption
    mkIf
    mkMerge
    ;
in {
  options.lazy.extras.ui.mini-animate.enable = mkEnableOption "mini-animate";

  config = mkIf mini-animate.enable (mkMerge [
    (mkIf snacks.enable {
      plugins.snacks.settings.scroll.enabled = false;
    })

    {
      plugins.mini = {
        enable = true;

        modules.animate = {
          cursor = mkIf (!smear-cursor.enable) true;
        };
      };
    }
  ]);
}
