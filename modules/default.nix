{
  lib,
  self,
  ...
}: let
  inherit (lib) attrValues;
in {
  imports = [./lazy];

  nixpkgs = {
    overlays = attrValues self.overlays;
    config.allowUnfree = true;
  };
}
