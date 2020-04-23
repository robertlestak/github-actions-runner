# github-actions-runner

A Docker container to run as a GitHub Actions self-hosted runner.

https://help.github.com/en/actions/hosting-your-own-runners

## Build

```
DOCKER_IMAGE=docker-registry.example.com/devops/github-actions-runner
GIT_COMMIT=$(git rev-parse HEAD)

# build image locally
docker build . -t $DOCKER_IMAGE\:$GIT_COMMIT

# optional: tag as latest
docker tag $DOCKER_IMAGE:$GIT_COMMIT $DOCKER_IMAGE\:latest

# optional: push images to registry
docker push $DOCKER_IMAGE\:$GIT_COMMIT
docker push $DOCKER_IMAGE\:latest
```

## Configuration

- `cp .env-sample .env`. Configure accordingly.

- Update your actions workflow yaml to add: `runs-on: self-hosted`

## Run

### Local Docker Container

```
docker run \
  -it \
  --env-file .env \
  docker-registry.example.com/devops/github-actions-runner:latest
```

### Kubernetes

Ensure you have created an `ImagePullSecret` and `Opaque` secret for environment variables.

```
kubectl apply -f k8s/
```
