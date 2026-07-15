{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "ryuryu333";
        email = "anonymous@example.com";
      };
      core.editor = "code --wait";
      init.defaultBranch = "main";
      push.default = "current";
    };
  };
}
