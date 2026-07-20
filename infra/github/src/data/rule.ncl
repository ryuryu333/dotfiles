{
  # GithubRepositoryRulesetBranchSchema
  default_rules.branch = {
    all = {
      requiredLinearHistory = true, # マージコミット禁止
    }
    # main branch
    "default" = 
      all & {
        deletion = true, # 削除禁止
        nonFastForward = true, # force push 禁止
        # PR 必須
        pull_request = {
          allowed_merge_methods = [ "merge" ], # 履歴を忠実に残したいので marge を指定
        },
    },
    # 特定のブランチ
    # dev = {},
  },
  
  
}
