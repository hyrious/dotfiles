## TypeScript Code Style

- Use plain english and sentence style in comments.
  Use [ap-style-title-case](https://github.com/words/ap-style-title-case) in titles.
  If the project rules says using other languages, follow that rules.

  ```ts
  // This is a valid comment.
  ```

- Prefer consistent visual style when editing or adding similar code.
  If the project configures a formatter like pretter or oxfmt, follow that config.

  ```ts
  export async function get<R>(path: string, init?: Options): Promise<R> {}
  // Do not wrap the arguments just because it is wider than 80 columns.
  export async function post<B, R>(path: string, body?: B, init?: Options): Promise<R> {}
  ```

- Prefer `interface` over `type` over inline object literals.

  ```ts
  // Bad.
  function parse(blocks: readonly {
    name: string
  }[])
  // Good.
  interface Block {
    name: string
  }
  function parse(blocks: readonly Block[])
  ```

- Prefer `==` for `null`/`undefined` and obvious same-type compares, otherwise `===`.

  ```ts
  function search(query: string | null) {
    if (query == null) return; // Handles both null and undefined.
    if (query == 'whosyourdaddy') return secret; // Obviously same type.
  }
  if (typeof VERSION == 'string') {} // `typeof` always returns string.
  ```

- Prefer non-negated range check and match the hot path first, unless in trivial one-liners.

  ```ts
  // Bad. NaN slips through.
  if (a < 0 || a >= 10) return;
  // Good.
  if (0 <= a && a < 10) {
    return a % 2 == 0 ? a / 2 : a * 3 + 1;
  }
  ```

- Prefer not using `as const` or `satisfies` for TypeScript performance.

  ```ts
  // Bad.
  export const actions = [
    { name: 'a' },
    { name: 'b' },
  ] as const satisfies Action[]
  export type ActionName = (typeof actions)[number]['name']
  // Good.
  export interface Action {
    name: string
  }
  export const actions: readonly Action[] = [
    { name: 'a' },
    { name: 'b' },
  ]
  export const actionNames: Set<string> = new Set(actions.map(a => a.name))
  ```

- Prefer leaving `undefined` fields over the `...` trick for runtime optimizations.
  Reference: https://mrale.ph/blog/2015/01/11/whats-up-with-monomorphism.html

  ```ts
  // Bad.
  return {
    ...(field ? { field } : {}),
  }
  // Good.
  return {
    field,
  }
  ```

- Prefer initialize variables for runtime optimizations.

  ```ts
  // Bad.  v8 creates HOLEY_SMI_ELEMENTS
  let intArray: number[] = Array(10)
  // Good. v8 creates PACKED_SMI_ELEMENTS which performs better
  let intArray = [0]
  ```

- Prefer latest Node.js/Web features over legacy methods.
  Prefer running TypeScript files with `node file.ts` over `tsx`.

  ```ts
  // Bad.
  document.execCommand('copy')
  // Good.
  navigator.clipboard.writeText('text')
  ```

- Prefer proven small libraries over hand-rolled helper functions.

  ```ts
  // Bad.
  function deepEqual(a, b) { /*impl*/ }
  // Good.
  import { dequal } from 'dequal/lite'
  ```

- Prefer type-safe confidence over defensive programming.

  ```ts
  // Bad.
  if (typeof process == 'object' && typeof process.version == 'string') {
    return process.version.match(/^v([\d+.]+)/)?.[1];
  }
  // Good. We know that variable is 99.9% the right type and value.
  if (globalThis.process) {
    return process.versions.node;
  }
  ```

- Prefer helper assert functions over `as Type` for narrowing unknown source.

  ```ts
  // Bad.
  function parse(data: unknown) {
    let query = (data as Record<string, unknown>)?.query
  }
  // Good.
  import { toPlainObject } from '@wopjs/cast'
  function parse(data: unknown) {
    let query = toPlainObject(data)?.query
  }
  ```

- Prefer class over closure for satisfying an interface, unless in React Hooks.
  Prefer `private field` over `#field`.

  ```ts
  interface Action { readonly name: string, run(): void }
  // Bad.
  function copyAction(): Action {
    return { name: 'copy', run() { } }
  }
  // Good.
  class CopyAction implements Action {
    readonly name: string = 'copy'
    public run(): void { }
  }
  ```

- Prefer organize codes by modules, layers, platforms. Avoid barrier files.
  Reference: https://github.com/microsoft/vscode/wiki/Source-Code-Organization

  ```js
  // Bad.
  interface.ts
  constants.ts
  someFunction.ts
  someClass.ts
  index.ts
  // Good.
  base/common/lifecycle.ts // Business-agnostic modules.
  file/common/fileService.ts // Common/abstract code.
  file/node/nodeFileService.ts // Platform related code.
  file/browser/webFileService.ts
  ```
