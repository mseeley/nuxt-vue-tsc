## Description

Disabling Nuxt auto-import of `components` _and_ installing modules _with_ PNPM _without_ `shamefully-hoist=true` breaks `vue-tsc` type-checking of Vue component generics.

### Environment

- Mac Sequoia 15.3.2 (24D81)
- Node.js modules
  - `"nuxt": "3.16.1"`
  - `"vue-tsc": "2.2.8"`
  - `"node": "22.14.0"`
  - `"pnpm": "10.6.5"`
- VSCode 1.98.2
  - "Vue - Official" extension (`vue.volar` `2.2.8`)

## Tests

There are 6 tests inside the `Makefile` which execute different combinations of Node.js package manager, Nuxt `components` configuration, and PNPM `shamefully-hoist` setting. Running tests is easy on Mac and Linux. See `Makefile` and `fixtures/*` for more context.

This is the test which reproduces the issue:

```
$ make pnpm-shamefully-hoist-false-components-empty-dirs
```

### Screenshots

- [CLI output](./screenshots/SCR-20250321-oluy.png)
- [VSCode language services](./screenshots/SCR-20250321-ombw.png) (after restarting tsserver)

## Results

These tests demonstrate the breaking ccombination

| Module Manager | `shamefully-hoist` | `components`   | Pass | Repro                                                    |
| -------------- | ------------------ | -------------- | ---- | -------------------------------------------------------- |
| `npm@10.2.4`   | n/a                | `{ dirs: [] }` | ✅   | `make npm-components-empty-dirs`                         |
| `pnpm@10.6.5`  | `true`             | `{ dirs: [] }` | ✅   | `make pnpm-shamefully-hoist-true-components-empty-dirs`  |
| `pnpm@10.6.5`  | `false`            | `{ dirs: [] }` | ❌   | `make pnpm-shamefully-hoist-false-components-empty-dirs` |
| `npm@10.2.4`   | n/a                | `undefined`    | ✅   | `make npm-components-undefined`                          |
| `pnpm@10.6.5`  | `true`             | `undefined`    | ✅   | `make pnpm-shamefully-hoist-true-components-undefined`   |
| `pnpm@10.6.5`  | `false`            | `undefined`    | ✅   | `make pnpm-shamefully-hoist-false-components-undefined`  |

⭐️ `pnpm` tests show identical behavior on `v8.15.1`.
