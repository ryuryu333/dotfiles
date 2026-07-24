let { PackageUserInputSchema, .. } = import "../schema/package.ncl",
in
{
  packages | PackageUserInputSchema = {
    chrome = "Google.Chrome.EXE",
    git = "Git.Git",
    powershell = "Microsoft.PowerShell",
    powertoys = "Microsoft.PowerToys",
    seven_zip = "7zip.7zip",
    unity_hub = "Unity.UnityHub",
    visual_studio = "Microsoft.VisualStudio.Community",
    vscode = "Microsoft.VisualStudioCode",
  },
}
