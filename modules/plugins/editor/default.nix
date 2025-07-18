{lib, ...}: let
  inherit (lib) mkForce;

  enable = mkForce true;
in {
  imports = [
    ./flash.nix
    ./grug-far.nix
    ./todo-comments.nix
    ./trouble.nix
    ./which-key.nix
  ];

  plugins = {
    flash = {
      # inherit enable;
      enable = false;
      lazyLoad.settings.event = "DeferredUIEnter";
    };

    grug-far = {
      inherit enable;
      lazyLoad.settings.cmd = ["GrugFar"];
    };

    todo-comments = {
      inherit enable;
      lazyLoad.settings.cmd = ["TodoTrouble" "TodoTelescope"];
    };

    trouble = {
      inherit enable;
      lazyLoad.settings.cmd = ["Trouble"];
    };

    which-key = {
      inherit enable;
      lazyLoad.settings.event = "DeferredUIEnter";
    };
  };
}
