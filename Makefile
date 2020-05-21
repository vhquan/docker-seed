NAME=custom-docker
VERSION=16.04
HOSTNAME=env-docker
USERNAME=fw-builder # use for non-root user
CONTAINER_NAME=$(USER)_$(NAME)_$(VERSION)

.PHONY: build run clean

build:
	docker build -t $(NAME):$(VERSION) --build-arg http_proxy=$(http_proxy) \
		--build-arg https_proxy=$(https_proxy) --build-arg no_proxy=$(no_proxy) \
		--build-arg user=$(USERNAME) --network host .

clean:
	docker rmi -f $(NAME):$(VERSION)
