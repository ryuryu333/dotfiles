let
  repositories = {
    "my-test" = {
      description = "動作確認用",
    },
    "my-test-public" = {
      description = "動作確認用",
      private = false,
    },
  },
  github_repository_schema =
    import "../schema/resource/module/github_repository.ncl",
in
repositories
  | { _ : github_repository_schema.GithubRepositoryInputSchema }
