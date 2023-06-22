{ pkgs, ... }:
let
  neovimConf = import ../nvim/nvim.nix;
in {
  imports = [ 
    ./shell.nix 
    ./home-pkgs.nix
    ./sysdservices.nix
  ];

  home.username = "ahmed";
  home.homeDirectory = "/home/ahmed";
  programs = {
    kitty.enable = true;
    neovim = neovimConf pkgs;
    direnv = {
      nix-direnv.enable = true;
      enable = true;
      enableBashIntegration = true;
    };
    
    # thunar.enable = true;
  };
  #configs#
  xdg = {
    enable = true;
    configFile = {
      kitty = {
        source = ../kitty;
        target = "kitty";
        recursive = true;
      };
      qtile = {
        source = ../qtile;
        target = "qtile";
        recursive = true;
      };
      xmonad = {
        source = ../xmonad;
        target = "xmonad";
        recursive = true;
      };
    };
  };
  #end configs#
  services = {
    dunst = {
      enable = true;
    };
    sxhkd = {
      enable = true;
      keybindings = {
        "XF86AudioMute"                    = "amixer set Master toggle";
        "XF86Audio{Lower,Raise}Volume"     = "pamixer --allow-boost {--decrease,--increase} 5";
        "XF86Audio{Play,Pause,Next,Prev}"  = "media {p,p,n,b}";
        "XF86MonBrightness{Up,Down}"       = "brightnessctl set 5%{+,-}";
        "super + s"                        = "rofi -show ssh -no-parse-known-hosts -disable-history";
        "super + p"                        = "powermen";
        "super + o"                        = "rofi -show run";
        "super + shift + s"                = "maim -s -o -D -u | xclip -selection clipboard -t image/png";
      };
    };
  };

  home.stateVersion = "22.05";

  programs.home-manager.enable = true;
}
