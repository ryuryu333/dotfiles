tmp メモ
Windows 11 の設定を宣言管理する

data/ ユーザーが普段扱う領域
data/package パッケージ一覧
data/registry レジストリ一覧

src/ nickl での winget ファイル作成処理
src/lib
src/lib/package パッケージリソース生成関数
src/lib/registry レジストリリソース生成関数
src/lib/utl 汎用的なヘルパー関数
src/main.ncl data と lib の統合し、winget ファイル作成

output/ 作成した winget ファイル配置

## 既知の問題

2026-07-18 時点の WinGet v1.29.280 では `winget configure validate` を実行すると、
ネイティブ DSC v3 リソースである `Microsoft.WinGet/Package` と
`Microsoft.Windows/Registry` に対して、モジュール未指定および構成ユニットが公開されて
いないという警告が出て終了コード 1 になる。

これらのリソースはモジュール指定を必要としないため、構成側では解消できない。同様の
`Microsoft.WinGet/Package` の警告は [WinGet Issue #5700] でも報告されているが、Issue
全体は別のリソース探索問題を扱っているため、同一原因とは断定できない。

`--ignore-warnings` は警告を隠すうえ、実機確認では終了コードも 1 のままになるため使用
しない。当面は検証タスクを失敗させたままにし、WinGet 側の修正または公式な回避策が
提示された時点で再検討する。

[WinGet Issue #5700]: https://github.com/microsoft/winget-cli/issues/5700
