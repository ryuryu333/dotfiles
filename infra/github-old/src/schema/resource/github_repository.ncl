let util = import "util/contract.ncl",
in
{
  GithubRepositorySchema = {
    name | String,
    visibility
      | String
      | util.allowedValues ["private", "public", "internal"],
    description
      | String
      | optional,
    has_issues
      | Bool
      | optional,
    has_projects
      | Bool
      | optional,
    auto_init
      | Bool
      | optional,
    license_template
      | String
      | optional,
    delete_branch_on_merge
      | Bool
      | optional,
    archive_on_destroy
      | Bool
      | optional,
  },
}
