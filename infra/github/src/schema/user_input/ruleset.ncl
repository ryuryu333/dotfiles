let {
  GithubRepositoryRulesetTagSchema,
  GithubRepositoryRulesetBranchSchema,
  ..
} = import "schema/resource/github_repository_ruleset.ncl",
in
let DefaultValue = {
  name | default = "!tmp",
  repository | default = "!tmp",
  enforcement | default = "active",
},
in
{
  RuleSetInput = {
    tag
      | {
        _ : Array (GithubRepositoryRulesetTagSchema & DefaultValue)
      },
    branch
      | {
        _ : Array (GithubRepositoryRulesetBranchSchema & DefaultValue)
      },
  },
}
