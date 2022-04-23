FROM pvphan/gtsam-image:4.1.1

COPY . /tmp/gtsam-python-project
WORKDIR /tmp/gtsam-python-project

RUN mkdir build && cd build && cmake .. && make -j && make python-install
