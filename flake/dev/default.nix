{inputs, ...}: {
  imports = [
    ./devshell
    inputs.pre-commit.flakeModule
  ];

  perSystem = {
    config,
    pkgs,
    ...
  }: {
    formatter = pkgs.alejandra;

    pre-commit = {
      check.enable = false;

      settings = {
        default_stages = ["manual" "pre-push"];

        hooks = {
          end-of-file-fixer.enable = true;
          trim-trailing-whitespace.enable = true;

          # -- Git --
          commitizen.enable = true;
          no-commit-to-branch.enable = false;
          no-commit-to-branch.settings.branch = ["main"];

          # -- Lua --
          luacheck.enable = true;

          # -- Misc --
          markdownlint = {
            enable = true;
            settings.configuration = {
              MD033.allowed_elements = ["h1" "code"];
              MD013.line_length = 120;
            };
          };

          pre-commit-hook-ensure-sops.enable = true;
          typos.enable = true;

          # -- Nix --
          alejandra.enable = true;
          deadnix = {
            enable = true;
            settings.edit = true;
          };
          statix.enable = true;
        };
      };
    };
  };
}
