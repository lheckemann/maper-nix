{ stdenv, lib, fetchurl, cmake, unzip }:
stdenv.mkDerivation rec {
  version = "0.9.4";
  name = "nifty_seg-${version}";
  src = fetchurl {
    url = "mirror://sourceforge/niftyseg/NiftySeg_${version}.zip";
    sha256 = "1rmf2aakcw203w42gy3zlyl53xqrq8ps7w953880r847xadmvdz7";
  };
  unpackPhase = ''
    mkdir src
    cd src
    unzip $src
  '';
  buildInputs = [ cmake unzip ];
  enableParallelBuilding = true;
}
