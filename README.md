# CQL Tests Results Repository

This repository supports posting the results of running the [CQL Tests](https://github.com/cqframework/cql-tests) against a CQL engine.

The [results](results) folder that is the target, and is expected to contain any number of JSON files that are formatted as defined by the [CQL-Tests-Runner](https://github.com/cqframework/cql-tests-runner) as documented in the [Result](https://github.com/cqframework/cql-tests-runner/blob/main/cql-tests-runner.js#L53) class.

## Optionally Running the Results UI

You may also access these files visually via prebuilt images that include a generated index for seamless loading in the [CQL Tests UI](https://github.com/preston/cql-tests-ui) web application using Docker, Podman, or any container runtime, like so:

```sh
# Run the latset CQL Tests Results image
docker run -it --rm --name cql-tests-results -p 4242:80 hlseven/quality-cql-tests-results:latest

# Secondly, run the latset CQL Tests UI image
docker run -it --rm --name cql-tests-ui -p 4200:80 hlseven/quality-cql-tests-ui:latest

```
CQL Tests UI can now be launched to preload the results index and data files!

http://localhost:4200/?index=http://localhost:4242/index.json
