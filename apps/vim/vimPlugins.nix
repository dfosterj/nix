with import <nixpkgs> {};

let inherit (vimUtils) buildVimPluginFrom2Nix; in {
  
  "fzf" = buildVimPluginFrom2Nix {
    name = "fzf";
    src = fetchgit {
      url = "https://github.com/junegunn/fzf.vim";
      rev = "556f45e79ae5e3970054fee4c4373472604a1b4e";
      sha256 = "SIx6oPLEmikp2MTUjbNA11HqiXI4TZx1h8xjheu5kVw=";
    };
    postInstall = ''${pkgs.fzf}/bin/fzf#install()'';  # Ensures fzf is properly set up.
  };

}
