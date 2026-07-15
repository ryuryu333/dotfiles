{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "safe-paste"
      ];
      custom = "${./ohmyzsh}";
      theme = "mytheme";
    };
  };
}
