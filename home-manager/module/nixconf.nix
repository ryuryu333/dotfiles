{
  nix.registry = {
    templates = {
      from = {
        type = "indirect";
        id = "templates";
      };
      to = {
        type = "github";
        owner = "ryuryu333";
        repo = "nix_template";
      };
    };
  };
}
