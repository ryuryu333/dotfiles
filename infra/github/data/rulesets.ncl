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
      pull_request = {
        required_approving_review_count = 0,
        dismiss_stale_reviews_on_push = false,
        require_code_owner_review = false,
        require_last_push_approval = false,
        required_review_thread_resolution = false,
      },
      non_fast_forward = true,
      deletion = true,
    },
  },
}
