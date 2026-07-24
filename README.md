# dotfiles
各種設定を宣言管理するリポジトリです。

- システム環境/ユーザー環境管理
  - Windows11
  - WSL2 Ubuntu 22.04 LTS
  - MacBookProM1
- インフラ管理
  - GitHub
  - GCP

# ディレクトリ構成

- config
  - host: OS・マシンごとのシステム設定
    - nix-darwin: macOS
    - system-manager: WSL
    - winget: Windows
  - user: home-manager によるユーザー環境設定
  - app: 各アプリケーションの設定
- infra
  - github: GitHub のリポジトリ設定
  - gcp: GCP のプロジェクト設定

# 前提
- Nix インストール済み
  - [NixOS/nix-installer](https://github.com/NixOS/nix-installer) 利用を想定

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
