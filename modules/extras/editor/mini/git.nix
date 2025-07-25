{
  lib,
  config,
  ...
}: let
  inherit (config.plugins) mini;
  inherit (lib) hasAttr mkIf;
in {
  plugins = {
    mini = {
      enable = true;
      modules.git = {};
    };
  };

  keymaps = mkIf (mini.enable && hasAttr "git" mini.modules) [
    # TODO: relocate
    # {
    #   mode = "n";
    #   key = "<leader>gD";
    #   action = "<CMD>lua MiniGit.show_diff_source()<CR>";
    #   options = {
    #     desc = "Show diff source";
    #   };
    # }
    {
      mode = "";
      key = "<leader>gH";
      action = "<CMD>lua MiniGit.show_range_history()<CR>";
      options = {
        desc = "Show range history";
      };
    }
    {
      mode = "n";
      key = "<leader>g.";
      action = "<CMD>lua MiniGit.show_at_cursor()<CR>";
      options = {
        desc = "Show git context";
      };
    }
  ];
}
