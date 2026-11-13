---
name: nix-devshell-in-sandbox
description: Nix コマンドを実行する前、または devshell のツールが必要なときに読む。
---

- サンドボックス内では nix develop を使わない。
- devshell の環境は、VS Code の direnv 拡張から引き継いだものをそのまま使う。
- devshell の評価と Nix ストアへの変更は user の責務。devshell の更新が必要なときは、自分で更新せず user に伝える。
- サンドボックス内で nix develop が失敗するのは既知で、この方針は決定済み。エラーの調査や回避策の提案はしない。
