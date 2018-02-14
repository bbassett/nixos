{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    zlib
    readline
  ];
}
