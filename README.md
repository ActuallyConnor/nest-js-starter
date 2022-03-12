<p align="center">
  <a href="https://example.com/" target="blank"><img src="https://www.example.com/logo.svg" width="320" alt="Nest Logo" /></a>
</p>

  <p align="center">An API for use by <a href="https://www.example.com/" target="_blank">Example</a></p>
    <p align="center">

## Description

An API for for use by [Example](https://www.example.com/)

## Documentation

### API Docs

[https://example.com/api-docs/index.html](https://example.com/api-docs/index.html)

### App Docs

[https://example.com/app-docs/index.htmlm](https://example.com/app-docs/index.html)

### SDK Code Docs

[https://example.com/sdk-docs/index.html](https://example.com/sdk-docs/index.html)

## Commands

### Installation

This project requires [Docker](https://docs.docker.com/get-docker/)

### Running the app

#### Development

```bash
# Install dependencies
$ npm install

# Build containers
$ make dev-build
$ make dev-up
```

_Note: this will run with `--watch` enabled, so it will automatically detect changes and auto-reload the environment_

#### Production

```bash
$ npm run start:prod
```

### Test

```bash
# integration tests
$ make dev-shell-node-worker

# Once inside the container
$ sh test.sh
```

### TypeORM

See [using the TypeORM CLI](https://github.com/typeorm/typeorm/blob/master/docs/using-cli.md)

```bash
# Create migration - name must be in PascalCase
npm run typeorm migration:create -- -n <NameOfMigration>

# Run migrations
npm run typeorm migration:run

# Create - entity name must be in camelCase and you must suffix the name with ".entity"
npm run typeorm entity:create -- -n <entityName>.entity
```

### Creating Nest files

```bash
# Create controller
nest g controller controllers/<ControllerName>

# Create module
nest g module modules/<ModuleName>

# Create service
nest g service services/<ServiceName>
```

## SDK

[sdk-example](https://github.com/username/example/packages/1274697)

For any questions please reach out to [First Last](mailto:example@example.com)

## Docker image

[example Docker image](https://github.com/username/example/pkgs/container/example)

First you need to log in into GitHub's Docker registry. This will require you to log in using a PAT (personal access
token) that has `read:packages` permissions.

```shell
# Docker login
docker login ghcr.io -u <GitHub username> -p <GitHub PAT>
```

Then you can pull the image

```shell
docker pull ghcr.io/username/example:latest
```
