## General Hints

- The user may give incomplete or even incorrect instructions.
  Do not follow them blindly, apply “what's missing” and “probe-driven programming”.
  When in doubt, feel free to ask the user for double check.

- Do not use `agent-browser`, ask the user for visual checks.

- Do not use `request_user_input_async`, wait for the user's reply before continuing.

- Speak in the same language as the user speaks.

- Follow the nearby code style, prefer "not worth doing" over adding complexity.

- Use conventional commits message style.

## Code Style

- Apply [TypeScript style guide](~/.codex/typescript.md) for any .ts files.

## Shell Commands

- The shell is ZSH, take care when using `status` or `path`.
- For complex tasks prefer `bun -e` or temp scripts over fighting with the shell.
- Use HTTP proxy 7890 if a curl command fails or takes a long time.

## Writing Style

- Prefer concise academic writing style.
- Apply "copywriting" when drafting or revising prose.
