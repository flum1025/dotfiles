# dotfiles

[mise](https://mise.jdx.dev/) だけで管理する dotfiles。ツール(CLI)・設定ファイル・
ログインシェルまでを `mise` に集約している。設定ファイルは symlink 配置で、
実体を直接編集すれば即リポジトリに反映される。

## Getting Started

```sh
curl -fsSL https://raw.githubusercontent.com/flum1025/dotfiles/master/qinstall.sh | bash
```

`qinstall.sh` が mise を用意し、リポジトリを `~/dotfiles` へ clone、
グローバル config を seed して `mise bootstrap` を実行する。

## 構成

すべて `~/dotfiles/.config/mise/config.toml` に集約:

- `[tools]` … グローバルに使う CLI ツール(言語ランタイム等は各リポジトリの `.mise.toml` で管理)
- `[settings]` … mise の挙動 + `dotfiles.root` / `dotfiles.default_mode`
- `[dotfiles]` … 設定ファイルの配置(target ← source。既定 symlink)
- `[bootstrap]` … `login_shell` など、`mise bootstrap` 時の一括セットアップ

```
~/dotfiles/
├── .config/mise/config.toml   # 単一の真実源(自己管理)
├── .config/{zsh,tmux,nvim,alacritty,workmux,git}/...
├── .zshrc  .tmux.conf  .cargo/config  .claude/settings.json
├── Library/Application Support/lazygit/config.yml  # macOS のみ
├── qinstall.sh  README.md      # メタ([dotfiles]未宣言=miseは触らない)
└── bash/ lima/ scripts/ vimrc/ # 未デプロイ(参考用に保管)
```

`[dotfiles]` に宣言したエントリだけが管理対象。リポジトリ直下のメタ/未デプロイ物は
mise に触られない(chezmoi のような ignore 設定は不要)。

## 日常運用

| やること | コマンド |
|---|---|
| 反映(symlink 配置 + login_shell + tools) | `mise bootstrap` |
| dotfiles だけ反映 | `mise dotfiles apply` |
| 乖離確認 | `mise dotfiles status` |
| 管理対象の追加 | `mise dotfiles add <path>`(or `[dotfiles]` に追記) |
| ツール導入 | `mise install` |

設定は symlink なので、`~/.zshrc` 等を直接編集すればそのままリポジトリ側が変わる。
別マシンへは `git pull` するだけで反映される(symlink のため)。

## パッケージ管理(mise 優先)

- CLI ツールは `[tools]` に宣言。mise で入らない GUI / システムライブラリは
  `[bootstrap.packages]`(brew / apt)で扱う。
- バックエンドは aqua/ubi(検証済みバイナリ)を優先し、asdf/vfox は無効化。

## Support

- macOS / Linux(apt)
