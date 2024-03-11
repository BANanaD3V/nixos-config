{
  lib,
  stdenv,
  fetchFromGitHub,
  nixosTests,
  iptables,
  iproute2,
  makeWrapper,
  openresolv,
  procps,
  bash,
  wireguard-go,
}:
stdenv.mkDerivation rec {
  pname = "amneziawg-tools";
  version = "v1.0.20240213";

  src = fetchFromGitHub {
    repo = "${pname}";
    owner = "amnezia-vpn";
    rev = "${version}";
    sha256 = "133im9l17ij8s3z47sjrlhqw2pj5xdnvmc7gkghfxr0r1c8402s1";
  };

  outputs = ["out" "man"];

  sourceRoot = "${src.name}/src";
  nativeBuildInputs = [makeWrapper];
  buildInputs = [bash];
  postFixup =
    ''
      substituteInPlace $out/lib/systemd/system/awg-quick@.service \
        --replace /usr/bin $out/bin
    ''
    + lib.optionalString stdenv.isLinux ''
      for f in $out/bin/*; do
        # Which firewall and resolvconf implementations to use should be determined by the
        # environment, we provide the "default" ones as fallback.
        wrapProgram $f \
          --prefix PATH : ${lib.makeBinPath [procps iproute2]} \
          --suffix PATH : ${lib.makeBinPath [iptables openresolv]}
      done
    ''
    + lib.optionalString stdenv.isDarwin ''
      for f in $out/bin/*; do
        wrapProgram $f \
          --prefix PATH : ${lib.makeBinPath [wireguard-go]}
      done
    '';
  makeFlags = [
    "DESTDIR=$(out)"
    "PREFIX=/"
    "WITH_BASHCOMPLETION=yes"
    "WITH_SYSTEMDUNITS=yes"
    "WITH_WGQUICK=yes"
  ];
}
