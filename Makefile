build:
	docker build -t hadolint-test .

test: build
	docker run --rm -i hadolint-test < Dockerfile
