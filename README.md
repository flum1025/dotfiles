# dotfiles

[chezmoi](https://www.chezmoi.io/) で管理する dotfiles。設定ファイルは symlink 方式で配置し、
実体を直接編集すれば即リポジトリに反映される(ドリフトなし)。パッケージは [mise](https://mise.jdx.dev/) 優先。

## Getting Started

```sh
curl -fsSL https://raw.githubusercontent.com/flum1025/dotfiles/master/qinstall.sh | bash
```

`qinstall.sh` が git / chezmoi を用意し、リポジトリを `~/dotfiles` へ clone して
`chezmoi apply` する(symlink 配置 + mise によるツール導入)。

## 構成

```
~/dotfiles/
├── .chezmoiroot          # "home" — chezmoi のソースは home/ 配下のみ
├── qinstall.sh           # ブートストラップ
├── home/                 # ★ chezmoi ソース(= $HOME に配置される中身)
│   ├── dot_zshrc / dot_tmux.conf ...
│   ├── dot_config/       # zsh, tmux, alacritty, workmux, git, mise, nvim(symlink) ...
│   ├── Library/...       # lazygit(macOS のみ / .chezmoiignore で Linux 除外)
│   └── run_onchange_after_install-packages.sh.tmpl  # mise でツール導入
├── nvim/                 # Neovim 設定(~/.config/nvim へ whole-dir symlink)
└── vimrc/ lima/ scripts/ # 未デプロイ(参考用に保管)
```

## 日常運用

- 設定は symlink なので、`~/.zshrc` などを直接編集すればそのままリポジトリ側が変わる。
- 別マシンへ反映: `git pull` 後に `chezmoi apply`(symlink なので通常は pull だけで十分)。
- 管理対象の追加: `home/` 配下に chezmoi 命名規則(`dot_` 等)でファイルを置く。
- 乖離確認: `chezmoi status` / `chezmoi diff`。

## パッケージ管理(mise 優先)

- mise で入るツールは `home/dot_config/mise/conf.d/dotfiles.toml` に宣言。
- GUI / システムライブラリなど mise で扱えないものは brew(macOS)/ apt(Linux)。
- 宣言変更時は `chezmoi apply` で `run_onchange` が再実行され導入される。

## Support

- macOS / Linux(apt)
