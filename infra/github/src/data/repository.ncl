let
  { RepositoryInput, .. } =
    import "schema/user_input/repository.ncl",
  my_ruleset = import "./ruleset.ncl",
  my_setting = import "./setting.ncl",
in
{
  public = {
    # == 値の優先度 ==
    # base_setting < setting < 個別記述された値
    # 再帰的統合ではなく、上書きなので注意
    "!base_setting" = {
      visibility = "public",
      ruleset =
        my_ruleset.tag.public_default
        @ my_ruleset.branch.public_default,
      setting = my_setting."default",
    },
    list = {
      "zenn-contents" = {
        description = "my tech-blog article",
      },
      dotfiles = {
        description = "managing system/user enviroment and infrastructure",
        license_template = "mit",
      },
      slide = {
        description = "my slide",
      },
    },
  },
} | RepositoryInput
