{
  inputs,
  lib,
  ...
}: let
  inherit (lib) optional optionalAttrs;
in {
  imports = optional (inputs.pkgs-by-name-for-flake-parts ? flakeModule) inputs.pkgs-by-name-for-flake-parts.flakeModule;

  perSystem = {...}: optionalAttrs (inputs.pkgs-by-name-for-flake-parts ? flakeModule) {pkgsDirectory = ../packages;};
}
