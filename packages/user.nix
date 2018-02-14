{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    simplenote
    dunst
  ];
}
