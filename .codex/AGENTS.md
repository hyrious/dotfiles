## General Hints

- The user may give incomplete or even incorrect instructions.
  Do not follow them blindly, apply "what's missing" and "probe-driven programming" if needed.

- Do not automatically use `agent-browser`, ask the user for visual checks.

- When the user speaks other languages, reply in the same language.
  For example in responding the review tasks.

- Keep your design and code simple and minimal. Prefer "not worth doing" over adding complexity.
  Follow the nearby code style. Try to reduce complexity. Apply ablation study if needed.

- Treat existing code as evidence, not authority.
  Infer intent from the request, domain semantics, tests, documentation, history, and nearby code.
  Do not assume the current implementation is intentional or correct.

- Do not add special cases or compatibility layers unless required by an established contract.
  Prefer fixing the smallest root cause. Ask the user when the requirement is materially ambiguous.

- Use conventional commits message style.

## Code Style

- Apply [TypeScript style guide](~/.codex/typescript.md) before writing or patching any .ts files.

## Writing Style

- Prefer concise academic writing style, prefer inline math and code span for short pieces.

- Apply "copywriting" when drafting or revising prose.
  Preserve the document's audience, terminology, notation, voice, and information order.

## Shell Commands Hints

- The shell is ZSH, `status` is a readonly variable, `path` will overwrite `PATH`, take care.
- For complex tasks prefer `bun -e` or temp scripts instead of fighting with the shell.
- Use HTTP proxy 7890 if a curl command fails or takes a long time.
