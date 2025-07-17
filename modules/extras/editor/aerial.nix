{ config, lib, ... }: let
  inherit (config.plugins) editor;
  inherit (config.extras.editor) aerial;

  inherit (lib)
    mkEnableOption
    mkIf
    mkOption
    ;
in {
  options.extras.editor.aerial.enable =  mkEnableOption "Aerial Symbol Browser";

  config = mkIf aerial.enable {
    
  };
}
