# Copyright (C) 2023-2024  ANSSI
# SPDX-License-Identifier: CC0-1.0
FROM rust:1.88.0-alpine3.22 AS builder
WORKDIR /src/
RUN apk add --no-cache musl-dev
COPY Cargo.lock Cargo.toml /src/
COPY suricata-eve-sqlite-output/ /src/suricata-eve-sqlite-output/
COPY suricata-filedata-sqlite-output/ /src/suricata-filedata-sqlite-output/
RUN RUSTFLAGS="-C target-feature=-crt-static" cargo build --release

FROM alpine:20250108
RUN apk add --no-cache suricata lua5.4-sqlite netcat-openbsd
COPY . /suricata
COPY --from=builder /src/target/release/*.so /suricata/
ENTRYPOINT ["/suricata/entrypoint.sh"]
