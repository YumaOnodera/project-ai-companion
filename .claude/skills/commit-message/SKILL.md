---
name: commit-message
description: "Claude 向けのコミットメッセージ作成 skill。変更内容から `<type>: <要約>` 形式の日本語案をまとめる。"
---

# コミットメッセージ作成 skill

`.claude/commands/commit-message.md` に対応する再利用用 skill。

## 使う場面

- 変更差分に合うコミットメッセージ案が欲しい
- `type` の選択に迷っている
- 1 コミット 1 目的に収まるか確認したい

## 進め方

1. 変更の主目的を 1 つに絞る
2. `feat` `fix` `docs` `refactor` `test` `chore` から最も近い `type` を選ぶ
3. `<type>: <要約>` 形式で日本語の短い要約を作る
4. 複数目的なら分割案も出す

## 出力

- 推奨コミットメッセージ
- 判定理由
- 分割が必要な場合は代替案
