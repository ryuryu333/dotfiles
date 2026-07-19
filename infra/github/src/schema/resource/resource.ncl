let { GithubRepositorySchema, .. } = import "./module/github_repository.ncl",
in
{
  ResourceSchema = {
    github_repository | { _ : GithubRepositorySchema },
  },
}
