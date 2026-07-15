{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "safe-paste"
        "sudo"
      ];
      custom = "${./ohmyzsh}";
      theme = "mytheme";
    };
  };
}
