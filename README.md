# test-jsonnet

A test repository demonstrating the use of [Jsonnet](https://jsonnet.org/) for generating Kubernetes deployment manifests.

## Overview

This project uses Jsonnet to generate Kubernetes deployment configurations for the `planet-exporter` application. Jsonnet is a data templating language that extends JSON with variables, conditionals, functions, and more.

## Project Structure

```
.
└── planet-exporter/
    ├── deploy/
    │   └── all.jsonnet       # Main Jsonnet file for generating deployments
    ├── jsonnetfile.json      # Jsonnet Bundler dependency file
    └── jsonnetfile.lock.json # Locked dependency versions
```

## Dependencies

This project uses:
- [k8s-libsonnet](https://github.com/jsonnet-libs/k8s-libsonnet) - Kubernetes library for Jsonnet (v1.32)

## Usage

### Prerequisites

- [Jsonnet](https://github.com/google/jsonnet) or [go-jsonnet](https://github.com/google/go-jsonnet)
- [jsonnet-bundler](https://github.com/jsonnet-bundler/jsonnet-bundler) (jb) for managing dependencies

### Install Dependencies

```bash
cd planet-exporter
jb install
```

### Generate Kubernetes Manifests

```bash
cd planet-exporter/deploy
jsonnet all.jsonnet > out.json
```

## License

This project is provided as-is for testing and demonstration purposes.
