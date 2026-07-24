ref dotfiles/config/winget/AGENTS.md

# 規則

- schema はリソース単位で定義する。
- ユーザー入力値用の独自 schema は隷属する schema に記述する。
- schema のファイル名 Terraform 側のリソース名に準拠する。schema 名は命名規則に従う形式に変更する。

# 実装後のアクション

- fmt、build、validate plan は許可無しで実行してもよい。
