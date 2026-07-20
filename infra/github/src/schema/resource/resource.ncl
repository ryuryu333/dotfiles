let
  { GithubRepositorySchema, .. } = import "./module/github_repository.ncl",
  { GithubRepositoryRulesetSchema, .. } = import "./module/github_repository_ruleset.ncl",
in
{
  ResourceSchema = {
    github_repository | { _ : GithubRepositorySchema },
    github_repository_ruleset
      | { _ : GithubRepositoryRulesetSchema }
      | optional,
  },
}
