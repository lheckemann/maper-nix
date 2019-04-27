{ stdenv, fetchurl, zlib, libpng, pkgconfig, glib, gtk2 }:
stdenv.mkDerivation rec {
  pname = "xmedcon";
  version = "0.16.1";
  src = fetchurl {
    url = "mirror://sourceforge/xmedcon/XMedCon-Source/${version}/${pname}-${version}.tar.bz2";
    sha256 = "049srl7hmxz00yy64j9ib371vl7ra32c6fm1dl5qx5r38023yzbn";
  };
  buildInputs = [ zlib libpng glib gtk2 ];
  nativeBuildInputs = [ pkgconfig ];
}
