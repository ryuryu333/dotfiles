let { GithubRepositoryInputSchema } =
  import "../schema/resource/module/github_repository.ncl",
in
{
  "my-test" = {
    description = "動作確認用",
  },
  "my-test-public" = {
    description = "動作確認用",
    private = false,
  },
}
  | { _ : GithubRepositoryInputSchema }
