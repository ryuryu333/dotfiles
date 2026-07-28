{
  public.normal = {
    visibility = "public",
    features = {
      issues = true,
      projects = false,
      merge_strategy.auto_delete_head_branches = true,
    },
  },
  private.normal = {
    visibility = "private",
    features = {
      issues = true,
      projects = false,
    },
  },
}
