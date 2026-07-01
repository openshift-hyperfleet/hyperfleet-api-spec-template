# Changelog

All notable changes to the HyperFleet Template API specification will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.0.27] - 2026-07-01

### Added

- Go module support (`go.mod` + `schemas/schemas.go`) for downstream Go consumers (HYPERFLEET-1202)

## [1.0.24] - 2026-06-22

### Fixed

- Added missing `kind` field to NodePool creation example

## [1.0.23] - 2026-06-11

### Removed

- `kind` property from `ChannelList`, `ClusterList`, `NodePoolList`, `VersionList`, and `WifConfigList` list response schemas — inherited from core spec update (HYPERFLEET-1143)

### Changed

- Error responses now use RFC 9457 `ProblemDetails` format with status-specific schemas (`BadRequestDetails`, `ConflictDetails`, `NotFoundDetails`, `UnauthorizedDetails`) — inherited from core spec update (HYPERFLEET-993)
- Pagination query parameters (`page`, `pageSize`) now enforce `minimum: 1` (HYPERFLEET-993)

## [1.0.22] - 2026-06-04

### Changed

- Renamed `WIFConfig` to `WifConfig` (PascalCase) for consistency with other resource kinds (HYPERFLEET-1090)

## [1.0.21] - 2026-06-02

### Added

- Swagger UI (`index.html`) for browsing the Template OpenAPI contract on GitHub Pages (swagger-ui-dist 5.32.6)

## [1.0.20] - 2026-06-01

### Added

- WIFConfig resource model (`WIFConfigSpec`, `WIFConfigBase`, `WIFConfig`, `WIFConfigCreateRequest`, `WIFConfigList`) (HYPERFLEET-1089)
- `/wifconfigs` service endpoints: `GET` list, `GET` by ID, `POST`, `PATCH`, `DELETE` (HYPERFLEET-1089)

## [1.0.19] - 2026-05-29

### Added

- `go.mod` so Go consumers can import this repo as a module dependency

### Changed

- CI skips version bump check when no `.tsp` files changed

## [1.0.18] - 2026-05-26

### Added

- `GET /resources/{resource_id}/statuses` endpoint for listing adapter statuses per resource (HYPERFLEET-1103)

### Fixed

- `PATCH` HTTP method now correctly generated for cluster, nodepool, and resource patch endpoints (was `POST`)

## [1.0.17] - 2026-05-21

### Added

- `/channels` CRUD routes (`GET` list, `GET` by ID, `POST`, `PATCH`, `DELETE`)
- `/channels/{channel_id}/versions` CRUD routes
- `ChannelSpec` model (`is_default`, `enabled_regex`)
- `VersionSpec` model (`raw_version`, `enabled`, `is_default`, `release_image`, `end_of_life_time`)
- `KindChannel` and `KindVersion` kind aliases
- Generic `/resources` CRUD routes imported from shared core contract (HYPERFLEET-1083)

## [1.0.16] - 2026-05-20

### Added

- `channelGroup` optional field to `ReleaseSpec` in Template cluster model (Template-696)

## [1.0.15] - 2026-05-18

### Added

- Repository split from `hyperfleet-api-spec` core repository (HYPERFLEET-1103)
- Template-specific models (`TemplateClusterSpec`, nodepool models) moved to this repository
- CI workflow that rebuilds schemas, checks consistency, lints with `spectral:oas`, and enforces version bumps
- Release workflow that auto-creates annotated tags and publishes `template-openapi.yaml` and `template-swagger.yaml`
- `hyperfleet` npm dependency for importing shared models and services from the core repository

<!-- Links -->
[Unreleased]: https://github.com/openshift-hyperfleet/hyperfleet-api-spec-template/compare/v1.0.24...HEAD
[1.0.24]: https://github.com/openshift-hyperfleet/hyperfleet-api-spec-template/compare/v1.0.23...v1.0.24
[1.0.23]: https://github.com/openshift-hyperfleet/hyperfleet-api-spec-template/compare/v1.0.22...v1.0.23
[1.0.22]: https://github.com/openshift-hyperfleet/hyperfleet-api-spec-template/compare/v1.0.21...v1.0.22
[1.0.21]: https://github.com/openshift-hyperfleet/hyperfleet-api-spec-template/compare/v1.0.20...v1.0.21
[1.0.20]: https://github.com/openshift-hyperfleet/hyperfleet-api-spec-template/compare/v1.0.19...v1.0.20
[1.0.19]: https://github.com/openshift-hyperfleet/hyperfleet-api-spec-template/compare/v1.0.18...v1.0.19
[1.0.18]: https://github.com/openshift-hyperfleet/hyperfleet-api-spec-template/compare/v1.0.17...v1.0.18
[1.0.17]: https://github.com/openshift-hyperfleet/hyperfleet-api-spec-template/compare/v1.0.16...v1.0.17
[1.0.16]: https://github.com/openshift-hyperfleet/hyperfleet-api-spec-template/compare/v1.0.15...v1.0.16
[1.0.15]: https://github.com/openshift-hyperfleet/hyperfleet-api-spec-template/releases/tag/v1.0.15
