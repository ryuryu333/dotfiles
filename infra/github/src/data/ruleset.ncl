let
  { RuleSetInput , .. } =
  import "schema/user_input/ruleset.ncl",
in
{
  tag.public_default = [
    {
      conditions.ref_name."include" = [
        "refs/tags/v*"
      ],
      rules = {
        deletion = true, # 削除禁止
        update = true, # 更新不可
      },
    },
  ],
  branch.public_default = [
    {
      conditions.ref_name."include" = [
        "~ALL"
      ],
      rules = {
        required_linear_history = true, # マージコミット禁止
      },
    },
    {
      conditions.ref_name."include" = [
        "~DEFAULT_BRANCH"
      ],
      rules = {
        required_linear_history = true,
        deletion = true, # 削除禁止
        non_fast_forward = true, # force push 禁止
        # PR 必須
        pull_request = {
          allowed_merge_methods = ["merge"], # 履歴を忠実に残したいので merge を指定
        },
      },
    },
  ],
} | RuleSetInput
