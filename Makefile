
.PHONY: build
build:
	npm install && npm run bundle
	xk6 build --with calc=$(PWD)/extensions/calc

.PHONY: run
run: build
	./k6 run build/app.bundle.js

.PHONY: run-with-influxdb
run-with-influxdb: build
	./k6 run --vus 1000 --duration 30s --out influxdb=http://localhost:8086/k6 build/app.bundle.js

.PHONY: compose
compose:
	docker-compose up -d