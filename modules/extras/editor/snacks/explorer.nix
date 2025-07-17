{ config, lib, ... }: let
  inherit (config.plugins) snacks;

  inherit (lib)
    mkEnableOption
    mkIf
    ;
in {
  plugins.snacks.settings.explorer.enabled = true;

}
