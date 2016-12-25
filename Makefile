all: build

build:
	docker build . -t winebarrel/rtail

push:
	docker push winebarrel/rtail

