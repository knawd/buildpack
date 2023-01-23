#! /bin/sh 

## build stack

podman build -f stacks/rust/run.Dockerfile -t quay.io/knawd/scratch
podman push quay.io/knawd/scratch

podman build -f stacks/rust/Dockerfile -t quay.io/knawd/stack:rust
podman push quay.io/knawd/stack:rust


pack builder create quay.io/knawd/builder:rust --config ./builders/rust/builder.toml
podman push quay.io/knawd/builder:rust

pack buildpack package knawd-rust --config ./buildpacks/rust/package.toml


## build app

pack build helloworld-rust-wasi --path ./apps/rust/helloworld-rust-wasi --buildpack ./buildpacks/rust --builder  quay.io/knawd/builder:rust --docker-host=inherit -v --trust-builder



