let { PackageUserInputSchema, .. } = import "../schema/package.ncl",
in
{
  packages | PackageUserInputSchema = {
    chrome = "Google.Chrome.EXE",
    git = "Git.Git",
    java = "Oracle.JavaRuntimeEnvironment",
    powershell = "Microsoft.PowerShell",
    seven_zip = "7zip.7zip",
    unity_hub = "Unity.UnityHub",
    visual_studio = "Microsoft.VisualStudio.Community",
    vscode = "Microsoft.VisualStudioCode",
  },
}
