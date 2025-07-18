{
  config,
  lib,
  ...
}: let
  inherit (config) lazy;

  inherit
    (lib)
    literalExpression
    mkEnableOption
    mkOption
    types
    ;

  styleOpts = {
    options = {
      border = mkOption {
        type = types.enum ["single" "double" "rounded" "solid" "shadow" "curved" "bold" "none"];
        default = "rounded";
        description = "Border style";
      };

      transparent = mkEnableOption "window transparency" // {default = true;};

      winblend = mkOption {
        type = types.int;
        default = 2;
        description = "Blending option for transparent windows";
      };
    };
  };
in {
  imports = [./icons.nix ./lib.nix];

  options.lazy = {
    leader = mkOption {
      type = types.str;
      default = " ";
      example = literalExpression "\"<C-c>\"";
      description = ''
        Used to set the leader key: `vim.g.mapleader`
      '';
    };

    localleader = mkOption {
      type = types.str;
      default = lazy.leader;
      example = literalExpression "\"<C-c>\"";
      description = ''
        Used to set the localleader key: `vim.g.maplocalleader`
      '';
    };

    spec = mkOption {
      type = types.listOf types.attrs;
      default = [];
      description = ''
        Used to set `which-key.settings.spec`
      '';
    };

    style = mkOption {
      type = types.attrsOf (types.submodule styleOpts);
      description = "Top-level style configuration";
    };
  };
}
