---
name: decision-log
disable-model-invocation: true
description: "Claude 向けの意思決定ログ作成 skill。背景、選択肢、決定、理由、影響範囲を整理して残す。"
---

# 意思決定ログ作成 skill

Claude Code の定型作業を `/decision-log` で呼ぶための skill。

## 使う場面

- 運用判断や ADR を記録したい
- 後から理由を追える形で残したい
- `docs/40_decisions/` 向けに Markdown を整えたい

## 進め方

1. `決定事項` を 1 文で定義する
2. `決定日` と `ステータス` を書く
3. 背景、選択肢、最終決定、理由を整理する
4. 影響範囲、リスク、フォローアップを残す

## 出力

- 決定事項
- 決定日
- ステータス
- 背景
- 選択肢
- 決定
- 理由
- 影響範囲
- リスクと対応
- 要確認事項
- 関連ドキュメント
