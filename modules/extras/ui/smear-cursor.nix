{
  config,
  lib,
  ...
}: let
  inherit (config.lazy.extras.ui) smear-cursor;

  inherit
    (lib)
    mkEnableOption
    mkIf
    ;
in {
  options.lazy.extras.ui.smear-cursor.enable = mkEnableOption "smear-cursor";

  config = mkIf smear-cursor.enable {
    plugins = {
      smear-cursor = {
        enable = true;
        autoLoad = true;
      };

      mini.modules.animate.cursor.enable = false;
    };
  };
}
