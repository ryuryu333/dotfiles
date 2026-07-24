let
  { GithubRepositorySchema, .. } =
    import "schema/resource/github_repository.ncl",
  { GithubRepositoryRulesetSchema, .. } =
    import "schema/resource/github_repository_ruleset.ncl",
in
let
  BaseSchema = GithubRepositorySchema & {
    name | default = "!tmp",
    visibility | default = "private",
    ruleset
      | Array GithubRepositoryRulesetSchema
      | optional,    
    setting
      | GithubRepositorySchema
      | optional,
  },
in
{
  ListWithBaseSetting = {
    "!base_setting" | BaseSchema,
    list | { _ : BaseSchema },
  },

  RepositryInput = {
    _ : ListWithBaseSetting
  },
}
