{config, ...}: let
  inherit (config.lib.lazy) mkWhichKey';
  inherit (config.lib.nerdy) md;
in {
  plugins.grug-far.settings = {
    headMaxWidth = 80;
  };

  config.lazy.spec = [
    (mkWhichKey' {
      key = "<leader>sr";
      action.__raw = ''
        function()
          local grug = require("grug-far")
          local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
          grug.open({
            transient = true,
            prefilles = {
              filesFilter = ext and exe ~= "" and "*." .. ext or nil,
            },
          })
        end
      '';
      mode = ["n" "v"];
      desc = "Search and Replace";
      icon = md.find.Replace;
    })
  ];
}
