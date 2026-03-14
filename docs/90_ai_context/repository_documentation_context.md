# Repository Documentation Context

## 目的

このリポジトリで AI が Markdown を読む、整理する、生成する時に先に合わせるべき共通ルールをまとめる。

## 適用範囲

- `project-ai-companion` 内の文書整理、設定更新、導入資料の整備
- `docs/` 配下の新規作成、更新、再配置
- Codex と Claude Code のどちらで作業する場合も共通で参照する前提

## 参照優先順位

1. `AGENTS.md`
2. `README.md`
3. `docs/00_overview.md`
4. `docs/README.md`
5. この文書
6. `docs/90_ai_context/agent_instruction_source_map.md`
7. 対象のテンプレート文書

## 指示ルール

- 応答は日本語で簡潔に行う
- 複雑な作業では、実施前に短い計画を示す
- このリポジトリでは案件固有の要件、仕様、設計、実装は管理しない
- 文書の正本は `docs/` に集約し、まず `docs/90_ai_context` を優先する
- 一時メモは `docs/99_tmp` に置き、整理後に正式ディレクトリへ移す
- 事実として確認した内容と、未確認で `要確認` にすべき内容を分けて書く
- 既存の正本がある場合は本文を複製せず、参照関係でつなぐ
- Markdown は `.markdownlint.jsonc` に従う

## 禁止事項

- 秘匿情報、トークン、鍵、個人情報をコミットしない
- 根拠のない断定を文書に残さない
- 参照先がある内容を重複管理しない
- 案件固有の仕様、要件、設計をこのリポジトリに持ち込まない

## 更新条件

- `AGENTS.md` の方針が変わった時
- `docs/` の参照順序や正本構成が変わった時
- AI 作業時の共通ルールが増減した時

## 関連ドキュメント

- `README.md`
- `docs/README.md`
- `docs/90_ai_context/agent_instruction_source_map.md`
