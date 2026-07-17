tmp メモ
Windows 11 の設定を宣言管理する

data/ ユーザーが普段扱う領域
data/app パッケージ一覧
data/registry レジストリ一覧

src/ nickl での winget ファイル作成処理
src/lib
src/lib/app パッケージリソース生成関数
src/lib/registry レジストリリソース生成関数
src/lib/utl 汎用的なヘルパー関数
src/main.ncl data と lib の統合し、winget ファイル作成

output/ 作成した winget ファイル配置