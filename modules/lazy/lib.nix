{lib, ...}: let
  inherit
    (lib)
    assertMsg
    mkIf
    mkMerge
    mkOption
    types
    ;

  defaultOptions = {
    desc = null;
    silent = true;
    noremap = true;
    remap = true;
  };
in {
  options.lib.lazy = {
    mkKey = mkOption {type = types.functionTo types.attrs;};
    mkKey' = mkOption {type = types.functionTo types.attrs;};
    lazyKey = mkOption {type = types.functionTo types.attrs;};
    mkWhichKey = mkOption {type = types.functionTo types.attrs;};
    mkWhichKey' = mkOption {type = types.functionTo types.attrs;};
  };

  config.lib.lazy = {
    # Returns an attrset for the  given `mode`, `key`, `action` & `options`
    # Used to create a keybind entrie to put in `config.keymaps` list.
    mkKey = mode: key: action: options: {
      inherit mode key action;
      options = defaultOptions // options;
    };

    mkKey' = args @ {
      mode,
      key,
      action,
      ...
    }:
      mkMerge [
        {inherit mode action key;}
        (mkIf (args ? options) {options = defaultOptions // args.options;})
        (mkIf (!args ? options) {options = defaultOptions;})
      ];

    mkWhichKey = key: action: desc: {
      inherit desc;
      __unkeyed-1 = key;
      __unkeyed-2 = action;
    };

    mkWhichKey' = args @ {key, ...}:
      assert assertMsg (!(args ? group) && !(args ? desc)) "which-key spec entry requires a `desc` if no `group` is provided";
        ""
        mkMerge [
          {__unkeyed-1 = key;}
          (mkIf (args ? action) {__unkeyed-2 = args.action;})
          (mkIf (args ? desc) {inherit (args) desc;})
          (mkIf (args ? group) {inherit (args) group;})
          (mkIf (args ? hidden) {inherit (args) hidden;})
          (mkIf (args ? icon) {inherit (args) icon;})
          (mkIf (args ? mode) {inherit (args) mode;})
          (mkIf (args ? silent) {inherit (args) silent;})
        ];
  };
}
