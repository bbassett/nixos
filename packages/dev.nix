{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    coreutils
    vim
    gcc
    gnumake
    nodejs-8_x
    erlangR20
    inotify-tools
  ];

  virtualisation.docker.enable = true;
}
