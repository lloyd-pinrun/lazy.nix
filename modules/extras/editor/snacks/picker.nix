{ config, lib, ... }: let
  inherit (config.plugins) snacks;
  inherit (lib) mkIf;
in {
  plugins.snacks.settings.picker = {
    enabled = true;
    
  };
}
