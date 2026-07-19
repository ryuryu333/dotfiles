let { GithubRepositorySchem } = import "./module/github_repository.ncl",
in
{
  ResourceSchema = {
    github_repository | GithubRepositorySchem,
  },
}
