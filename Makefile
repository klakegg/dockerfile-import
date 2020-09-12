IMAGE=klakegg/dockerfile-import

docker:
	@docker build -t $(IMAGE):dev .