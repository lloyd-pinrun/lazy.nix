{
  description = "lloyd's neovim config";

  inputs = {
    # -- Essential --
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";

    systems.url = "github:nix-systems/default";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs = {
      flake-parts.follows = "flake-parts";
      nixpkgs.follows = "nixpkgs";
    };

    nerdy.url = "github:lloyd-pinrun/nerdy.nix";
    nerdy.inputs = {
      flake-parts.follows = "flake-parts";
      nixpkgs.follows = "nixpkgs";
    };

    pkgs-by-name-for-flake-parts.url = "github:drupol/pkgs-by-name-for-flake-parts";

    # -- Packages --
    # avante.url = "github:yetone/avante.nvim";
    # avante.flake = false;
    #
    # snacks.url = "github:folke/snacks.nvim";
    # snacks.flake = false;
  };

  outputs = inputs: let
    systems = import inputs.systems;
  in
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      inherit systems;

      imports = [./flake];
      # perSystem = { inputs', lib, pkgs, self', ...}: let
      # inherit (inputs'.nixvim.packages.default) makeNixvimWithModule;
      # inherit (inputs'.nixvim.lib) check;
      # inherit (inputs'.pre-commit-hooks.lib) run;
      #
      # nixvimModule = {
      #   inherit pkgs;
      #   # module = import ./default.nix;
      #   # imports = [ ./config ./extras ];
      #   specialArgs = { inherit lib self; };
      # };
      #
      # nvim = makeNixvimWithModule nixvimModule;
      # in {
      # imports = [ ./flake ];
      # checks = {
      #   default = check.mkTestDerivationFromNixvimModule nixvimModule;
      #   pre-commit-check = run {
      #     src = ./.;
      #     hooks = {
      #       statix.enable = true;
      #       alejandro.enable = true;
      #     };
      #   };
      # };
      #
      # packages.default = nvim;
      # };
    };
}
