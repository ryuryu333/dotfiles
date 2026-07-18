let { PackageUserInputSchema, .. } = import "../schema/package.ncl",
in
{
  packages | PackageUserInputSchema = {
    git = "Git.Git",
    vscode = "Microsoft.VisualStudioCode",
  },
}
