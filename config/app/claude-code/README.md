# Claude Code

## 将来の検討事項

### サンドボックス内の Nix devshell

#### 現在の方針

- サンドボックス内では nix develop を使わない。VS Code の direnv 拡張が評価した devshell の環境を、Claude Code が引き継いで使う。
- devshell の評価と Nix ストアへの変更は user が行う。Claude は更新が必要なときに user に伝える。
- Claude 向けの指示は skills/nix-devshell-in-sandbox.md にある。

#### サンドボックス内で nix develop が失敗する原因

- ダミーの .gitmodules。サンドボックスは、作業ディレクトリ内の保護対象ファイル（シェルの設定ファイル、.gitconfig、.gitmodules など）のうち存在しないものに、/dev/null を読み取り専用でバインドする。このマウントは nodev なので、開くと Permission denied になる。Nix は git の作業ディレクトリを読み込むとき、.gitmodules があれば必ず解析するため、flake の評価が失敗する。submodules=0 を指定しても変わらない。
- Unix ソケットの禁止。Linux と WSL2 では、サンドボックスの seccomp フィルタが AF_UNIX ソケットの作成を全て拒否する。Nix ストアは読み取り専用でマウントされているので、Nix はデーモン経由で動こうとするが、ソケットを作れずに失敗する。

#### 検討して採用しなかった案

- sandbox.network.allowAllUnixSockets を有効にする。Linux では Unix ソケットをパスごとに許可できず、全て許可するしかない。WSL2 では Windows のプログラムを起動するための通信路も開くため、サンドボックスの境界が崩れる。
- nix develop を excludedCommands に入れる。-c で実行するコマンドも、サンドボックスの制限なしで動く。また、Claude が書き換えられる flake.nix の shellHook がサンドボックスの外で実行されるので、抜け道になる。ストアへの変更を user が管理する、という責務境界とも合わない。
- devshell 専用の flake を作り、path: で参照する。.gitmodules を避けて動かすことだけが目的の構成変更で、設計としてあるべき姿から遠ざかる。
- コミット済みのリビジョンを指定する。.gitmodules の問題は回避できるが、未コミットの変更が反映されない。

#### 未確定事項

- 環境の更新がいつ反映されるか。Bash ツールの PATH はセッション開始時のシェルスナップショットで固定されるので、セッションの途中では反映されない。direnv の VS Code 拡張が拡張ホストの環境をその場で更新するなら新しいセッションで反映され、そうでなければ拡張の再起動が必要になる。確定したらスキルに追記する。
