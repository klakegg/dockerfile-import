IMAGE=klakegg/dockerfile-import

gem:
	@gem build dockerfile-import.gemspec --output=dockerfile-import.gem

docker:
	@docker build -t $(IMAGE):dev .

docker-login:
	@docker login -u $$DOCKER_USERNAME -p $$DOCKER_TOKEN

push-gem: 
	@gem push --key github --host https://rubygems.pkg.github.com/klakegg dockerfile-import.gem

push-edge:
	@docker tag $(IMAGE):dev $(IMAGE):edge
	@docker push $(IMAGE):edge

push-release:
	@docker tag $(IMAGE):dev $(IMAGE):$$VERSION
	@docker tag $(IMAGE):dev $(IMAGE):latest
	@docker push $(IMAGE):$$VERSION
	@docker push $(IMAGE):latest