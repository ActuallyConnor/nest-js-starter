# Nest.js API docs

This is the API documentation for the Nest.js API. We have chosen to build and publish this as a single projecct, in order to accomplish the following goals:

- Easier review of API specifications, keeping APIs consistent
- Forcing decoupling of API specs from their implementation to contract-based thinking
- Easier tooling and publishing
## Project structure

This project uses a vanilla OpenAPI (OAS) 3.0 spec, contained in `spec/api.yaml`. It heavily relies on `$ref` to keep changes manageable.

### Directory layout

| Directory         | Contents                                                                                                                                  |
|-------------------|-------------------------------------------------------------------------------------------------------------------------------------------|
| `spec/`           | All OpenAPI specs                                                                                                                         |
| `spec/parameters` | Parameter definitions                                                                                                                     |
| `spec/resources`  | Resource definitions (routes), with a subdirectory for each project/service                                                               |
| `spec/schemas`    | [Data models](https://swagger.io/docs/specification/data-models/), with a subdirectory per service. Some shared schemas exist at the root |
| `openapi.yaml`    | Compiled OpenAPI spec                                                                                                                     |
| `index.html`      | Compiles ReDoc documentation                                                                                                              |

## Build tooling

There is a GitHub action which will build (combine) the OAS into a single `openapi.yaml` spec, which can be ingested by other tooling. We're also using ReDoc to create a stand-alone HTML documentation file, to be published.

For local building there's a root `Makefile`, which relies on Docker to build the docs.

### Build

```bash
$ make build-docs
```

### Lint
```bash
$ make lint-docs
```

### Grab interactive shell
```bash
$ makle shell-docs
```
