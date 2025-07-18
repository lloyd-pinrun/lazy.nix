{inputs, ...}: {
  imports = [inputs.devshell.flakeModule];

  perSystem = {
    config,
    pkgs,
    self',
    system,
    ...
  }: let
    inherit (pkgs.lib) getExe getName;
  in {
    devshells.default = {
      startup.pre-commit.text = config.pre-commit.installationScript;
      packages = with pkgs; [config.formatter nix-inspect];

      env = [
        {
          name = "NIX_PATH";
          eval = "nixpkgs=$NIXPKGS_PTH:\${NIX_PATH:-";
        }
      ];

      commands = let
        nix = with pkgs; ''
          $([ "$\{LAZY_NIX_NOM:-0}" = '1' ] && echo ${getExe nix-output-monitor} || echo nix)
        '';
      in [
        {
          name = "checks";
          help = "Run all pre-commit checks";
          command = ''
            echo "=> Running all pre-commit checks..."

            ${nix} flake check "$@"
          '';
        }
        (let
          inherit (config) formatter;
          formatterName = getName formatter;
        in {
          name = "format";
          help = "Run the formatter. Configured formatter: ${formatterName}";
          command = getExe formatter;
        })
        {
          name = "test";
          help = "Run lazy.nix tests";
          command = ''
            echo "=> Running lazy.nix tests..."

            export LAZY_NIX_SYSTEM=${system}
            export LAZY_NIX_COMMAND=${nix}
            ${./tools/test.py} "$@"
          '';
        }
        {
          name = "new";
          help = "Create a new plugin or extra";
          command = ''${./tools/plugins.py} "$@"'';
        }
        # TODO: "test-lib", see: https://github.com/nix-community/nixvim/blob/bc0555c8694d43fb63ae2c7afec08b6987431a04/flake/dev/devshell.nix#L69-L77
        # TODO: create docuemtation to build
        # {
        #   name = "docs";
        #   help = "Build lazy.nix documentation";
        #   command = ''
        #     echo "=> Building lazy.nix documentation..."
        #     ${nix} build .#docs "$@"
        #   '';
        # }
      ];
    };
  };
}
