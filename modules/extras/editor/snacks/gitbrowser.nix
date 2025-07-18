{
  config,
  lib,
  ...
}: let
  inherit (config.plugins) snacks;

  inherit
    (lib)
    flatten
    flip
    mergeAttrs
    mkIf
    pipe
    ;

  flatMap = fn: flip pipe [(map fn) flatten];

  modes = ["n" "x"];

  actions = [
    {
      key = "<leader>gB";
      action.__raw = ''
        function()
          Snacks.gitbrowse()
        end
      '';
      options.desc = "Git Browse (open)";
    }

    {
      key = "<leader>gY";
      action.__raw = ''
        function()
          Snacks.gitbrowse({ open = function(url) vim.fn.setreg("+", url) end, notify = false })
        end
      '';
      options.desc = "Git Browse (copy)";
    }
  ];
in {
  plugins.snacks.settings.gitbrowse.enabled = true;

  keymaps =
    mkIf (snacks.enabled && snacks.settings.gitbrowse.enabled)
    flatMap (action: map (mode: mergeAttrs {inherit mode;} action) modes)
    actions;
}
