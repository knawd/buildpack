#! /bin/sh 

pack builder create quay.io/knawd/builder:rust --config ./builders/rust/builder.toml
podman push quay.io/knawd/builder:rust

pack buildpack package knawd-rust --config ./buildpacks/rust/package.toml

## build stack

podman build . -t quay.io/knawd/stack:rust
podman push quay.io/knawd/stack:rust
## build app

pack build helloworld-rust-wasi --path ./apps/rust/helloworld-rust-wasi --buildpack ./buildpacks/rust --builder  quay.io/knawd/builder:rust --docker-host=inherit -v --trust-builder



