clean :
	rm -rf .npmrc nuxt.config.ts node_modules/

test :
	echo "🚀 npm run _tc"; npm run _tc; echo "🚀pnpm _tc"; pnpm _tc

# Pass
pnpm-shamefully-hoist-true-components-empty-dirs :
	$(MAKE) clean
	cp fixtures/.npmrc-shamefully-hoist-true .npmrc
	cp fixtures/nuxt.config-components-empty-dirs.ts nuxt.config.ts
	pnpm i
	$(MAKE) test

# Fail
pnpm-shamefully-hoist-false-components-empty-dirs :
	$(MAKE) clean
	cp fixtures/.npmrc-shamefully-hoist-false .npmrc
	cp fixtures/nuxt.config-components-empty-dirs.ts nuxt.config.ts
	pnpm i
	$(MAKE) test

# Pass
pnpm-shamefully-hoist-true-components-undefined :
	$(MAKE) clean
	cp fixtures/.npmrc-shamefully-hoist-true .npmrc
	cp fixtures/nuxt.config-components-undefined.ts nuxt.config.ts
	pnpm i
	$(MAKE) test

# Pass
pnpm-shamefully-hoist-false-components-undefined :
	$(MAKE) clean
	cp fixtures/.npmrc-shamefully-hoist-false .npmrc
	cp fixtures/nuxt.config-components-undefined.ts nuxt.config.ts
	pnpm i
	$(MAKE) test

# Pass
npm-components-empty-dirs :
	$(MAKE) clean
	cp fixtures/nuxt.config-components-empty-dirs.ts nuxt.config.ts
	npm i
	$(MAKE) test

# Pass
npm-components-undefined :
	$(MAKE) clean
	cp fixtures/nuxt.config-components-undefined.ts nuxt.config.ts
	npm i
	$(MAKE) test
