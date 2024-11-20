{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    dotnet-sdk_7
    #dotnet-sdk_8
    omnisharp-roslyn
    mono
    msbuild
  ];
}

