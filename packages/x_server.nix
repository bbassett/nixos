{ config, lib, pkgs, ... }:

{
  environment.profileRelativeEnvVars.XCURSOR_PATH = [ "/share/icons" ];

  environment.systemPackages = with pkgs; [
    adapta-gtk-theme
    arc-icon-theme
    arc-theme
    dmenu
    i3
    gnome_themes_standard
    gtk-engine-murrine
    playerctl
    polybar
    rofi
    nitrogen
    xlibs.xmodmap
    xorg.xbacklight
  ];

  services.xserver = {
    enable = true;
    autorun = true;
    videoDrivers = [ "intel" ];
    displayManager.slim.enable = true;
    windowManager.i3.enable = true;
  };
}
