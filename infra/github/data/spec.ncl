let myruleset = import "./rulesets.ncl",
in
{
  public = {
    visibility = "public",
    merge_strategy.auto_delete_head_branches = true,
    features = {
      issues = true,
      projects = false,
    },
    rulesets = [
      myruleset.tag."v*",
      myruleset.branch."default",
    ],
  },
  private = {
    visibility = "private",
    features = {
      issues = true,
      projects = false,
    },
  },
}
