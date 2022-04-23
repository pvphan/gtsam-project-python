
SHELL:=/bin/bash
CWD:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
IMAGE_TAG?=pvphan/gtsam-pyproj:0.1

test: image
	docker run --rm -it \
		--volume ${CWD}:/gtsam-python-project:ro \
		${IMAGE_TAG} \
			python python/tests/test_example.py

shell: image
	docker run --rm -it \
		--volume ${CWD}:/gtsam-python-project:ro \
		${IMAGE_TAG} \
			bash

image:
	make -C gtsam-image/ image
	docker build --tag ${IMAGE_TAG} .

