# Contribution Guidelines

Thanks for your interest in contributing to this project! Here are some guidelines to help you contribute effectively.

Please note that this project is released with a [Contributor Code of Conduct](./CODE_OF_CONDUCT.md). By participating
in this project, you agree to abide by its terms.

## Prerequisites

Before making contributions, ensure the following:

- Your local development environment matches the project's requirements for versions of Docker and any other necessary
  tools.
- Install **Task** by following the installation instructions from [Task](https://taskfile.dev/installation/).
- You have thoroughly read the project documentation to best understand its features and functionalities.
- Install **Lefthook** by following the installation instructions
  from [Lefthook GitHub](https://github.com/evilmartians/lefthook).

  Once **Lefthook** is installed, initialize it by running:

   ```shell
   task init
   ```

  **Lefthook** will set up git hooks to ensure code consistency and automatically run checks before you commit changes.

## Getting Started

1. Fork the repository and clone it locally.
2. Build the Docker images locally:

   ```shell
   # Build both versions
   task build
   # Or individually
   task build:alpine
   task build:busybox
   ```

3. Test the images by running `dotenv-linter` commands inside the container. To work inside the container, you can use
   the following commands:

   ```shell
   # For Alpine version
   task dev:alpine
   # For BusyBox version
   task dev:busybox
   ```

## Pull Requests

- Ensure your code is well-documented.
- Keep pull requests focused on a single issue or feature.
- Before submitting, make sure your changes work with both the `Alpine` and `BusyBox` versions.
- Always test your changes locally.
- Create pull requests against `main` branch.

## Code Style and Linters

- Follow best practices for Dockerfile optimization.
- Keep the Docker images minimal and efficient.
- **Lefthook** checks your code by running the defined linters before each commit. To manually run linters at any time,
  use the command:

   ```shell
   task lint
   ```

- If you need to apply automatic fixes, run:

   ```shell
   task fix
   ```

## Reporting Issues

If you find a bug or have a feature request,
please [open an issue](https://github.com/zavoloklom/dotenv-linter-docker/issues/new/choose) with detailed information.

## After Your Contribution

Once your contribution is merged, it will become part of the project. You may also check the Docker image build and
publication status afterward.  
I appreciate your hard work and contribution to making this tool better. Also, I encourage you to continue participating
in the project, joining discussions, and contributing to future enhancements.

**Thank you for contributing!**
