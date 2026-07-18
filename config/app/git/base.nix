{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "ryuryu333";
      };
      core.editor = "code --wait";
      init.defaultBranch = "main";
      push.default = "current";
    };
  };
}
