{ config, lib, ... }: let
  inherit (config.lib.lazy) icons mkWhichKey';

  pretty_path = {
    __raw = ''
      opts = vim.tbl_extend("force", {
        relative = "cwd",
        modified_hl = "MatchParen",
        directory_hl = "",
        filename_hl = "Bold",
        modified_sign = "",
        readonly_icon = " ${icons.ui.Lock} ",
        length = 3,
      }, opts or {})

      return function(self)
        local path = vim.fn.expand("%:p") --[[@as string]]

        if path == "" then
          return ""
        end

        path = LazyVim.norm(path)
        local root = LazyVim.root.get({ normalize = true })
        local cwd = vim.fs.normalize((vim.uv or vim.loop).cwd() or ".")

        if opts.relative == "cwd" and path:find(cwd, 1, true) == 1 then
          path = path:sub(#cwd + 2)
        elseif path:find(root, 1, true) == 1 then
          path = path:sub(#root + 2)
        end

        local sep = package.config:sub(1, 1)
        local parts = vim.split(path, "[\\/]")

        if opts.length == 0 then
          parts = parts
        elseif #parts > opts.length then
          parts = { parts[1], "…", unpack(parts, #parts - opts.length + 2, #parts) }
        end

        if opts.modified_hl and vim.bo.modified then
          parts[#parts] = parts[#parts] .. opts.modified_sign
          parts[#parts] = M.format(self, parts[#parts], opts.modified_hl)
        else
          parts[#parts] = M.format(self, parts[#parts], opts.filename_hl)
        end

        local dir = ""
        if #parts > 1 then
          dir = table.concat({ unpack(parts, 1, #parts - 1) }, sep)
          dir = M.format(self, dir .. sep, opts.directory_hl)
        end

        local readonly = ""
        if vim.bo.readonly then
          readonly = M.format(self, opts.readonly_icon, opts.modified_hl)
        end
        return dir .. parts[#parts] .. readonly
      end
    '';
  };
in {
  plugins.lualine = {
    enable = true;
    lazyLoad.settings.event = [
      "VimEnter"
      "BufReadPost"
      "BufNewFile"
    ];

    settings = {
      options = {
        disabled_filetypes = {
          __unkeyed-1 = "startify";
          __unkeyed-2 = "neo-tree";
          __unkeyed-3 = "copilot-chat";
          __unkeyed-4 = "ministarter";
          __unkeyed-5 = "Avante";
          __unkeyed-6 = "AvanteInput";
          __unkeyed-7 = "trouble";
          __unkeyed-8 = "dapui_scopes";
          __unkeyed-9 = "dapui_breakpoints";
          __unkeyed-10 = "dapui_stacks";
          __unkeyed-11 = "dapui_watches";
          __unkeyed-12 = "dapui_console";
          __unkeyed-13 = "dashboard";
          __unkeyed-14 = "snacks_dashboard";
          __unkeyed-15 = "AvanteSelectedFiles";
          winbar = [
            "aerial"
            "dap-repl"
            "neotest-summary"
          ];
        };

        globalstatus = true;
      };

      sections = {
        lualine_a = [ "mode" ];
        lualine_b = [ "branch" ];
        lualine_c = [ "filename" "diff" ];

        lualine
      };
    };
  };
}
