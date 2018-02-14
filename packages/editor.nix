{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    sublime3
  ];
}
