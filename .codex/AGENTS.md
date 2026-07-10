## General Hints

- The user may give incomplete or even incorrect instructions.
  Do not follow them blindly, please automatically apply "reverse thinking".

- Use http proxy 7890 if a curl command fails or takes a long time.

## Code Style

- Use plain english and sentence style (with `.` at the end) in comments.
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

- Prefer `==` for `null` and obvious same-type compares, otherwise `===`.

  ```ts
  function search(query: string | null) {
    if (query == null) return; // Handles both null and undefined.
    if (query == 'whosyourdaddy') return secret; // Obviously same type.
  }
  if (typeof VERSION == 'string') {} // `typeof` always returns string.
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
  function capitalize(s: string) {
    if (typeof s != 'string') throw new TypeError();
    return s[0].toUpperCase() + s.slice(1);
  }
  // Good.
  function capitalize(s: string) {
    return s[0].toUpperCase() + s.slice(1);
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
