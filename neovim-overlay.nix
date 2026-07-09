{inputs}: final: prev:
with final.pkgs.lib; let
  pkgs = final;

  mkNvimPlugin = src: pname:
    pkgs.vimUtils.buildVimPlugin {
      inherit pname src;
      version = src.lastModifiedDate;
    };

  pkgs-locked = inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};

  mkNeovim = pkgs.callPackage ./mkNeovim.nix {
    inherit (pkgs-locked) wrapNeovimUnstable neovimUtils;
  };

  all-plugins = with pkgs.vimPlugins; [
    nvim-treesitter.withAllGrammars

    # Lazy Loading
    lze
    lzextras

    # Colorschemes
    vim-moonfly-colors

    # Images
    image-nvim

    telescope-nvim

    neorg

    # Git
    gitsigns-nvim
    neogit
    mini-diff

    lsp-format-nvim

    nvim-web-devicons

    autosave-nvim

    # Completions
    blink-cmp

    # Tab Bar
    bufferline-nvim

    # Status Line
    lualine-nvim

    # Startpage
    alpha-nvim

    # File Systems
    oil-nvim
    neo-tree-nvim

    # LaTeX
    vimtex
    (mkNvimPlugin inputs.ltex-ls-nvim-src "ltex-ls.nvim")
    ltex_extra-nvim

    # Haskell
    haskell-tools-nvim

    # Lean
    lean-nvim

    # Rust
    crates-nvim
    rustaceanvim

    (mkNvimPlugin inputs.direnv-nvim-src "direnv.nvim")
    (mkNvimPlugin inputs.neominimap-nvim-src "neominimap.nvim")
  ];

  extraPackages = with pkgs; [
    # LSPs
    nil
    nixd
    lua-language-server
    ltex-ls
    rust-analyzer
    haskellPackages.haskell-language-server
    ghc
  ];
in {
  wrapped-nvim = mkNeovim {
    plugins = all-plugins;
    inherit extraPackages;
  };
}
