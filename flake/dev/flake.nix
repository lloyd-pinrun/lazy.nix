{
  description = "Private inputs for development purposes.";

  inputs = {
    # -- Essential --
    root.url = "path:../../";
    flake-parts.follows = "root/nixpkgs";
    nixpkgs.follows = "root/nixpkgs";

    # -- Dev Tools --
    just.url = "github:lloyd-pinrun/just.nix";
    just.inputs = {
      flake-parts.follows = "flake-parts";
      nixpkgs.follows = "nixpkgs";
      pre-commit.follows = "pre-commit";
    };

    pre-commit.url = "github:cachix/git-hooks.nix";
    pre-commit.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs: {};
}
