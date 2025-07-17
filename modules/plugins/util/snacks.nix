{config, ...}: let
  inherit (config.lib.lazy) mkWhichKey';
  inherit (config.lib.nerdy) md;
in {
  config.lazy.spec = [
    (mkWhichKey' {
      key = "<leader>..";
      action.__raw = "function() Snacks.scratch() end";
      desc = "Toggle Scratch Buffer";
      icon = md.notebook.edit.Outline;
    })
    (mkWhichKey' {
      key = "<leader>.s";
      action.__raw = "function() Snacks.scratch.select() end";
      desc = "Select Scratch Buffer";
      icon = md.notebook.Multiple;
    })
    (mkWhichKey' {
      key = "<leader>.p";
      action.__raw = "function() Snacks.profiler.scratch() end";
      desc = "Profiler Scratch Buffer";
      icon = md.lightning.Bolt;
    })
  ];
}
