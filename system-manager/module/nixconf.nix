{ ... }:
{
  config = {
    nixpkgs.hostPlatform = "x86_64-linux";

    environment = {
      # Add directories and files to /etc and set their permissions.
      etc = {
        # 初回導入時、Nix Installerが生成した空の既存ファイルは手動で削除した。
        # 設定変更後は `sudo systemctl restart nix-daemon.service` で再読み込みする。
        "nix/nix.custom.conf".text = ''
          trusted-substituters = https://cache.numtide.com
          extra-trusted-public-keys = niks3.numtide.com-1:DTx8wZduET09hRmMtKdQDxNNthLQETkc/yaX7M4qK0g=
        '';
      };
    };
  };
}
