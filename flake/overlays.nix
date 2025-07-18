{
  inputs,
  lib,
  ...
}: let
  inherit (lib) filterAttrs hasSuffix listToAttrs pipe removeSuffix;

  overlayFiles = pipe ../overlays [
    builtins.readDir
    (filterAttrs (name: type: type == "regular" && hasSuffix ".nix" name))
    builtins.attrNames
  ];
in {
  flake.overlays = listToAttrs (builtins.map (filename: {
      name = removeSuffix ".nix" filename;
      value = import (../overlays + "/${filename}") {flake = inputs.self;};
    })
    overlayFiles);
}
