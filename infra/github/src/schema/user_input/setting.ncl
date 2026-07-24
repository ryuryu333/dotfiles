let
  { GithubRepositorySchema, .. } =
    import "schema/resource/github_repository.ncl",
in
let
  BaseSchema = GithubRepositorySchema & {
    name | default = "!tmp",
    visibility | default = "private",
  },
in
{
  SettingInput = {
    _ : BaseSchema
  },
}
