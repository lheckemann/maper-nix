{ stdenv, fetchFromGitHub, cmake, libX11, libuuid, xz, vtk }:

stdenv.mkDerivation rec {
  pname = "itk";
  version = "5.0rc02";

  src = fetchFromGitHub {
    owner = "InsightSoftwareConsortium";
    repo = "ITK";
    rev = "5b980e51d3da940abd12489f95933a0ba1306bde";
    sha256 = "17lhjxbs153fffcpdpc563a21v54agdah3k54yfy1hnv459jshxc";
  };

  cmakeFlags = [
    "-DBUILD_EXAMPLES=OFF"
    "-DBUILD_SHARED_LIBS=ON"
    "-DModule_ITKMINC=ON"
    "-DModule_ITKIOMINC=ON"
    "-DModule_ITKIOTransformMINC=ON"
    "-DModule_ITKVtkGlue=ON"
    "-DModule_ITKReview=ON"
    "-DITK_USE_KWSTYLE=OFF"
    "-DBUILD_TESTING=OFF"
  ];

  enableParallelBuilding = true;

  nativeBuildInputs = [ cmake xz ];
  buildInputs = [ libX11 libuuid vtk ];

  meta = {
    description = "Insight Segmentation and Registration Toolkit";
    homepage = http://www.itk.org/;
    license = stdenv.lib.licenses.asl20;
    maintainers = with stdenv.lib.maintainers; [viric];
    platforms = with stdenv.lib.platforms; linux ++ darwin;
  };
}
