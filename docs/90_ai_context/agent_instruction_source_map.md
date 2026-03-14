# Agent Instruction Source Map

## 目的

Codex と Claude Code が、このリポジトリでどの設定や指示を起点に読むべきかを整理する。

## 適用範囲

- `project-ai-companion` で Codex を使う作業
- `project-ai-companion` で Claude Code を使う作業
- AI エージェント向けの設定責務や参照元の確認

## 参照優先順位

1. 共通方針は `docs/90_ai_context/repository_documentation_context.md` を参照する
2. Codex では `AGENTS.md` `.codex/README.md` `.codex/config.toml.example` `.codex/skills/` を優先する
3. Claude Code では `.claude/CLAUDE.md` `.claude/settings.json` `.claude/commands/` `.claude/skills/` を優先する
4. 保存先やテンプレートの判断は `docs/README.md` と `docs/90_ai_context/*.md` を参照する

## 指示ルール

- Codex の実設定は `~/.codex/config.toml`、リポジトリ内 `.codex/` は雛形として扱う
- Codex のプロジェクト固有ルールは `AGENTS.md` を正本とする
- Claude Code の共有権限ルールは `.claude/settings.json`、作業方針は `.claude/CLAUDE.md` を正本とする
- Claude Code の定型作業は `.claude/commands/`、再利用用 workflow は `.claude/skills/` に寄せる
- AI が保存先を迷った時は、まず `docs/README.md` のディレクトリ責務を確認する

## 禁止事項

- `.codex/` を Codex の自動読込設定として扱わない
- Claude Code の個人設定とプロジェクト共有設定を混在させない
- 権限設定だけで運用ルールを完結した前提にしない

## 更新条件

- Codex または Claude Code の設定責務が変わった時
- `AGENTS.md` や `.claude/` 配下の正本配置が変わった時
- 新しい AI エージェントを標準に追加した時

## 関連ドキュメント

- `.codex/README.md`
- `.codex/skills/README.md`
- `.claude/CLAUDE.md`
- `.claude/settings.json`
- `.claude/skills/README.md`
