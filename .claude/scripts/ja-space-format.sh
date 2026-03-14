#!/usr/bin/env python3

import json
import re
import sys
from pathlib import Path


CJK = r"\u3040-\u30ff\u3400-\u4dbf\u4e00-\u9fff"
INLINE_CODE_RE = re.compile(r"(`[^`]*`)")
FENCE_RE = re.compile(r"^\s*(```|~~~)")
SEPARATOR_RE = re.compile(rf"([{CJK}])([A-Za-z0-9])|([A-Za-z0-9])([{CJK}])")
PAREN_RE = re.compile(rf"([{CJK}])(\()|(\))([{CJK}])")


def load_hook_input() -> dict:
    if len(sys.argv) > 1:
        return {"tool_input": {"file_path": sys.argv[1]}}

    raw = sys.stdin.read().strip()
    if not raw:
        return {}

    try:
        return json.loads(raw)
    except json.JSONDecodeError:
        return {}


def is_target_file(path: Path) -> bool:
    if not path.is_file() or path.suffix.lower() != ".md":
        return False

    normalized = path.as_posix()
    return (
        normalized == "README.md"
        or normalized.startswith("docs/")
        or normalized.startswith(".claude/")
        or "/docs/" in normalized
        or "/.claude/" in normalized
    )


def load_exclusions(path: Path) -> list[str]:
    if not path.is_file():
        return []

    try:
        data = json.loads(path.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError):
        return []

    exclusions = data.get("exclusions", [])
    return [item for item in exclusions if isinstance(item, str) and item]


def spaced_variant(text: str) -> str:
    updated = SEPARATOR_RE.sub(
        lambda m: f"{m.group(1)} {m.group(2)}" if m.group(1) else f"{m.group(3)} {m.group(4)}",
        text,
    )
    return PAREN_RE.sub(
        lambda m: f"{m.group(1)} {m.group(2)}" if m.group(1) else f"{m.group(3)} {m.group(4)}",
        updated,
    )


def format_plain_text(text: str, exclusions: list[str]) -> str:
    parts = INLINE_CODE_RE.split(text)
    formatted: list[str] = []

    for part in parts:
        if not part or part.startswith("`"):
            formatted.append(part)
            continue

        updated = spaced_variant(part)
        for exclusion in exclusions:
            updated = updated.replace(spaced_variant(exclusion), exclusion)
        formatted.append(updated)

    return "".join(formatted)


def should_skip_line(line: str, in_fence: bool, in_front_matter: bool) -> bool:
    stripped = line.lstrip()
    if in_fence or in_front_matter:
        return True
    if line.startswith("    ") or line.startswith("\t"):
        return True
    if stripped.startswith("|"):
        return True
    if "http://" in line or "https://" in line:
        return True
    return False


def main() -> int:
    hook_input = load_hook_input()
    file_path = hook_input.get("tool_input", {}).get("file_path")
    if not file_path:
        return 0

    path = Path(file_path)
    if not path.is_absolute():
        path = Path.cwd() / path
    path = path.resolve()

    if not is_target_file(path):
        return 0

    try:
        original = path.read_text(encoding="utf-8")
    except OSError:
        return 0

    exclusions = load_exclusions(Path(__file__).with_name("ja-space-exclusions.json"))
    lines = original.splitlines(keepends=True)
    result: list[str] = []
    in_fence = False
    in_front_matter = False
    front_matter_opened = False

    for index, line in enumerate(lines):
        stripped = line.strip()

        if index == 0 and stripped == "---":
            in_front_matter = True
            front_matter_opened = True
            result.append(line)
            continue

        if in_front_matter:
            result.append(line)
            if stripped in {"---", "..."}:
                in_front_matter = False
            continue

        if FENCE_RE.match(line):
            in_fence = not in_fence
            result.append(line)
            continue

        if should_skip_line(line, in_fence, in_front_matter):
            result.append(line)
            continue

        trailing_newline = ""
        body = line
        if line.endswith("\r\n"):
            trailing_newline = "\r\n"
            body = line[:-2]
        elif line.endswith("\n"):
            trailing_newline = "\n"
            body = line[:-1]

        result.append(format_plain_text(body, exclusions) + trailing_newline)

    updated = "".join(result)
    if front_matter_opened and not original.startswith("---"):
        return 0

    if updated != original:
        path.write_text(updated, encoding="utf-8")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
