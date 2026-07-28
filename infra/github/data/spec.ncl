let myruleset = import "./rulesets.ncl",
in
let base_setting = {
  features = {
    issues = true,
    projects = false,
    wiki = false,
  },
  merge_strategy = {
    allow_merge_commit = true,
    allow_squash_merge = false,
    allow_rebase_merge = false,
    auto_delete_head_branches = true,
  },
},
in
{
  public =
    base_setting
    & {
      visibility = "public",
      merge_strategy.auto_delete_head_branches = true,
      rulesets = [
        myruleset.tag."v*",
        myruleset.branch."default",
      ],
    },
  private =
    base_setting
    & {
      visibility = "private",
    },
}
