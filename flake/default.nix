{
  inputs,
  lib,
  self,
  ...
}:
{
  imports = [
    inputs.flake-parts.flakeModules.partitions

    ./nixvim.nix
    ./overlays.nix
    ./pkgs-by-name.nix
  ];

  partitions = {
    dev = {
      module = ./dev;
      extraInputsFlake = ./dev;
    };
  };

  partitionedAttrs = {
    checks = "dev";
    devShells = "dev";
    formatter = "dev";
  };

  perSystem =
    {
      config,
      system,
      ...
    }:
    {
      _module.args.pkgs = import inputs.nixpkgs {
        inherit system;
        overlays = lib.attrValues self.overlays;
        config.allowUnfree = true;
      };

      packages.default = config.packages.lazy-nixvim;
    };
}
