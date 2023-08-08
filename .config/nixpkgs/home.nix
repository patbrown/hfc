{ config, pkgs, lib, ... }:

{
  programs.home-manager.enable = true;

  home.username = "pat";
  home.homeDirectory = "/home/pat";

  home.stateVersion = "21.05";

  home.sessionVariables = {
    EDITOR = "emacs";
  };

home.packages = [
pkgs.ansible
pkgs.awscli
pkgs.bun
pkgs.chroma
pkgs.clojure
pkgs.clojure-lsp
pkgs.doctl
pkgs.fd
pkgs.fontconfig
pkgs.fzf
pkgs.gh
pkgs.git
pkgs.git-lfs
pkgs.git-secret
pkgs.gnupg
pkgs.graphviz
pkgs.htop
pkgs.jdk11
pkgs.k9s
pkgs.kubectl
pkgs.kubernetes-helm
pkgs.leiningen
pkgs.maven
pkgs.minikube
pkgs.ngrok
pkgs.nodejs
pkgs.packer
pkgs.pistol
pkgs.polylith
pkgs.pre-commit
pkgs.python3
pkgs.rclone
pkgs.ripgrep
pkgs.s3cmd
pkgs.step-cli
pkgs.stow
pkgs.terraform
pkgs.tmux
pkgs.tree
pkgs.vault
pkgs.wget
pkgs.websocat
pkgs.xclip
pkgs.yarn
pkgs.yt-dlp
pkgs.zsh
];
}

