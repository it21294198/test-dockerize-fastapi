Set Up Docker Buildx:

Docker Buildx allows you to build images for multiple architectures. If it's not already installed, you can set it up by following these steps:

1. Enable Buildx:

If you're using Docker Desktop (on Mac or Windows), Buildx should be available by default. You can verify this by running:

    ```
    docker buildx version
    ```

2. Create a New Buildx Builder Instance:

Create a new builder instance to use multi-platform builds:

```
docker buildx create --use --name mybuilder
docker buildx inspect mybuilder --bootstrap
```

* This sets up a new builder named mybuilder and makes it the default for your builds.

3. Build the Image for Multiple Architectures:
You can now build your image for multiple architectures using Docker Compose:

```
docker-compose build
```

If you prefer to do this without Docker Compose, you can directly use Docker Buildx:

```
docker buildx build --platform linux/amd64,linux/arm64 -t test-straw --push .
```

* --platform linux/amd64,linux/arm64: Specifies the target platforms.
* -t test-straw: Tags the image as test-straw.
* --push: Pushes the image to your Docker registry (e.g., Docker Hub or Azure Container Registry) after the build.

#### Pushing to a Registry:
If you wish to push the image to a registry, such as Azure Container Registry, ensure you are logged in to the registry:

    ```
    docker_acr_login.sh
    ```
#### Then push the image:

    ```
    docker-compose build
    docker push ${ACR_NAME}.azurecr.io/test-straw:latest
    ```

Summary:
docker-compose.yml now includes the platforms option for specifying multiple architectures.
Docker Buildx is required to handle multi-platform builds.
Build and push the image using Docker Compose or directly with Docker Buildx.
This setup will allow your Docker image to be compatible across different architectures, such as x86 and ARM, which is especially useful when working on platforms like Mac M1/M2 and deploying to various environments.