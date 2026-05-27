# HyperFleet Template API Spec

This repository is a template for creating the public API contract for HyperFleet for a cloud provider.
The public contract is different from the internal (core) one because: only contains generic API endpoints (`/resource`)

The core contract provides shared schemas for statuses, errors, pagination, etc... that are published as an NPM module that this repository adds as a dependency.

The openapi.yaml contract generated with this repo can be used to validate the request payloads on HyperFleet. E.g. this template defines an entity named `Version`, and its schema will be validated by HyperFleet API on create/update requests.

Besides the OpenAPI v3 version, a `swagger.yaml` is also created to offer v2 compatibility

Both will be created by executing the build script.

## Repository Structure

```
hyperfleet-api-spec-template/
├── main.tsp                  # Main TypeSpec entry point
├── tspconfig.yaml            # TypeSpec compiler configuration
├── build-schema.sh           # Build script for OpenAPI generation
├── models/                   # Template-specific model definitions
│   ├── cluster/             # TemplateClusterSpec with Template-specific fields
│   ├── nodepool/            # Template nodepool models
│   ├── channel/             # ChannelSpec (is_default, enabled_regex)
│   └── version/             # VersionSpec (raw_version, release_image, etc.)
├── services/                 # Template-specific service endpoints
│   ├── channels.tsp         # /channels CRUD routes
│   └── versions.tsp         # /channels/{id}/versions CRUD routes
└── schemas/                  # Generated OpenAPI output
    └── template/
        └── openapi.yaml
```

Shared models and services (clusters, nodepools, statuses, resources) are imported from the `hyperfleet` npm package, which is sourced from the [hyperfleet-api-spec](https://github.com/openshift-hyperfleet/hyperfleet-api-spec) core repository.

## Prerequisites

After cloning the repository, install all dependencies:

```bash
npm install
```

This installs the TypeSpec compiler, all required libraries, and the `hyperfleet` shared package from GitHub into `node_modules/`.

## Building OpenAPI Specification

### Using npm Scripts (Recommended)

```bash
# Build OpenAPI 3.0
npm run build

```

### Using the Build Script Directly

```bash
./build-schema.sh            # OpenAPI 3.0 only
```

The script compiles `main.tsp` and outputs `schemas/template/openapi.yaml` (and optionally `schemas/template/swagger.yaml`).

Then run `npm install` and rebuild.

### Testing HyperFleet API Schema validation

When generating the `openapi.yaml` contract, the HyperFleet API requests can be validated against it.
Follow documentation at [hyperfleet-api/docs/api-operator-guide](https://github.com/openshift-hyperfleet/hyperfleet-api/blob/main/docs/api-operator-guide.md#36-schema-validation)

## Dependencies

- `hyperfleet` — shared models and services from [hyperfleet-api-spec](https://github.com/openshift-hyperfleet/hyperfleet-api-spec)
- `@typespec/compiler` — TypeSpec compiler
- `@typespec/http` — HTTP protocol support
- `@typespec/openapi` — OpenAPI decorators
- `@typespec/openapi3` — OpenAPI 3.0 emitter
- `api-spec-converter` — Converts OpenAPI 3.0 to OpenAPI 2.0 (Swagger)

## Contributing

Please see [CONTRIBUTING.md](CONTRIBUTING.md) for development setup, workflow, and PR guidelines.

## Architecture Context

This repository is part of the HyperFleet project. For broader context:

- Core API spec: <https://github.com/openshift-hyperfleet/hyperfleet-api-spec>
- Architecture repo: <https://github.com/openshift-hyperfleet/architecture>
- Main API implementation: <https://github.com/openshift-hyperfleet/hyperfleet-api>
