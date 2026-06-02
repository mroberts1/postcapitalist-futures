.PHONY: serve build

# Copy tracked config files into local Quartz install before building
_sync-config:
	cp quartz.config.ts quartz/quartz.config.ts
	cp quartz.layout.ts quartz/quartz.layout.ts

serve: _sync-config
	cd quartz && node ./quartz/bootstrap-cli.mjs build --serve --wsPort 3002

build: _sync-config
	cd quartz && node ./quartz/bootstrap-cli.mjs build
