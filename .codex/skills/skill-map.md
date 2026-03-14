# Claude Commands と Codex Skills の対応表

`.claude/commands/` のうち、再利用価値が高く SKILL 化した項目をまとめる。

| Claude command | Codex skill | 判断 |
| --- | --- | --- |
| `.claude/commands/ai-context-note.md` | `.codex/skills/ai-context-note/SKILL.md` | 採用 |
| `.claude/commands/check-ai-instructions.md` | `.codex/skills/check-ai-instructions/SKILL.md` | 採用 |
| `.claude/commands/check-fact.md` | `.codex/skills/check-fact/SKILL.md` | 採用 |
| `.claude/commands/commit-message.md` | `.codex/skills/commit-message/SKILL.md` | 採用 |
| `.claude/commands/compare-options.md` | `.codex/skills/compare-options/SKILL.md` | 採用 |
| `.claude/commands/decision-log.md` | `.codex/skills/decision-log/SKILL.md` | 採用 |
| `.claude/commands/integration-guide.md` | `.codex/skills/integration-guide/SKILL.md` | 採用 |
| `.claude/commands/knowledge-capture.md` | `.codex/skills/knowledge-capture/SKILL.md` | 採用 |
| `.claude/commands/research-note.md` | `.codex/skills/research-note/SKILL.md` | 採用 |
| `.claude/commands/review-writing.md` | `.codex/skills/review-writing/SKILL.md` | 採用 |
| `.claude/commands/tmp-note.md` | `.codex/skills/tmp-note/SKILL.md` | 採用 |
| `.claude/commands/workflow-note.md` | `.codex/skills/workflow-note/SKILL.md` | 採用 |

## 判断メモ

- 12 件とも、案件依存が薄く、入出力形式が安定しており、横断再利用に向いている
- いずれも文書作成または文書レビューの定型ワークフローで、skill 化の効果が高い
- Claude 側は `commands` を実行入口、`.claude/skills/` を再利用用ソースとして扱う
