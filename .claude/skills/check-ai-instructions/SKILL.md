---
name: check-ai-instructions
description: "Claude 向けの AI 指示レビュー skill。曖昧さ、重複、矛盾、優先順位の不明瞭さを見直す。"
---

# AI 指示レビュー skill

`.claude/commands/check-ai-instructions.md` に対応する再利用用 skill。

## 使う場面

- AI 向け指示文の品質を見直したい
- `AGENTS.md` や `.claude/CLAUDE.md` の重複や矛盾を減らしたい
- 最小差分で修正方針を出したい

## 入力の扱い

- 指定ファイルを最優先で確認する
- 対象は `AGENTS.md` `.claude/CLAUDE.md` `.claude/commands/*.md` `docs/90_ai_context/*.md` を想定する
- ファイル指定がない時だけ、会話中の指示文をレビュー対象にする

## 進め方

1. 文書の目的と適用範囲を確認する
2. 曖昧表現、重複、矛盾、優先順位不明を抽出する
3. 別文書との責務重複を確認する
4. 問題ごとに最小差分の修正方針を出す
5. 不確実な点は `要確認` に分ける

## 出力

- 対象
- レビュー結果
- 問題箇所
- 修正方針
- 要確認事項
