# Dotenv Linter (Docker Images)

[![Latest Version](https://img.shields.io/docker/v/zavoloklom/dotenv-linter?style=for-the-badge&label=Latest%20Version)](https://hub.docker.com/r/zavoloklom/dotenv-linter)
[![Docker Pulls](https://img.shields.io/docker/pulls/zavoloklom/dotenv-linter?style=for-the-badge)](https://hub.docker.com/r/zavoloklom/dotenv-linter)
[![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-%23FE5196?logo=conventionalcommits&logoColor=white&style=for-the-badge)](https://conventionalcommits.org)

This repository provides Docker images for the [dotenv-linter](https://github.com/dotenv-linter/dotenv-linter) tool,
packaged in two versions: **Alpine** and **BusyBox**:

- **Alpine version**: Includes additional utilities `git` and `curl` providing more flexibility.
- **BusyBox version**: A minimalistic image containing only `dotenv-linter` and the BusyBox toolkit.

Please note that if you only need `dotenv-linter`, it's recommended to use the official Docker
image - [dotenvlinter/dotenv-linter](https://hub.docker.com/r/dotenvlinter/dotenv-linter).

## Image Tags and Versioning

The Docker images follow the same versioning as the official `dotenv-linter` releases. They are published using the
following tags:

### BusyBox version

- `zavoloklom/dotenv-linter:VERSION-busybox` - where `VERSION` is the version of the `dotenv-linter` package.
- `zavoloklom/dotenv-linter:latest-busybox` - latest version of the `dotenv-linter` package.
- `zavoloklom/dotenv-linter:busybox` - same as `latest-busybox`.

### Alpine version

- `zavoloklom/dotenv-linter:VERSION-alpine` - where `VERSION` is the version of the `dotenv-linter` package.
- `zavoloklom/dotenv-linter:latest-alpine` - latest version of the `dotenv-linter` package.
- `zavoloklom/dotenv-linter:alpine` - same as `latest-alpine`.

New Docker images will be released whenever a new version of `dotenv-linter` is published.

## How to Use

You can use either the Alpine-based or BusyBox-based Docker images to run `dotenv-linter`. Below are examples of how to
pull the images and run `dotenv-linter` commands inside the container.

### Running the Linter with the Alpine Version

1. **Pull the image**:

   ```shell
   docker pull zavoloklom/dotenv-linter:3.3.0-alpine
   ```

2. **Run the linter**:

   To run the `dotenv-linter` using the Alpine-based image, use the following command:

   ```shell
   docker run --rm -v ${PWD}:/app zavoloklom/dotenv-linter:3.3.0-alpine <COMMAND> <ARGS>
   ```

   Replace `<COMMAND>` and `<ARGS>` with the appropriate `dotenv-linter` command and arguments.

   For example, to check the `.env` file in your current directory:

   ```shell
   docker run --rm -v ${PWD}:/app zavoloklom/dotenv-linter:3.3.0-alpine check .env
   ```

   This command mounts the current directory (`${PWD}`) into `/app` inside the container and runs `dotenv-linter` on
   the `.env` file.

3. **Run the latest version**:

   If you'd like to run the latest version of the Alpine image, use:

   ```shell
   docker run --rm -v ${PWD}:/app zavoloklom/dotenv-linter:latest-alpine check .env
   ```

### Running the Linter with the BusyBox Version

1. **Pull the image**:

   ```shell
   docker pull zavoloklom/dotenv-linter:3.3.0-busybox
   ```

2. **Run the linter**:

   For a smaller footprint, use the BusyBox version. The command structure is the same:

   ```shell
   docker run --rm -v ${PWD}:/app zavoloklom/dotenv-linter:3.3.0-busybox check .env
   ```

3. **Run the latest version**:

   You can also run the latest version of the BusyBox image:

   ```shell
   docker run --rm -v ${PWD}:/app zavoloklom/dotenv-linter:latest-busybox check .env
   ```

## Documentation

For more examples and information on how `dotenv-linter` works, refer to
the [official documentation](https://dotenv-linter.github.io/).

## License

This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for more information.

Please refer to original [LICENSE](https://github.com/dotenv-linter/dotenv-linter/blob/master/LICENSE) for more
information about `dotenv-linter` licensing terms.
