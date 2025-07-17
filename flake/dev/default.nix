{inputs, ...}: {
  imports = [
    inputs.just.flakeModule
    inputs.pre-commit.flakeModule
  ];

  perSystem = {
    config,
    pkgs,
    ...
  }: let
    inherit (config) just;
  in {
    formatter = pkgs.alejandra;

    just = {
      enable = true;
      recipes = {
        "format" = "nix fmt .";
        "check *ARGS" = "pre-commit run --all-files --hook-stage manual {{ ARGS }}";
      };
    };

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

    devShells.default = pkgs.mkShell {
      name = "lazy.nix development shell";
      inputsFrom = [just.devShell];
      shellHook = ''
        ${config.pre-commit.installationScript}
        echo 1>&2 "$(id -un) | $(nix eval --raw --impure --expr 'builtins.currentSystem') | $(uname -r) "
      '';
    };
  };
}
