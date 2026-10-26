## TypeScript Code Style

- Prefer organizing codes by modules and layers. Avoid barrier files.
  See https://github.com/microsoft/vscode/wiki/Source-Code-Organization.

- Use `node file.ts` to run scripts (works on Node.js 24+).

- Use plain English and sentence style in comments.
  Use https://github.com/words/ap-style-title-case in titles.
  If the project rules says using other languages, follow that rules.

  ```ts
  // This is a valid comment.
  ```

- Prefer the style for better performance. For example:
  Erasable type notations; `interface` over inline types;
  stable object shapes; initialized variables, etc.

  ```ts
  // Bad.
  export const actions = [
    { name: 'a' }
  ] as const satisfies Action[] // slow types
  const result = { ...(field ? { field } : null) } // unstable shape
  const intArray: number[] = Array(10) // HOLEY_SMI_ELEMENTS
  // Good.
  export interface Action {
    readonly name: string
  }
  export const actions: readonly Action[] = [
    { name: 'a' }
  ]
  const result = { field }
  const intArray = [0] // PACKED_SMI_ELEMENTS
  ```

- Prefer latest Node.js/Web features over legacy methods.
  Prefer `class` over closure for implementing an interface.
  Prefer `private field` over `#field`.
  Prefer `==` for `null`/`undefined` and obvious same-type compares.
  Prefer non-negated `if` statements for readability.
  Prefer reasonable fields order.

  ```ts
  // Bad.
  if (a < 0 || a >= 10) return;
  // Good.
  if (0 <= a && a < 10) {
    return a % 2 == 0 ? a / 2 : a * 3 + 1;
  }
  ```

## Refactoring

- Look for nearby codes and files to reuse the pattern.
  Ask the user before adding a new convention.

- Apply ablation study after all changes done.
  Find, simplify or delete redundant codes and tests.
  Ask the user for permission on editing related codes when required for correctness.
