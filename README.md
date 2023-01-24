# knawd buildpack

This repository is currently under active development.

The steps below work but there are a number of issues that need to be resolved before this becomes a usable workflow.
See https://github.com/knative/func/discussions/1489#discussioncomment-4761544 for a description of the issues.

# buildpack

Currently work in progress as we are testing the end to end UX but this project should build and make the sample application.
The deployment aspects are currently being investigated.

## package rust builder
```
pack builder create quay.io/knawd/builder:rust --config ./builders/rust/builder.toml
podman push quay.io/knawd/builder:rust
```

## package

```bash
pack buildpack package knawd-rust --config ./buildpacks/rust/package.toml
```

## build stack

```bash
podman build . -t quay.io/knawd/stack:rust
podman push quay.io/knawd/stack:rust
```

## build app

```
pack build helloworld-rust-wasi --path ./apps/rust/helloworld-rust-wasi --buildpack ./buildpacks/rust --builder  quay.io/knawd/builder:rust --docker-host=inherit -v --trust-builder
```

## run

```
podman run --rm --annotation module.wasm.image/variant=compat-smart -p 8080:8080 --entrypoint /layers/knawd_rust/wasi/hellorust.wasm helloworld-rust-wasi
```

## test
```
curl localhost:8080
```

## kn func flow

```
pack config trusted-builders add knawd/rust

```