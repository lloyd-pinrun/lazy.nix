{config, ...}: let
  inherit (config.lib.lazy) icons;

  fgColor =
    if config.lib ? stylix
    then config.lib.stylix.colors.withHashtag.base05
    else "#ff9e64";
in {
  plugins.lualine.settings.sections = {
    lualine_a = [
      {
        __unkeyed = "fileformat";
        cond = null;
        padding.left = 1;
        padding.right = 2;
      }
    ];

    lualine_b = ["encoding"];

    lualine_c = [
      {
        __unkeyed = "b:gitsigns_head";
        icon = icons.git.Branch;
        color.gui = "bold";
      }
      {
        __unkeyed = "diff";
        source.__raw = ''
          function()
            local gitsigns = vim.b.gitsigns_stats_dict
            if gitsigns then
              return {
                added = gitsigns.added,
                modified = gitsigns.changed,
                removed = gitsigns.removed,
              }
            end
          end
        '';

        symbols = {
          error = icons.diagnostics.BoldError + " ";
          warn = icons.diagnostics.BoldWarning + " ";
          info = icons.diagnostics.BoldInformation + " ";
          hint = icons.diagnostics.BoldHint + " ";
        };
      }
    ];

    lualine_x = [
      {
        color = {fg = fgColor;};
        cond.__raw = ''
          function()
            local ok, noice = pcall(require, "noice")
            if not ok then
              return false
            end
            return noice.api.status.mode.has()
          end
        '';
        __unkeyed.__raw = ''
          function()
            local ok, noice = pcall(require, "noice")
            if not ok then
              return false
            end
            return noice.api.status.mode.get()
          end
        '';
      }
      {
        __unkeyed.__raw = ''
          function()
            local clients = vim.lsp.get_clients()
            local lsp_names = {}
            if next(clients) == nil then
              return "Ls Inactive"
            end
            for _, client in ipairs(clients) do
              if client.name ~= "copilot" and client.name ~= "null-ls" and client.name ~= "typos_lsp" then
                local name = client.name:gsub("%[%d+%]", "") -- makes otter-ls[number] -> otter-ls
                table.insert(lsp_names, name)
              end
            end

            local formatters = require("conform").list_formatters()
            local con_names = {}

            for _, formatter in ipairs(formatters) do
              local name = formatter.name
              if formatter.available and (name ~= "squeeze_blanks" and name ~= "trim_whitespace" and name ~= "trim_newlines") then
                table.insert(con_names, formatter.name)
              end
            end
            local names = {}
            vim.list_extend(names, lsp_names)
            vim.list_extend(names, con_names)
            return "[" .. table.concat(vim.fn.uniq(names), ", ") .. "]"
          end
        '';
      }

      {
        __unkeyed = "filetype";
        cond = null;
        padding = {
          left = 1;
          right = 1;
        };
      }
    ];

    lualine_y = ["progress"];
    lualine_z = [
      "location"
      {
        __unkeyed.__raw = ''
          function()
            local lsp_clients = vim.lsp.get_clients()
            for _, client in ipairs(lsp_clients) do
              if client.name == "copilot" then
                return "%#SLGreen#" .. "${icons.git.Copilot}"
              end
            end

            return ""
          end
        '';
      }
    ];
  };
}
