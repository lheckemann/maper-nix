{ stdenv, lib, fetchFromGitHub, pkgconfig, cmake, zlib, eigen }:
stdenv.mkDerivation rec {
  version = "1.0";
  name = "nifty_seg-${version}";
  src = fetchFromGitHub {
    owner = "KCL-BMEIS";
    repo = "NiftySeg";
    rev = "v${version}";
    sha256 = "0zyjfk707i0p6zsipbj5bl2a2zkyx6r3ndviqg7daxx5b2mn2fql";
  };
  buildInputs = [ cmake eigen zlib ];
  nativeBuildInputs = [ pkgconfig ];
  cmakeFlags = ["-DBUILD_Z=OFF"];
  enableParallelBuilding = true;
}
