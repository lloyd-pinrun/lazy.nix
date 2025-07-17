{config, ...}: let
  inherit (config.lib.lazy) mkWhichKey';
  inherit (config.lib.nerdy) md;
in {
  config.lazy.spec = [
    (mkWhichKey' {
      key = "]t";
      action.__raw = ''
        function() require("todo-comments").jump_next() end
      '';
      desc = "Next Todo Comment";
      icon = md.page.next.Outline;
    })
    (mkWhichKey' {
      key = "[t";
      action.__raw = ''
        function() require("todo-comments").jump_prev() end
      '';
      desc = "Previous Todo Comment";
      icon = md.page.next.Outline;
    })
    (mkWhichKey' {
      key = "<leader>xt";
      action = "<cmd>Trouble todo toggle<cr>";
      desc = "Todo";
      icon = md.note.check.Outline;
    })
    (mkWhichKey' {
      key = "<leader>xT";
      action = ''
        <cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>
      '';
      desc = "Todo/Fix/Fixme";
      icon = md.note.alert.Outline;
    })
    (mkWhichKey' {
      key = "<leader>st";
      action = "<cmd>TodoTelescope";
      desc = "Todo";
      icon = md.clipboard.text.search.Outline;
    })
    (mkWhichKey' {
      key = "<leader>sT";
      action = "<cmd>TodoTelescope keywords=TODO,FIX,FIXME";
      desc = "Todo/Fix/Fixme";
      icon = md.clipboard.text.search.Outline;
    })
  ];
}
