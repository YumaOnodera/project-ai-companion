---
name: integration-guide
disable-model-invocation: true
description: "Claude 向けの連携手順書作成 skill。外部サービス連携の前提、手順、確認項目、注意点を整理する。"
---

# 連携手順書作成 skill

Claude Code の定型作業を `/integration-guide` で呼ぶための skill。

## 使う場面

- SaaS や API 連携の導入手順を残したい
- 事前確認から動作確認まで一式で整理したい
- `docs/30_integrations/` 向けの文書を作りたい

## 進め方

1. 連携対象と利用目的を明記する
2. 前提条件、必要権限、事前確認事項を整理する
3. 設定手順を実行順で書く
4. 動作確認と運用上の注意を分けてまとめる
5. 不確実な点は `要確認事項` として残す

## 出力

- タイトル
- 対象
- 前提
- 事前確認
- 設定手順
- 動作確認
- 運用上の注意
- 要確認事項
- 参照元
