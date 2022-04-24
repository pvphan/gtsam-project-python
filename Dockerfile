FROM pvphan/gtsam-image:4.1.1

COPY cpp /tmp/gtsam-python-project/cpp
COPY python /tmp/gtsam-python-project/python
COPY wrapper /tmp/gtsam-python-project/wrapper
COPY CMakeLists.txt gtsam_example.i README.md /tmp/gtsam-python-project/

WORKDIR /tmp/gtsam-python-project
# https://github.com/borglab/gtsam/issues/380#issuecomment-1053260888
RUN mkdir build && cd build \
        && cmake .. && make -j install && make python-install \
        && cp /usr/local/lib/libmetis-gtsam.so /usr/lib \
        && rm -rf /tmp/gtsam-python-project

WORKDIR /gtsam-python-project
