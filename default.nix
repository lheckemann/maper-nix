{ pkgs ? import <nixpkgs> {} }: with pkgs;
let
callPackage = newScope self;
self = {
  ants = callPackage ./ants.nix {};
  irtk = callPackage ./irtk.nix {};
  itk5 = callPackage ./itk5.nix {};
  kwstyle = callPackage ./kwstyle.nix {};
  nifty_reg = callPackage ./nifty_reg.nix {};
  nifty_seg = callPackage ./nifty_seg.nix {};
  nifty_seg_git = self.nifty_seg.overrideAttrs (o: {
    name = "nifty_seg-git";
    src = fetchFromGitHub {
      owner = "KCL-BMEIS";
      repo = "NiftySeg";
      rev = "87b29252443c37c5ac3827764256f21ad8d99e3f";
      sha256 = "01iyyf8j2p3m2siycdxscs3ss1b0clqnpasbxyggmsk87507xvii";
    };
  });
  xmedcon = callPackage ./xmedcon.nix {};
};
in self
