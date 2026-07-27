let
  util = import "util/contract.ncl",
  { BranchRulesSchema, .. } =
    import "./github_repository_ruleset/branch_rules.ncl",
  { TagRulesSchema, .. } =
    import "./github_repository_ruleset/tag_rules.ncl",
in
let
  BaseSchema = {
    name | String,
    repository | String,
    target
      | String
      | util.allowedValues ["branch", "tag", "push"],
    enforcement
      | String
      | util.allowedValues ["active", "disabled", "evaluate"]
      | doc "evaluate は organization 限定なので利用不可",
    bypass_actors
      | Dyn
      | optional
      | doc "利用予定無し",
  },
  ConditionsSchema = {
    ref_name
      | {
        "include" | Array String,
        exclude
          | Array String
          | default
          = [],
      },
  },
in
{
  GithubRepositoryRulesetSchema =
    BaseSchema
    & {
      conditions
        | ConditionsSchema
        | optional,
      rules | Dyn,
    },
  GithubRepositoryRulesetBranchSchema =
    BaseSchema
    & {
      target
        | std.contract.Equal "branch"
        | default
        = "branch",
      conditions | ConditionsSchema,
      rules | BranchRulesSchema,
    },
  GithubRepositoryRulesetTagSchema =
    BaseSchema
    & {
      target
        | std.contract.Equal "tag"
        | default
        = "tag",
      conditions | ConditionsSchema,
      rules | TagRulesSchema,
    },
  # push ルールは organization 用なので未使用
  # GithubRepositoryRulesetPushSchema =
}
