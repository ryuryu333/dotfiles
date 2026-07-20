{
  # NOTE
  # tag rule は GitHub Free だと public repository のみ
  # push rule は organization 用

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

  default_rules.tag = {
    # v が付くタグが対象
    "refs/tags/v*" = {
      deletion = true, # 削除禁止
      update = true, # 更新不可
    },
  },

  # 宣言管理している repository のみが対象
  repository = {
    private.branch = default_rules.branch,
    public = {
      branch = default_rules.branch,
      tag = default_rules.tag,
    },
    # 特定の repository
  },
  all_private_repository.rule.branch = default_rules.branch,
  all_public_repository = {
    rule = {
      branch = default_rules.branch,
      tag = default_rules.tag,
    },
  },
}
