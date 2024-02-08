{
  lib,
  fetchFromGitHub,
  python3Packages,
  SDL2,
  libGL,
  steamPackages,
  steam-run-native,
  pkgsCross,
  qt6,
  xorg,
  libglvnd,
}:
python3Packages.buildPythonApplication rec {
  pname = "truckersmp-cli";
  version = "0.10.2";

  src = fetchFromGitHub {
    repo = pname;
    owner = pname;
    rev = "a5fc6df4ac498c1b454a9305db326467b2d0906f";
    sha256 = "sha256-5BA4+937r4+cC9Ceil6ScC6AVtnRqVTlpzBA6vNbatc=";
  };

  postPatch = ''
    substituteInPlace truckersmp_cli/variables.py --replace \
      'libSDL2-2.0.so.0' '${SDL2}/lib/libSDL2.so'

    substituteInPlace truckersmp_cli/steamcmd.py --replace \
      'steamcmd_path = os.path.join(Dir.steamcmddir, "steamcmd.sh")' \
      'steamcmd_path = "${steamPackages.steamcmd}/bin/steamcmd"'

    substituteInPlace truckersmp_cli/utils.py --replace \
      '"""Download files."""' 'print(files_to_download)'

    substituteInPlace truckersmp_cli/utils.py --replace \
      '[(newpath, dest, md5), ]' \
      '[(newpath, dest["abspath"], md5), ]'

    ${pkgsCross.mingwW64.buildPackages.gcc}/bin/x86_64-w64-mingw32-gcc truckersmp-cli.c -o truckersmp_cli/truckersmp-cli.exe
  '';
  LD_LIBRARY_PATH = lib.makeLibraryPath [
    libGL
    xorg.libXext.dev
    xorg.libX11.dev
  ];
  nativeBuildInputs = [pkgsCross.mingwW64.buildPackages.gcc];

  buildInputs = [SDL2 steamPackages.steamcmd steamPackages.steam-runtime libGL libglvnd qt6.full];

  propagatedBuildInputs = with python3Packages; [vdf steam-run-native qt6.full];
}
