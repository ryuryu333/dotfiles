---
name: information-gathering-commands
description: 作業ディレクトリ内の情報を集めるときに、ツールやコマンドを選ぶ前に読む。
---

承認の確認が出ない方法で情報を集める。

| やること | 方法 |
|---|---|
| ファイルを読む | Read ツール。または `head`、`sed -n`、`cat` に作業ディレクトリ内のパスを渡す |
| 一覧・検索する | `ls`、`find`（`-exec ... {} +` を含む）、`grep -rn`、`git ls-files`、`git grep` |
| 履歴・状態を見る | `git log`、`git show`、`git status` |
| 別の場所で実行する | `cd <絶対パス> && ...`、または `git -C <絶対パス>` のように場所を指定するオプション |
| 複数のファイルに処理する | `find -exec ... {} +` |
