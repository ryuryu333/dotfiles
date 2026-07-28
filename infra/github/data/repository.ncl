let myspec = import "./spec.ncl",
in
let all_authoritative = {
  # labels = "authoritative",
  rulesets = "authoritative",
},
in
{
  public = {
    defaults = {
      reconcile = all_authoritative,
      spec = myspec.public,
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
    defaults = {
      reconcile = all_authoritative,
      spec = myspec.private,
    },
    repositories = {
      "dotfiles-private" = {},
    },
  },
}
