FROM haskell:9.8.4-slim-bullseye AS builder

ENV HADOLINT_COMMIT=28fc39f92e2768d8cc9f94d6e2fc16bd4397f092
ENV INSTALL_DIR=/opt/hadolint/bin
RUN mkdir -p $INSTALL_DIR
# Imposta /hadolint come working directory per i RUN successivi
WORKDIR /hadolint
RUN git clone https://github.com/hadolint/hadolint.git /hadolint
RUN git checkout $HADOLINT_COMMIT
RUN cabal update
RUN cabal configure
RUN cabal build
RUN cabal install --installdir=$INSTALL_DIR

FROM scratch
COPY --from=builder /opt/hadolint/bin/hadolint /bin/hadolint

CMD ["/bin/hadolint", "-"]
