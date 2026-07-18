let { PackageUserInputSchema = package_user_input_schema, .. } = import "../schema/package.ncl",
in
{
  packages | package_user_input_schema = {
    git = "Git.Git",
    vscode = "Microsoft.VisualStudioCode",
  },
}
