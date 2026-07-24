let
  { RepositoryInput, .. } =
    import "schema/user_input/repository.ncl",
  my_ruleset = import "./ruleset.ncl",
  my_setting = import "./setting.ncl",
in
{
  public = {
    "!base_setting" = {
      visibility = "public",
      ruleset =
        my_ruleset.tag.public_default
        @ my_ruleset.branch.public_default,
      setting = my_setting."default",
    },
    list = {
      "my-test-public" = {
        description = "動作確認用",
      },
      dotfiles = {},
    },
  },
} | RepositoryInput
