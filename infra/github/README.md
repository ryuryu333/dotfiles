# GitHub

Nickel で GitHub の構成を定義し、Terraform JSON を生成して管理します。

# ディレクトリ構成

- src
  - data: リポジトリ設定などの入力値の管理
  - schema: 構造と制約を定義
    - user_input: data での入力
    - resource: 生成するリソース
    - tf_json.ncl: Terraform JSON 全体
  - lib: リソース構築などの関数
  - util: Utility 関数
  - main.ncl: data と lib から設定ファイル構築
- terraform: Terraform JSON 配置場所

# 設定の流れ

1. `data` で管理対象と共通設定を定義
2. task 経由で Terraform 設定ファイルを作成
3. task 経由で Terraform を実行

# 設定項目の追加

- `shema/resource` を編集し、リソースごと/項目ごとに構造と制約を定義
  - 型（String, Number Array 等）
  - 値の制限（特定の文字列のみ等）
  - 必須/任意、初期値
- `data` を編集
- 入力形式が変わる場合は `scjema/user_input` や `lib` も更新
