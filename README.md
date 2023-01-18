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