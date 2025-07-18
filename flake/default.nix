{
  flake-parts-lib,
  inputs,
  lib,
  self,
  ...
}: let
  inherit (lib) attrValues;
in {
  imports = [
    ./nixvim.nix
    ./overlays.nix
    ./pkgs-by-name.nix

    inputs.flake-parts.flakeModules.partitions
  ];

  partitions.dev.extraInputsFlake = ./dev;
  partitions.dev.module = ./dev;

  partitionedAttrs = {
    checks = "dev";
    formatter = "dev";
  };

  perSystem = {
    config,
    system,
    ...
  }: {
    _module.args.pkgs = import inputs.nixpkgs {
      inherit system;

      overlays = attrValues self.overlays;
      config = {
        allowUnfree = true;
        allowAliases = false;
      };
    };

    packages.default = config.packages.lazy;
  };
}
