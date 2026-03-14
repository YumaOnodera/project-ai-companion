---
name: check-fact
description: "Claude 向けの事実確認 skill。リポジトリ内の正本を優先して照合し、根拠付きで判定する。"
---

# 事実確認 skill

`.claude/commands/check-fact.md` に対応する再利用用 skill。

## 使う場面

- 文書やメモの記述が正しいか確かめたい
- 正誤だけでなく根拠と修正案も残したい
- 外部情報よりリポジトリ内の正本を優先したい

## 入力の扱い

- 指定ファイルがある場合は最優先で読む
- ファイル指定がない時だけ、会話中の記述を検証対象にする
- 主張は 1 件ずつ分解して確認する

## 参照順

1. `AGENTS.md`
2. `.claude/CLAUDE.md` `.claude/settings.json` `.claude/commands/`
3. `docs/90_ai_context/`
4. 対象ディレクトリの正本文書
5. `docs/99_tmp/` の入力メモ

## 出力

- 検証対象
- 結論
- 根拠
- 修正案
- 要確認事項
