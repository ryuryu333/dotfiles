let
  myspec = import "./spec.ncl",
  myruleset = import "./rulesets.ncl",
in
{
  public = {
    defaults.spec =
      myspec.public.normal
      & {
        rulesets = [
          myruleset.tag."v*",
          myruleset.branch."default",
        ],
      },
    repositories = {
      "zenn-contents" = {
        spec.description = "my tech-blog article",
      },
      dotfiles = {
        spec.description = "managing system/user enviroment and infrastructure",
      },
      slide = {
        spec.description = "my slide",
      },
      "nix-sample-code" = {
        spec.description = "Nix code for my articles",
      },
    },
  },
  private = {
    defaults.spec = myspec.public.normal,
    repositories = {
      "dotfiles-private" = {},
    },
  },
}
