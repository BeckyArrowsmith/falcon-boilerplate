[![CircleCI](https://circleci.com/gh/BeckyArrowsmith/falcon-boilerplate/tree/master.svg?style=svg)](https://circleci.com/gh/BeckyArrowsmith/falcon-boilerplate/tree/master)

[![codecov](https://codecov.io/gh/BeckyArrowsmith/falcon-boilerplate/branch/master/graph/badge.svg)](https://codecov.io/gh/BeckyArrowsmith/falcon-boilerplate)



# Falcon API Boilerplate

This boilerplate contains Falcon API, running on Docker, with Pytest and code coverage.

It's a good idea to replace all instances of `myapp` with your own app name.

## Running it
Building Docker image: `$ docker build -t falcon-boilerplate .` (optional `--no-cache` flag to build it 'clean')

Running Docker image: `$ docker run -it -p8000:8000 falcon-boilerplate`

# Testing
To see a simple chart in your cli:
`$ pytest --cov=.`

To get a full HTML report (will generate it in the `coverage` folder at root)
`$ pytest --cov=. --cov-report html:coverage`

## Querying resources
`curl` or with `httpie` for much prettier output:

`$ http localhost:8000`