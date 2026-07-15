{ pkgs, nix-versions, ... }:
{
  home.packages =
    with pkgs;
    [
      nixfmt
      tree # ディレクトリ構造を表示
      go-task # task runner
      jq # JSONデータを操作
    ]
    ++ [
      nix-versions.packages.${pkgs.stdenv.hostPlatform.system}.nix-versions
    ];

  imports = [
    ../../app-config
  ];
}
