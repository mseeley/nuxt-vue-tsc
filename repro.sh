rm -rf .npmrc nuxt.config.ts node_modules/
cp fixtures/.npmrc-shamefully-hoist-false .npmrc
cp fixtures/nuxt.config-components-empty-dirs.ts nuxt.config.ts
pnpm i
npm run _tc
pnpm _tc