{ config, lib, pkgs, ... }:

{
  services.xserver.libinput = {
    naturalScrolling = false;
    enable = true;
    tapping = true;
  };
}
