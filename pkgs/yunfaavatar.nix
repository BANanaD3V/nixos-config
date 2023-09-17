{ lib, stdenvNoCC, fetchFromGitHub, bash, makeWrapper, pciutils
, x11Support ? true, ueberzug, fetchpatch
}:
stdenvNoCC.mkDerivation rec {
  pname = "yunfaavatar";
  version = "unstable-2023-09-15";

  src = fetchFromGitHub {
    owner = "yunfachi";
    repo = "yunfaAvatar";
    rev = "bf8ea66e981712e5201aeea49fa005836408f45f";
    sha256 = "sha256-JbolO1I4K9+RBFJ/U611En4Rx5cG2+z1IcxYEeiaq6Q=";
  };
  
  outputs = [ "out" "man" ];

  strictDeps = true;
  buildInputs = [ bash ];
  nativeBuildInputs = [ makeWrapper ];

  makeFlags = [
    "PREFIX=${placeholder "out"}"
    "SYSCONFDIR=${placeholder "out"}/etc"
  ];

  meta = with lib; {
    description = "blablabla";
    homepage = "https://github.com/yunfachi/yunfaAvatar"; 
    license = licenses.mit;
    platforms = platforms.all;
    maintainers = with maintainers; [ yunfachi ];
    mainProgram = "yunfaavatar";
  };
}
