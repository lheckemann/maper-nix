{ stdenv, lib, fetchurl, cmake }:
stdenv.mkDerivation rec {
  version = "1.3.9";
  name = "nifty_reg-${version}";
  src = fetchurl {
    url = "mirror://sourceforge/niftyreg/${name}/${name}.tar.gz";
    sha256 = "07v9v9s41lvw72wpb1jgh2nzanyc994779bd35p76vg8mzifmprl";
  };
  buildInputs = [ cmake ];
  enableParallelBuilding = true;
}
