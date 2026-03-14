# Business System Project Brief Template

## 目的

既存の業務システム案件へこのリポジトリを持ち込む時に、AI が作業開始前に短時間で把握すべき前提を整理するための雛形。

## 適用範囲

- 案件側の `docs/90_ai_context/` に最初の 1 枚として置く文書
- Codex と Claude Code の両方で参照する共通前提

## テンプレート

```md
# Project Brief

## 目的

`<project-name>` で AI が作業を始める前に、プロジェクトの目的とドキュメントの持ち方を短時間で把握するための要約を置く。

## 適用範囲

- `<project-name>` の要件整理、仕様作成、設計、実装、レビュー
- Codex と Claude Code の両方で参照する共通前提

## プロジェクト概要

- プロダクト名: `<project-name>`
- 一言でいうと: `<one-line-summary>`
- 主目的: `<main-purpose>`
- 管理対象: `<what-this-repo-manages>`
- 横断知見の正本: `project-ai-companion` などの共通リポジトリを参照する

## 現在の前提

- `docs/` は `<canonical-doc-usage>`
- `docs/99_tmp` は `<tmp-usage>`
- 未確定項目がある場合は断定せず `要確認` として扱う

## 正本

- 参照開始点: `<entry-doc>`
- ディレクトリ責務: `<docs-readme>`
- Codex 向け指示: `AGENTS.md`
- Claude Code 向け指示: `.claude/CLAUDE.md`

## 要確認

- 解決したい課題
- 想定ユーザー
- 現在の開発フェーズ
- 今回の対象範囲と今回やらないこと
```

## 関連ドキュメント

- `docs/90_ai_context/business_system_reference_priority_template.md`
- `docs/90_ai_context/agent_instruction_source_map.md`
