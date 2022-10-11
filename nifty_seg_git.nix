{ stdenv, lib, fetchFromGitHub, pkg-config, cmake, zlib, eigen }:
stdenv.mkDerivation rec {
  version = "git";
  name = "nifty_seg-${version}";
  src = fetchFromGitHub {
    owner = "KCL-BMEIS";
    repo = "NiftySeg";
    rev = "87b29252443c37c5ac3827764256f21ad8d99e3f";
    sha256 = "01iyyf8j2p3m2siycdxscs3ss1b0clqnpasbxyggmsk87507xvii";
  };
  buildInputs = [ cmake eigen zlib ];
  nativeBuildInputs = [ pkg-config ];
  enableParallelBuilding = true;
  cmakeFlags = ["-DBUILD_Z=OFF"];
}
