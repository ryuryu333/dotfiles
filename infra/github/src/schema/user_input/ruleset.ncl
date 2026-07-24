let
  {
    GithubRepositoryRulesetTagSchema,
    GithubRepositoryRulesetBranchSchema,
    ..
  } = import "schema/resource/github_repository_ruleset.ncl",
in
let
  DefaulValue = {
    name | default = "!tmp",
    repository | default = "!tmp",
    enforcement | default = "active",
  },
in
{
  RuleSetInput = {
    tag | {
      _ : Array (GithubRepositoryRulesetTagSchema & DefaulValue)
    },
    branch | {
      _ : Array (GithubRepositoryRulesetBranchSchema & DefaulValue)
    },
  },
}
