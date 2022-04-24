
SHELL:=/bin/bash
CWD:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
PYPROJ_TAG:=pvphan/gtsam-pyproj:0.1

test: image
	docker run --rm -it \
		--volume ${CWD}:/gtsam-python-project:ro \
		${PYPROJ_TAG} \
			python python/tests/test_example.py

shell: image
	docker run --rm -it \
		--volume ${CWD}:/gtsam-python-project:ro \
		${PYPROJ_TAG} \
			bash

image:
	make -C ${CWD}/gtsam-image/ image
	docker build --tag ${PYPROJ_TAG} .

