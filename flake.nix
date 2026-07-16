{
  description = "A Neovim Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    # gen-luarc.url = "github:mrcjkb/nix-gen-luarc-json";

    neovim = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    direnv-nvim-src = {
      url = "github:NotAShelf/direnv.nvim";
      flake = false;
    };

    ltex-ls-nvim-src = {
      url = "github:vigoux/ltex-ls.nvim";
      flake = false;
    };

    neominimap-nvim-src = {
      url = "github:Isrothy/neominimap.nvim";
      flake = false;
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    flake-utils,
    neovim,
    ...
  }: let
    systems = builtins.attrNames nixpkgs.legacyPackages;
    neovim-overlay = import ./neovim-overlay.nix {inherit inputs;};
  in
    flake-utils.lib.eachSystem systems (
      system: let
        pkgs = import nixpkgs {
          # config.allowUnfree = true;
          system = "${system}";
          overlays = [neovim.overlays.default neovim-overlay];
        };
      in {
        packages = rec {
          nvim = pkgs.nvim-pkg;
          default = nvim;
        };

        apps = rec {
          nvim = {
            type = "app";
            program = "${pkgs.nvim-pkg}/bin/nvim";
          };

          default = nvim;
        };
      }
    )
    // {
      overlays.default = neovim-overlay;
    };
}
