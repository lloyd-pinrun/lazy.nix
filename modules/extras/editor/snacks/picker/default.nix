{
  imports = [ ./git.nix ];

  plugins.snacks.settings.picker = {
    formatters.file.truncate = 100;
    layouts.select.layout = {
      relative = "cursor";
      width = 70;
      min_width = 0;
      row = 1;
    };
  };
}
