{ pkgs ? import <nixpkgs> {} }: with pkgs;
rec {
  irtk = callPackage ./irtk.nix {};
  nifty_reg = callPackage ./nifty_reg.nix {};
  nifty_seg = callPackage ./nifty_seg.nix {};
  pincram = callPackage ./pincram.nix { inherit irtk; };
}
