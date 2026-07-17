fun packages =>
  std.array.map
    (fun package =>
      {
        type = "Microsoft.WinGet/Package",
        name = package,
        properties = {
          id = package,
          source = "winget",
          useLatest = true,
        },
      }
    )
    packages
