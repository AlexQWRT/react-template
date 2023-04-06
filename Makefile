
install: install-env \
	install-docker-override \
	install-node-packages \
	start

install-env:
	cp -n ./docker/.env.example ./docker/.env
	cp -n ./src/.env.example ./src/.env

install-docker-override:
	cp -n ./docker/compose.override.yml.example ./docker/compose.override.yml

install-docker-node:
	cd docker && \
    docker-compose build --build-arg HOST_UID=$(shell id -u) node && \
    docker-compose up -d node

install-node-packages:
	cd docker && docker-compose run --rm -T node yarn install

clean:
	cd docker && docker-compose down
	git clean -fdx -e .idea

start:
	cd docker && docker-compose up -d
	@echo "Started"

terminal:
	cd docker && docker exec -it twilio-client_node bash
