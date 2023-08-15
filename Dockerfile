FROM alpine:3.18.2

COPY OWL-LISP_* /tmp/
RUN apk add git make gcc musl-dev && \
    mkdir -p /opt && \
    git clone https://gitlab.com/owl-lisp/owl.git -b v$(cat /tmp/OWL-LISP_VERSION) && \
    cd owl && \
    make && \
    make install && \
    cd / && \
    rm -rf /opt/owl && \
    apk del git make
