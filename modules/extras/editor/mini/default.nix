{ config, lib, ... }: let
  inherit (config.plugins) friendly-snippets;
  inherit (lib) mkIf;
in {
  imports = [
    ./bufremove.nix
    ./comment.nix
    ./diff.nix
    ./files.nix
    ./fuzzy.nix
    ./git.nix
    ./hipatterns.nix
    ./indentscope.nix
    ./map.nix
    ./pairs.nix
    ./starter.nix
    ./surround.nix
  ];

  plugins.mini = {
    enable = true;
    mockDevIcons = true;

    modules = {
       ai = { };
        align = { };
        basics = { };
        bracketed = { };
        icons = { };
        snippets = {
          snippets = {
            __unkeyed-1.__raw =
              mkIf friendly-snippets.enable # Lua
                "require('mini.snippets').gen_loader.from_file('${friendly-snippets.package}/snippets/global.json')";
            __unkeyed-2.__raw = "require('mini.snippets').gen_loader.from_lang()";
          };
        };
    };
  };
}
