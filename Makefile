all: build push

build:
	docker build . -t winebarrel/rtail

push:
	docker push winebarrel/rtail

