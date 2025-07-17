{ config, lib, ... }: let
  inherit (config.lazy.extras) snacks;

  inherit (config.lib.lazy) mkWhichKey';
  inherit (config.lib.nerdy) cod md;

  inherit (lib) mkIf;
in {
  config = mkIf snacks.enable {
    lazy.spec = [
      # -- Groups --
      # scratch
      (mkWhichKey' { key = "<leader>."; icon = ""; group = "scratch"; })
      # code
      (mkWhichKey' { key = "<leader>c"; icon = md.code.Tags; group = "code"; mode = [ "n" "v" ]; })
      (mkWhichKey' { key = "<leader>cd"; icon = md.list.Status; group = "diagnostics"; })
      (mkWhichKey' { key = "<leader>cf"; icon = md.format.list.Text; group = "format"; mode = [ "n" "v" ]; })
      (mkWhichKey' { key = "<leader>cs"; icon = md.code.Json; group = "surround"; mode = [ "n" "v" ]; })
      # file/find
      (mkWhichKey' { key = "<leader>f"; icon = md.file.Find; group = "file/find"; mode = [ "n" "v" ]; })
      # git
      (mkWhichKey' { key = "<leader>g"; icon = cod.Octoface; group = "git"; mode = [ "n" "v" "x" ]; })
      # notifications
      (mkWhichKey' { key = "<leader>n"; icon = md.lightning.bolt.Outline; group = "notifications"; })
      # search
      (mkWhichKey' { key = "<leader>s"; icon = md.text.search.Variant; group = "search"; mode = [ "n" "v" ]; })
      # ui
      (mkWhichKey' { key = "<leader>u"; icon = md.lightbulb.Outline; group = "ui"; })

      # -- Keys --
      # scratch
      (mkWhichKey' {
        key = "<leader>..";
        action.__raw = "function() Snacks.scratch() end";
        desc = "Toggle Scratch Bugger";
      })
      (mkWhichKey' {
        key = "<leader>..";
        action.__raw = "function() Snacks.scratch() end";
        desc = "Toggle Scratch Bugger";
      })
      # code
      (mkWhichKey' {
        key = "<leader>cr";
        action.__raw = "function() Snacks.rename.rename_file() end";
        desc = "Rename File";
      })
      # find
      (mkWhichKey' {
        key = "<leader>,";
        action.__raw = "function() Snacks.picker.buffers() end";
        desc = "Buffers";
      })
      (mkWhichKey' {
        key = "<leader>fb";
        action.__raw = "function() Snacks.picker.buffers() end";
        desc = "Buffers";
      })
      (mkWhichKey' {
        key = "<leader>fp";
        action.__raw = "function() Snacks.picker.projects() end";
        desc = "Projects";
        icon = md.book.open.page.variant.Outline;
      })
      # git
      (mkWhichKey' {
        key = "<leader>gb";
        action.__raw = "function Snacks.picker.git_log_line() end";
        desc = "Git Browse (copy)";
      })
      (mkWhichKey' {
        key = "<leader>gB";
        action.__raw = "function() Snacks.gitbrowse() end";
        desc = "Git Browse (open)";
        mode = [ "n" "x" ];
      })
      (mkWhichKey' {
        key = "<leader>gY";
        action.__raw = ''
          function()
            Snacks.gitbrowse({ open = function(url) vim.fn.setreg("+", url) end, notify = false })
          end
        '';
        desc = "Git Browse (copy)";
        mode = [ "n" "x" ];
      })
      (mkWhichKey' {
        key = "<leader>gc";
        action.__raw = "function() Snacks.picker.git_log() end";
        desc = "Git Log";
      })
      (mkWhichKey' {
        key = "<leader>gs";
        action.__raw = "function() Snacks.picker.git_status() end";
        desc = "Git Status";
      })
      (mkWhichKey' {
        key = "<leader>gS";
        action.__raw = "function() Snacks.picker.git_stash() end";
        desc = "Git Stach";
      })
      # grep
      (mkWhichKey' {
        key = "<leader>sb";
        action.__raw = "function() Snacks.picker.lines() end";
        desc = "Buffer Lines";
      })
      (mkWhichKey' {
        key = "<leader>sB";
        action.__raw = "function() Snacks.picker.grep_buffers() end";
        desc = "Grep Open Buffers";
      })
      # search
      (mkWhichKey' {
        key = ''<leader>s"'';
        action.__raw = "function() Snacks.picker.registers() end";
        desc = "Registers";
      })
      (mkWhichKey' {
        key = "<leader>s/";
        action.__raw = "function() Snacks.picker.search_history() end";
        desc = "Search History";
      })
      (mkWhichKey' {
        key = "<leader>sa";
        action.__raw = "function() Snacks.picker.autocmds() end";
        desc = "Autocmds";
      })
      (mkWhichKey' {
        key = "<leader>sc";
        action.__raw = "function() Snacks.picker.command_history() end";
        desc = "Command History";
      })
      (mkWhichKey' {
        key = "<leader>sC";
        action.__raw = "function() Snacks.picker.commands() end";
        desc = "Commands";
      })
      (mkWhichKey' {
        key = "<leader>sd";
        action.__raw = "function() Snacks.picker.diagnostics() end";
        desc = "Diagnostics";
      })
      (mkWhichKey' {
        key = "<leader>sD";
        action.__raw = "function() Snacks.picker.diagnostics_buffer() end";
        desc = "Buffer Diagnostics";
      })
      (mkWhichKey' {
        key = "<leader>sh";
        action.__raw = "function() Snacks.picker.help() end";
        desc = "Help Pages";
      })
      (mkWhichKey' {
        key = "<leader>sH";
        action.__raw = "function() Snacks.picker.highlights() end";
        desc = "Highlights";
      })
      (mkWhichKey' {
        key = "<leader>si";
        action.__raw = "function() Snacks.picker.icons() end";
        desc = "Icons";
      })
      (mkWhichKey' {
        key = "<leader>sj";
        action.__raw = "function() Snacks.picker.jumps() end";
        desc = "jumps";
      })
      (mkWhichKey' {
        key = "<leader>sk";
        action.__raw = "function() Snacks.picker.jumps() end";
        desc = "Keymaps";
      })
      (mkWhichKey' {
        key = "<leader>sl";
        action.__raw = "function() Snacks.picker.loclist() end";
        desc = "Location List";
      })
      (mkWhichKey' {
        key = "<leader>sm";
        action.__raw = "function() Snacks.picker.marks() end";
        desc = "Marks";
      })
      (mkWhichKey' {
        key = "<leader>sM";
        action.__raw = "function() Snacks.picker.man() end";
        desc = "Man Pages";
      })
      (mkWhichKey' {
        key = "<leader>su";
        action.__raw = "function() Snacks.picker.undo() end";
        desc = "Undotree";
      })
      # notifications
      (mkWhichKey' {
        key = "<leader>nn";
        action.__raw = "function() Snacks.notifier.show_history() end";
        desc = "Notification History";
      })
      (mkWhichKey' {
        key = "<leader>nd";
        action.__raw = "function() Snacks.notifier.hide() end";
        desc = "Dismiss Notifications";
        icon = md.select.Compare;
      })
      # ui
      (mkWhichKey' {
        key = "<leader>uC";
        action.__raw = "function() Snacks.picker.colorschemes() end";
        desc = "Colorschemes";
        icon = md.palette.Outline;
      })
    ];
  };
}
