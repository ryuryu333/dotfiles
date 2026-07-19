let { GithubRepositoryInputSchema, GithubRepositorySchema } =
  import "../schema/resource/module/github_repository.ncl",
in
{
  to_resources
    | { _ : GithubRepositoryInputSchema } -> { _ : GithubRepositorySchema }
    = fun repositories =>
      repositories
      |> std.record.map (fun field_name repository =>
        repository
        & {
          name = field_name,
        }
      ),
}
