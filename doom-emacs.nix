{ config, lib, pkgs, ... }:

let
  doom-emacs = pkgs.callPackage (builtins.fetchTarball {
    url = https://github.com/nix-community/nix-doom-emacs/archive/master.tar.gz;
  }) {
    doomPrivateDir = pkgs.callPackage ./doom.d {};
    # doomPrivateDir = ./doom.d;

    # Use the latest emacs-overlay
    dependencyOverrides = {
      "emacs-overlay" = (builtins.fetchTarball {
          url = https://github.com/nix-community/emacs-overlay/archive/master.tar.gz;
      });
    };
    # Look at Issue #394
    emacsPackagesOverlay = self: super: {
      gitignore-mode = pkgs.emacsPackages.git-modes;
      gitconfig-mode = pkgs.emacsPackages.git-modes;
    };

    extraPackages = epkgs : [epkgs.vterm];
  }; in
{
  home.packages = [
    doom-emacs
    pkgs.imagemagick # for pdf
  ];
  home.file.".emacs.d/init.el".text = ''
    (load "default.el")
  '';
}
