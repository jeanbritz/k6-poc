
.PHONY: build
build:
	npm install && npm run bundle
	xk6 build --with calc=$(PWD)/extensions/calc

.PHONY: run
run: build
	./k6 run build/app.bundle.js