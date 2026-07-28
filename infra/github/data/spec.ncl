{
  public = {
    visibility = "public",
    merge_strategy.auto_delete_head_branches = true,
    features = {
      issues = true,
      projects = false,
    },
  },
  private = {
    visibility = "private",
    features = {
      issues = true,
      projects = false,
    },
  },
}
