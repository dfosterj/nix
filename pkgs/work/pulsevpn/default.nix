{ pkgs, makeWrapper, ... }:

let
  # Directly define runtime paths from pkgs without nesting
  runtimePaths = pkgs.lib.makeBinPath [
    pkgs.chromedriver
    pkgs.chromium
    pkgs.gawk
    pkgs.inetutils
    pkgs.nettools
    pkgs.openconnect
    pkgs.procps
  ];
in
pkgs.stdenv.mkDerivation rec {
  pname = "openconnect-pulse-launcher";
  version = "1.0";

  # Define the source for the Python script
  src = ./openconnect-pulse-launcher.py;

  dontUnpack = true;

  nativeBuildInputs = [
    pkgs.makeWrapper
  ];

  propagatedBuildInputs = [
    pkgs.python3.withPackages (pythonPackages: with pythonPackages; [
      selenium
      psutil
      xdg-base-dirs
    ])
  ];

  installPhase = ''
    # Install the Python script to the binary directory
    install -Dm755 ./openconnect-pulse-launcher.py $out/bin/openconnect-pulse-launcher

    # Wrap the program to ensure runtime paths are set correctly
    wrapProgram $out/bin/openconnect-pulse-launcher \
      --suffix PATH : ${runtimePaths}
  '';

  meta = with pkgs.lib; {
    description = "Launcher for OpenConnect Pulse Secure VPN";
    homepage = "https://github.com/erahhal/openconnect-pulse-launcher";
    license = licenses.mit;
    maintainers = [ maintainers.erahhal ];
    platforms = platforms.linux;
  };
}

