# CQL Tests Results Repository

This repository supports posting the results of running the [CQL Tests](https://github.com/cqframework/cql-tests) against a CQL engine.

This repository has a [results](results) folder that is the target, and that is expected to contain any number of JSON files that are formatted as defined by the [CQL-Tests-Runner](https://github.com/cqframework/cql-tests-runner) as documented in the [Result](https://github.com/cqframework/cql-tests-runner/blob/main/cql-tests-runner.js#L53) class.

## Running from the Docker Image

```sh
# Run the latset CQL Tests Results image
docker run -p 4242:80 hlseven/quality-cql-tests-ui:latest

```
This wilil start a web serve with all the results files and a generated index at http://localhost:4242/index.json

## Optionally running the Results UI

To view the test results using the CQL Test Results UI viewer, start the results image and then run the [cql-tests-ui](https://github.com/preston/cql-tests-ui) image:

```sh
# Run the CQL Tests UI container
docker run -p 4200:80 hlseven/quality-cql-tests-ui:latest
```

Once the container is running, you can open the application with a link to the results index at `http://localhost:4200/?index=http://localhost:4242/index.json` to automatically configure it with these results files!
