{
  PackageResourceSchema = {
    name
      | String,
    properties = {
      id
        | String,
      source
        | String,
        | default = winget,
      useLatest
        | Bool,
        | default = true,
    },
    type
      | String
      | default
      = Microsoft.WinGet / Package,
  },
}
