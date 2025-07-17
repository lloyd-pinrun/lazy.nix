{ flake }: _final: prev: let
  nixpkgs-main-packages = flake.inputs.nixpkgs-main.legacyPackages.${prev.stdenv.system};
in {
  inherit (nixpkgs-main-packages) luaPackages vimPlugins;
}
