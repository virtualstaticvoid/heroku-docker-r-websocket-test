# default build target
all::

.PHONY: all
all:: build

.PHONY: build
build:
	docker build --tag heroku-docker-r-example:websocket-test .

.PHONY: run
run: build
	docker run -it -p "8080:8080" heroku-docker-r-example:websocket-test
	xdg-open http://localhost:8080

.PHONY: test
test: run
	@curl -v "localhost:8080"
