{ config, lib, ... }: let
  inherit (config.plugins) illuminate;
  inherit (config.plugins) indent-blankline;
  inherit (config.plugins) mini;

  inherit (lib) hasAttr optionalString;
in {
  plugins = {
    snacks = {
      enable = true;

      settings = {
        bigfile = {
          enabled = true;
          size = 1024 * 1024; # 1MB
          setup.__raw = ''
            function(ctx)
              ${optionalString indent-blankline.enable ''require("ibl").setup_buffer(0, { enabled = false })''}
              ${optionalString (hasAttr "indentscope" mini.modules) ''vim.b.miniindentscope_disable = true''}
              ${optionalString illuminate.enable ''require("illuminate").pause_buf()''}

              -- Disable line numbers and relative line numbers
              vim.cmd("setlocal nonumber norelativenumber")

              -- Syntax highlighting
              vim.schedule(function()
                vim.bo[ctx.buf].syntax = ctx.ft
              end)

              -- Disable matchparen
              vim.cmd("let g:loaded_matchparen = 1")

              -- Disable cursor line and column
              vim.cmd("setlocal nocursorline nocursorcolumn")

              -- Disable folding
              vim.cmd("setlocal nofoldenable")

              -- Disable sign column
              vim.cmd("setlocal signcolumn=no")

              -- Disable swap file and undo file
              vim.cmd("setlocal noswapfile noundofile")

              -- Disable mini animate
              vim.b.minianimate_disable = true
            end
          '';
        };
      };
    };
  };
}
