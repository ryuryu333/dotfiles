{
  # GithubRepositoryRulesetBranchSchema
  default_rules.branch = {
    all = {
      required_linear_history = true, # マージコミット禁止
    },
    # main branch
    "default" =
      all
      & {
        deletion = true, # 削除禁止
        non_fast_forward = true, # force push 禁止
        # PR 必須
        pull_request = [
          {
            allowed_merge_methods = ['merge], # 履歴を忠実に残したいので merge を指定
          }
        ],
      },
    # 特定のブランチ
    # dev = {},
  },
}
