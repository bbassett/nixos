{ config, lib, pkgs, ... }:

{
  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
    };
  };

  environment.systemPackages = with pkgs; [
    coreutils
    curl
    gitAndTools.gitFull
    terminator
    unzip
    which
    wget
    zsh
    ngrok
    tmux
  ];

  users.defaultUserShell = "${pkgs.zsh}/bin/zsh";
}
