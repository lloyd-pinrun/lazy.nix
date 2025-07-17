{ config, lib, ... }: let
  inherit (config.plugins) mini;
  inherit (lib) hasAttr mkIf;
in {
  plugins = {
    mini = {
      enable = true;
      modules.fuzzy = { };
    };

    telescope.settings.defaults = mkIf (mini.enable && hasAttr "fuzzy" mini.modules) {
      file_sorter.__raw = ''require('mini.fuzzy').get_telescope_sorter'';
      generic_sorter.__raw = ''require('mini.fuzzy').get_telescope_sorter'';
    };
  };
}
