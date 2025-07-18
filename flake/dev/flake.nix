{
  inputs = {
    # -- Essential --
    root.url = "path:../../";

    flake-parts.follows = "root/flake-parts";
    nixpkgs.follows = "root/nixpkgs";

    # -- Development --
    devshell.url = "github:numtide/devshell";
    devshell.inputs.nixpkgs.follows = "nixpkgs";

    pre-commit.url = "github:cachix/git-hooks.nix";
    pre-commit.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = _inputs: {};
}
