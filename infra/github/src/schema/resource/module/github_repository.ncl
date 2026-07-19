{
  GithubRepositorySchema = {
    _ : {
    name | String,
    description
      | String
      | optional,
    private
      | Bool
      | default = true,
    },
  },
}
