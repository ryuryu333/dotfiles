let
  { GithubRepositorySchema, .. } =
    import "./github_repository.ncl",
  { GithubRepositoryRulesetSchema, .. } =
    import "./github_repository_ruleset.ncl",
in
{
  ResourceSchema = {
    github_repository
      | { _ : GithubRepositorySchema }
      | optional,
    github_repository_ruleset
      | { _ : GithubRepositoryRulesetSchema }
      | optional,
  },
}
