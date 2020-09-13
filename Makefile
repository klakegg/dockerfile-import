IMAGE=klakegg/dockerfile-import

docker:
	@docker build -t $(IMAGE):dev .

docker-login:
	@docker login -u $$DOCKER_USERNAME -p $$DOCKER_TOKEN

push-edge:
	@docker tag $(IMAGE):dev $(IMAGE):edge
	@docker push $(IMAGE):edge

push-release:
	@docker tag $(IMAGE):dev $(IMAGE):$$VERSION
	@docker tag $(IMAGE):dev $(IMAGE):latest
	@docker push $(IMAGE):$$VERSION
	@docker push $(IMAGE):latest