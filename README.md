# dotfiles
各種設定を宣言管理するリポジトリです。

- システム環境/ユーザー環境管理
  - Windows11
  - WSL2 Ubuntu 22.04 LTS
  - MacBookProM1
- インフラ管理
  - GitHub
  - GCP

# 利用ツール

- Nix: 各ツールの依存管理、統合、編集環境の管理など
  - nix-darwin: システム環境管理（MacOS）
  - system-manager: システム環境管理（WSL）
  - home-manager: ユーザー環境管理
- WinGet Configration v3
- WinGet Configuration v3: システム/ユーザー環境管理（Windows）
- Terraform: GCP や GitHub の管理
- Nickel: winget や tf の生成

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
詳細は task ファイル参照。

```
task -l
```

- 環境適用

```
task
```

- 更新

```
task update
```
