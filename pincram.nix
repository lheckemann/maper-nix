{ stdenv, lib, fetchurl, makeWrapper, irtk }:
stdenv.mkDerivation rec {
  version = "0.2.15";
  name = "pincram-${version}";
  src = lib.cleanSource ./pincram;

  buildInputs = [ makeWrapper ];
  installPhase = ''
    mkdir -p $out/bin $out/share/pincram
    cp pincram pincram.sh $out/bin
    cp * $out/share/pincram

    wrapProgram $out/bin/pincram.sh --prefix PATH : ${irtk}/bin:$out/libexec
    wrapProgram $out/bin/pincram --prefix PATH : $out/bin:$out/libexec
  '';
}
