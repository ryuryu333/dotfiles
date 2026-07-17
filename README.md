# dotfiles
システム環境、ユーザー環境を管理するリポジトリです。


# 対象マシン
- Windows11 WSL2 Ubuntu 22.04 LTS
- MacBookProM1


# 前提
- Nix インストール済み
  - [NixOS/nix-installer](https://github.com/NixOS/nix-installer) 利用を想定

# ツールと担当領域
## システム環境
- Mac
  - nix-darwin
- Mac 以外
  - system-manager

## ユーザー環境
- home-manager


# 運用
環境適用

```
task
```

パッケージ更新

```
task update
```

その他（fmt 等）は以下で確認

```
task -l
```