{
  apiVersion = "gh-infra/v1",
  kind = "RepositorySet",
  metadata.owner = "ryuryu333",


  defaults.spec = {
    visibility = "public",
    features = {
      issues = true,
      projects = false,
    },
    merge_strategy.auto_delete_head_branches = true,
    rulesets = [
      {
        name = "protect-version-tags",
        target = "tag",
        enforcement = "active",
        conditions.ref_name.include = ["refs/tags/v*"],
        rules = {
          deletion = true,
          non_fast_forward = false,
        },
      },
      {
        name = "protect-default-branch",
        target = "branch",
        enforcement = "active",
        conditions.ref_name.include = ["~DEFAULT_BRANCH"],
        rules = {
          pull_request.required_approving_review_count = 0,
          non_fast_forward = true,
          deletion = true,
        },
      },
    ],
  },
  repositories = [
    {
      name = "zenn-contents",
      spec.description = "my tech-blog article",
    },
    {
      name = "dotfiles",
      spec.description = "managing system/user enviroment and infrastructure",
    },
    {
      name = "slide",
      spec.description = "my slide",
    },
    {
      name = "nix-sample-code",
      spec.description = "Nix code for my articles",
    },
  ],
}
