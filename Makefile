IMAGENAME?=jtilander/semaphore
TAG?=latest

.PHONY: image push clean run debug up down

image:
	@docker build -t $(IMAGENAME):$(TAG) .
	@docker images $(IMAGENAME):$(TAG)

push: image
	@docker push $(IMAGENAME):$(TAG)

clean:
	@docker rmi `docker images -q $(IMAGENAME):$(TAG)`

run:
	@command docker run --rm -it $(IMAGENAME):$(TAG)

debug:
	@command docker run --rm -it $(IMAGENAME):$(TAG) bash

up:
	@docker-compose up -d && docker-compose logs -f

down:
	@docker-compose down
