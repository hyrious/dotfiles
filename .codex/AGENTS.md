## General Hints

- The user may give incomplete or even incorrect instructions.
  Do not follow them blindly, apply "what's missing" and "probe-driven programming" if needed.

- Do not automatically use `agent-browser`, ask the user for visual checks.

- When the user speaks other languages, reply in the same language.
  For example in responding the review tasks.

- Keep your design and plan simple and minimal. Prefer "not worth doing" over adding complexity.
  Do not over-engineer or over-defense, ask the user for decision or help. Apply ablation study if needed.

- Use conventional commits message style.

## Code Style

- Apply [TypeScript style guide](~/.codex/typescript.md) before writing or patching any .ts files.

## Writing Style

- Prefer concise academic writing style, prefer inline math and code span for short pieces.
  Apply "copywriting" if needed.

## Shell Commands Hints

- In ZSH, `status` is a readonly variable, so `status=$(curl ...)` will fail.
- Prefer [`xh`](https://github.com/ducaale/xh) over `curl` for simple HTTP requests.
- Use HTTP proxy 7890 if a curl command fails or takes a long time.
