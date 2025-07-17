{ config, lib, ... }: let
  inherit (config.lib.lazy)
    icons
    mkWhichKey'
    ;

  inherit (lib) mkForce;

  mouse = {
    right = "'verticle sbuffer %d'";
    close = ''
      function(bufnum)
        require("mini.bufremove").delete(bufnum)
      end
    '';
  };
in {
  plugins = {
    bufferline = {
      enable = mkForce true;
      lazyLoad.settings.event = "DeferredUIEnter";

      settings = {
        options = {
          mode = "buffers";
          always_show_bufferline = true;

          buffer_close_icon = icons.ui.close.circle.Outline;
          close_command.__raw = mouse.close;
          close_icon = icons.ui.close.circle.Outline;

          diagnostics = "nvim_lsp";
          diagnostics_indicator = ''
            function(count, level, diagnostics_dict, context)
              local s = ""
              for e, n in pairs(diagnostics_dict) do
                local sym = e == "error" and " ${icons.diagnostics.BoldError}"
                  or (e == "warning" and "${icons.diagnostics.Warning} " or "" )
                if(sym ~= "") then
                  s = s .. " " .. n .. sym
                end
              end
              return s
            end
          '';
          
          # NOTE: ensures bufferline names are all unique
          enforce_regular_tabs = false;

          indicator = {
            style = "icon";
            icon = icons.ui.BoldLineLeft;
          };

          left_trunc_marker = icons.ui.arrow.circle.outline.Left;
          max_name_length = 18;
          max_prefix_length = 15;
          modified_icon = icons.git.FileUntracked;

          numbers.__raw = ''
            function(opts)
              return string.format('%s·%s', opts.raise(opts.id), opts.lower(opts.ordinal))
            end
          '';

          persist_buffer_sort = true;
          right_mouse_command.__raw = mouse.right;
          right_trunc_marker = icons.ui.arrow.circle.outline.Right;
          separator_style = "slant";
          show_buffer_close_icons = true;
          show_buffer_icons = true;
          show_close_icon = true;
          show_tab_indicators = true;
          sort_by = "extension";
          tab_size = 18;

          offsets = [
            {
              filetype = "neo-tree";
              text = "File Explorer";
              text_align = "center";
              highlight = "Directory";
            }
          ];
        }; 
      };
    };
  };

  lazy.spec = [
    (mkWhichKey' {
      key = "<leader>bp";
      action = "<cmd>BufferLineTogglePin<cr>";
      desc = "Toggle Pin";
      icon = icons.ui.pin.On;
    })
    (mkWhichKey' {
      key = "<leader>bP";
      action = "<cmd>BufferLineGroupClose ungrouped<cr>";
      desc = "Delete Non-Pinned Buffers";
      icon = icons.ui.pin.Off;
    })
    (mkWhichKey' {
      key = "<leader>bs";
      group = "sort";
      icon = icons.ui.Sort;
    })
    (mkWhichKey' {
      key = "<leader>bsd";
      action = "<cmd>BufferLineSortByDirectory<cr>";
      desc = "Sort By Directory";
      icon = icons.ui.folders.outlined.Default;
    })
    (mkWhichKey' {
      key = "<leader>bsD";
      action = "<cmd>BufferLineSortByRelativeDirectory<cr>";
      desc = "Sort By Relative Directory";
      icon = icons.ui.folders.outlined.Root;
    })
    (mkWhichKey' {
      key = "<leader>bse";
      action = "<cmd>BufferLineSortByExtension<cr>";
      desc = "Sort By Extension";
      icon = icons.ui.files.outlined.Code;
    })
    (mkWhichKey' {
      key = "[b";
      action = "<cmd>BufferLineCyclePrev<cr>";
      desc = "Prev Buffer";
      icon = icons.ui.arrow.Left;
    })
    (mkWhichKey' {
      key = "]b";
      action = "<cmd>BufferLineCycleNext<cr>";
      desc = "Next Buffer";
      icon = icons.ui.arrow.Right;
    })
    (mkWhichKey' {
      key = "[B";
      action = "<cmd>BufferLineMovePrev<cr>";
      desc = "Move Buffer Left";
      icon = icons.ui.arrow.toggle.Left;
    })
    (mkWhichKey' {
      key = "]B";
      action = "<cmd>BufferLineMoveNext<cr>";
      desc = "Move Buffer Right";
      icon = icons.ui.arrow.toggle.Right;
    })
  ];
}

