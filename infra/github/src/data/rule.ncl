{
  # NOTE
  # tag rule は GitHub Free だと puclic repositry のみ
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


  # 宣言管理している repositry のみが対象
  repositry = {
    privaterule.branch = default_rules.brach,
    public = {
      branch = default_rules.brach,
      tag = default_rules.tag,
    },
    # 特定の repositry
    

  },
  all_private_repositry.rule.branch = default_rules.brach,
  all_public_repositry = {
    rule = {
      branch = default_rules.brach,
      tag = default_rules.tag,
    },
  },
}
