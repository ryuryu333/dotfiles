let
  { GithubRepositorySchema, .. } =
    import "schema/resource/github_repository.ncl",
  { GithubRepositoryRulesetSchema, .. } =
    import "schema/resource/github_repository_ruleset.ncl",
in
{
  RepositoryWithSetting = GithubRepositorySchema & {
    name | default = "!tmp",
    visibility | default = "private",
    ruleset
      | Array GithubRepositoryRulesetSchema
      | optional,    
    setting
      | GithubRepositorySchema
      | optional,
  },

  ListWithBaseSetting = {
    "!base_setting" | RepositoryWithSetting,
    list | { _ : RepositoryWithSetting },
  },

  RepositoryInput = {
    _ : ListWithBaseSetting
  },
}
