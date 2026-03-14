# Business System Reference Priority Template

## 目的

既存案件へこのリポジトリを持ち込む時に、AI が参照すべき正本を読む順番で固定するための雛形。

## 適用範囲

- 案件側の `docs/90_ai_context/` に置く参照順テンプレート
- 要件整理、仕様更新、設計、実装、レビュー

## テンプレート

```md
# Reference Priority

## 目的

AI が `<project-name>` で参照すべき正本を、読む順番で固定する。

## 適用範囲

- 要件整理、仕様更新、設計、実装、レビュー
- Codex と Claude Code の共通参照順

## 参照優先順位

1. `AGENTS.md`
2. `.claude/CLAUDE.md`
3. `docs/00_overview.md`
4. `docs/README.md`
5. 作業対象ディレクトリの正本
6. `docs/90_ai_context/*.md`
7. `project-ai-companion` などの共通リポジトリ

## 読み進め方

- 要件やスコープを扱う時は、要件の正本ディレクトリを参照する
- 画面、データ、API、権限を扱う時は、仕様の正本ディレクトリを参照する
- 実装方式を扱う時は、設計の正本ディレクトリを参照する
- 実装順、テスト、運用を扱う時は、delivery 系の正本ディレクトリを参照する
- 一次情報や作業途中のメモは `docs/99_tmp` を参照し、整理後は正式ディレクトリへ移す

## 共通リポジトリを参照する場面

- AI ツールの一般的な運用ルールを確認したい時
- Codex / Claude Code の役割分担を確認したい時
- 案件固有ではない文書運用やナレッジ整理の基準が必要な時
```

## 関連ドキュメント

- `docs/90_ai_context/business_system_project_brief_template.md`
- `docs/90_ai_context/agent_instruction_source_map.md`
