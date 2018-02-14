{ config, pkgs, ... }:

{
  imports =
    [
      ./packages/browser.nix
      ./packages/dev.nix
      ./packages/editor.nix
      ./packages/font.nix
      ./packages/media.nix
      ./packages/terminal.nix
      ./packages/touchpad.nix
      ./packages/user.nix
      ./packages/postgres.nix
      ./packages/slack.nix
      ./packages/x_server.nix
      ./hardware-configuration.nix
    ];

  nixpkgs.config.allowUnfree = true;

  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
  };
  hardware.bluetooth.enable = true; 
  hardware.bluetooth.extraConfig = "
    [general]
    Enable=Source,Sink,Media,Socket
  "

  fonts.fontconfig.dpi = 180;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "brandons-laptop"; # Define your hostname.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Denver";

  users.extraUsers.root = {
    hashedPassword = "$6$RHOJv6MXU$3BAFeu1v1bHtvfz0sX0fegy4RCjsBg0hYSVG.KdM8PyyJTwg.AmSRL8YuNh/71.irRyxkD6ewVp7BNN6k.F5C0";
  };
  users.mutableUsers = true;
  users.extraUsers.brandon = {
    isNormalUser = true;
    home = "/home/brandon";
    description = "Brandon Bassett";
    extraGroups = [ "wheel" "networkmanager" "docker" ];
    hashedPassword = "$6$RHOJv6MXU$3BAFeu1v1bHtvfz0sX0fegy4RCjsBg0hYSVG.KdM8PyyJTwg.AmSRL8YuNh/71.irRyxkD6ewVp7BNN6k.F5C0";
    uid = 1000;
  };
  services.xserver.displayManager.slim.defaultUser = "brandon";

  system.stateVersion = "17.09";
}
