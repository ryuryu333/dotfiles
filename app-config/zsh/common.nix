{
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "safe-paste"
        "zsh-autosuggestions"
      ];
      custom = "${./ohmyzsh}";
      theme = "mytheme";
    };
  };
}
