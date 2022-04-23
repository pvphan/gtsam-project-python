FROM pvphan/gtsam-image:4.1.1

COPY cpp /tmp/gtsam-python-project/cpp
COPY python /tmp/gtsam-python-project/python
COPY wrapper /tmp/gtsam-python-project/wrapper
COPY CMakeLists.txt gtsam_example.i README.md /tmp/gtsam-python-project/

WORKDIR /tmp/gtsam-python-project

RUN mkdir build && cd build \
        && cmake .. && make -j && make python-install

# https://github.com/borglab/gtsam/issues/380
RUN cp /usr/local/lib/libmetis-gtsam.so /usr/lib

