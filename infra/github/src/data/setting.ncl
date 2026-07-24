let { SettingInput, .. } =
  import "schema/user_input/setting.ncl",
in
{
  "default" = {
    has_issues = true,
    has_projects = false,
    delete_branch_on_merge = true,
    archive_on_destroy = true,
  },
} | SettingInput
