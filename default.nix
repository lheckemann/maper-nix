{ pkgs ? import <nixpkgs> {} }: with pkgs;
rec {
  irtk = callPackage ./irtk.nix {};
  nifty_reg = callPackage ./nifty_reg.nix {};
  nifty_seg = callPackage ./nifty_seg.nix {};
  nifty_seg_git = callPackage ./nifty_seg_git.nix {};
  pincram = callPackage ./pincram.nix { inherit irtk; };
}
