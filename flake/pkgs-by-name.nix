{ inputs, lib, ... }: let
  inherit (lib) optional;
in {
  imports = optional (inputs.pkgs-by-name-for-flake-parts ? flakeModule) inputs.pkgs-by-name-for-flake-parts.flakeModule;

  perSystem = { lib, ... }: let
    inherit (lib) optionalAttrs;
  in
    optionalAttrs (inputs.pkgs-by-name-for-flake-parts ? flakeModule) {
      pkgsDirectory = ../packages;
    };
}
