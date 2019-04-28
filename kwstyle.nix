{ stdenv, fetchFromGitHub, cmake }:
stdenv.mkDerivation {
  pname = "kwstyle";
  version = "unstable-2019-03-20";
  src = fetchFromGitHub {
    owner = "Kitware";
    repo = "KWStyle";
    rev = "fbe28d952d81f0f4ec57b3cd80c529fa2e7fa192";
    sha256 = "1rm903sr0a7j1id3x7dfyd4c2bf4da04wgcf9k8sybdsazkg2y2g";
  };
  nativeBuildInputs = [ cmake ];
}
