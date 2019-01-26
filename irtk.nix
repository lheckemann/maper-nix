{ stdenv, cmake, lib, gsl, fltk, boost, libGL, freeglut, xorg, libjpeg, gtest, fetchFromGitHub }:
stdenv.mkDerivation rec {
  version = "1.0";
  name = "irtk-${version}";
  src = fetchFromGitHub {
    owner = "BioMedIA";
    repo = "IRTK";
    rev = "v${version}";
    sha256 = "0xla7rppc651cjkwzzyfnbjjq9q36s077i64fy4vy4vgj1aaxv81";
  };

  cmakeFlags = lib.optional (!doCheck) "-DBUILD_TESTS=OFF";

  # Tests are not reproducible, depend on impure hard-coded paths
  doCheck = false;

  preConfigure = if doCheck then ''
    export NIX_LDFLAGS="$NIX_LDFLAGS -lgtest"
  '' else "";

  checkPhase = ''
    make test
  '';

  enableParallelBuilding = true;
  buildInputs = [ cmake gsl fltk boost libGL freeglut xorg.libXmu libjpeg gtest ];
}
