{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Modern Command Line Tools
    ripgrep # grep
    fd # find
    httpie # curl
    entr
    dogdns # dig
    duf # df
    du-dust # du
    # pgcli
    btop # top
    tldr # man
    sd # sed
    difftastic # diff
    # plocate # locate
    broot # tree
    # nnn
    jq
    mtr # traceroute
    hyperfine # benchmarking
    croc # scp
    choose # cut awk
    lnav # browse log files

    fortune
    glow # markdown
    lynx # web
    gcc
    sqlite
    unzip
  ];
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    terminal = "screen-256color";
    baseIndex = 1;
    prefix = "C-a";
    tmuxinator.enable = true;
    plugins = with pkgs; [
      tmuxPlugins.resurrect
      tmuxPlugins.continuum
    ];
  };
  programs.git = {
    enable = true;
    delta.enable = true;
  };
  programs.starship = {
    enable = true;
  };
  programs.exa = {
    enable = true;
    enableAliases = true;
  };
  programs.bat = {
    enable = true;
    config = {
      theme = "TwoDark";
    };
  };
  programs.fzf = {
    enable = true;
    defaultCommand = "rg --files --hidden --glob '!.git'";
    defaultOptions = ["--height=40%" "--layout=reverse" "--border" "--margin=1" "--padding=1"];
  };
  programs.mcfly = {
    enable = true;
    keyScheme = "vim";
  };
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
