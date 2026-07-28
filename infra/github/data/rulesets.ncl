{
  tag."v*" = {
    name = "protect-version-tags",
    target = "tag",
    enforcement = "active",
    conditions.ref_name.include = ["refs/tags/v*"],
    rules = {
      deletion = true,
      non_fast_forward = false,
    },
  },
  branch."default" = {
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
}
