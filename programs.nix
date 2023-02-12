{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Modern Command Line Tools
    ripgrep # grep
    fd # find
    httpie # curl
    entr # Run arbitrary commands when files change
    dogdns # dig
    duf # df
    du-dust # du
    # pgcli
    tldr # man
    sd # sed
    difftastic # diff
    # plocate # locate
    # nnn
    mtr # traceroute
    hyperfine # benchmarking
    croc # scp
    choose # cut awk
    lnav # browse log files

    fortune
    gum  # interactive shell script
    glow # markdown
    lynx # web
    sqlite
    unzip
    cloc
    nb
    w3m
    nmap
  ];
  # programs.tmux = {
  #   enable = true;
  #   keyMode = "vi";
  #   terminal = "screen-256color";
  #   baseIndex = 1;
  #   prefix = "C-a";
  #   tmuxinator.enable = true;
  #   plugins = with pkgs; [
  #     tmuxPlugins.resurrect
  #     tmuxPlugins.continuum
  #   ];
  # };
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
  programs.helix = {
    enable = true;
    settings = {
      theme = "onedark";
      editor.cursor-shape = {
        insert = "bar";
        normal = "block";
        select = "underline";
      };
      editor.file-picker = {
        hidden = false;
      };
    };
  };
  programs.zellij = {
    enable = true;
    settings = {
      pane_frames = false;
      default_mode = "locked";
      default_layout = "compact";
    };
  };
  programs.btop = {
    enable = true;
  };
  programs.broot = {
    enable = true;
  };
  programs.jq = {
    enable = true;
  };
  programs.lazygit = {
    enable = true;
  };
  programs.kakoune = {
    enable = true;
  };
  programs.pandoc = {
    enable = true;
  };
}