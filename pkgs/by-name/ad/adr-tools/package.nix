{ lib, stdenv, fetchurl, testers, adr-tools }:

stdenv.mkDerivation rec {
  pname = "adr-tools";
  version = "3.0.0";

  src = fetchurl {
    url = "https://github.com/npryce/${pname}/archive/refs/tags/${version}.tar.gz";
    hash = "sha256-lJDzGkV8JTxBEzE+1jUu/L+PkklwowmghIiDO5wyXXw=";
  };

  sourceRoot = "${pname}-${version}/src";

  postInstall = ''
    mkdir -p $out/bin
    cp -r ./* $out/bin
  '';

  meta = with lib; {
    homepage = "https://github.com/npryce/${pname}";
    description = "CLI tool for working with Architecture Decision Records";
    license = licenses.gpl3;
    maintainers = [ maintainers.bbb ];
    mainProgram = "adr";
  };
}
