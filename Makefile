
install:
	npm install
	# If installed in dev context we link the primitives library instead of downloading it via npm.
	if [ -d "../github.com+openpeer+opjs-primitives" ]; then \
		rm -Rf node_modules/opjs-primitives; \
		ln -s ../../github.com+openpeer+opjs-primitives node_modules/opjs-primitives; \
	fi
	cd dev; make install

run:
	@node dev

test:
	cd dev; make test

publish:
	mkdir .dist
	cp -Rf * .dist/
	cp -Rf .*ignore .dist/
	rm -Rf .dist/node_modules
	rm -Rf .dist/dev/node_modules
	rm -Rf .dist/dev/helpers/*/node_modules
	cd .dist; npm publish
	rm -Rf .dist

.PHONY: install run test publish
