FROM haskell:9.10.2-slim-bullseye AS builder

ENV HADOLINT_COMMIT=362c8043f1453a96daa9316a69b0372e396353e0
ENV INSTALL_DIR=/opt/hadolint/bin
RUN mkdir -p $INSTALL_DIR
RUN apt-get update \
  && apt-get install -y --no-install-recommends git libgmp-dev \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /hadolint
RUN git clone https://github.com/hadolint/hadolint.git .
RUN git checkout $HADOLINT_COMMIT
RUN cabal v2-update
RUN cabal v2-install exe:hadolint \
  --installdir=$INSTALL_DIR \
  --overwrite-policy=always \
  --disable-documentation \
  --disable-library-profiling \
  --disable-shared \
  --enable-executable-static

FROM scratch

COPY --from=builder --chmod=0755 \
  /opt/hadolint/bin/hadolint /usr/bin/hadolint

CMD ["/usr/bin/hadolint", "-"]
