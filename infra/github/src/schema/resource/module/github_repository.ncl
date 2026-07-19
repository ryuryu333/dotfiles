{
  GithubRepositoryInputSchema = {
    description
      | String
      | optional,
    private
      | Bool
      | default
      = true,
  },

  GithubRepositorySchema =
    GithubRepositoryInputSchema
    & {
      name | String,
    },
}
