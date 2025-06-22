{ config, pkgs, ... }: {
  programs.fish.enable = true;

  environment.systemPackages = with pkgs; [
    fish
    starship
    mc
    eza      # lepsze ls
    bat      # lepszy cat
    btop     # kolorowy htop
    fd       # nowoczesny find
    ripgrep  # nowoczesny grep
  ];

  environment.shellAliases = {
    fogpaint = "krita &";
    fogstyle = ''bash -c "qt6ct & kvantum-manager &"'';
    fogwm = "startx";
    foggpu = "nvidia-settings &";
    gpuwatch = "watch -n1 nvidia-smi";
    ls = "eza -alh --color=always --group-directories-first";
    cat = "bat";
    top = "btop";
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      format = "$directory$character";
      character = {
        success_symbol = "[❯](bold green)";
        error_symbol = "[❯](bold red)";
      };
    };
  };
}
