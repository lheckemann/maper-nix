{ stdenv, fetchFromGitHub, cmake, zlib, itk5, kwstyle, git }:
stdenv.mkDerivation rec {
  pname = "ANTs";
  /* v2.3.1 doesn't build for... reasons?
  version = "2.3.1";
  src = fetchFromGitHub {
    owner = "ANTsX";
    repo = "ANTs";
    rev = "v${version}";
    sha256 = "095n6pnjj6bjxmximwz7yjldisq2k3d3pz3lk8nlmq1r9gsi5zqw";
  }; */
  version = "git-2019-04-09";
  src = fetchFromGitHub {
    owner = "antsx";
    repo = "ants";
    rev = "2d54c16a93a0b6ff83f37dc779b421a3ec18840c";
    sha256 = "1lqsdmivpkdx2kcwbslwbk3dcg3kivh2ng931bcg0wjjfqrsxjkj";
  };
  cmakeFlags = [
    "-DUSE_SYSTEM_KWStyle=ON"
    "-DBUILD_TESTING=OFF"
    "-DITK_DIR=${itk5}"
    "-DCMAKE_CXX_FLAGS=-fpermissive"
    "-DBUILD_SHARED_LIBS=ON"
  ];

  installPhase = ''
    mkdir -p $out
    cp -r bin lib $out/
  '';

  noAuditTmpdir = true;
  nativeBuildInputs = [ cmake kwstyle git ];
  buildInputs = [ zlib itk5 ];
}
