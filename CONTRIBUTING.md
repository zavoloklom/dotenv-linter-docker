# Contribution Guidelines

Thanks for your interest in contributing! Please read this guide before opening a pull request.

This project follows a [Contributor Code of Conduct](./CODE_OF_CONDUCT.md). By participating, you agree to abide by
its terms.

## Prerequisites

Make sure the following tools are installed before you start:

- **Docker** — used to build and run images locally
- **Task** — task runner used for all development commands.
  Install from [taskfile.dev/installation](https://taskfile.dev/installation/)
- **Lefthook** — manages git hooks (pre-commit linting).
  Install from [github.com/evilmartians/lefthook](https://github.com/evilmartians/lefthook)

After installing Lefthook, set up the git hooks by running:

```shell
task init
```

This enables automatic linting before every commit.

## Getting Started

1. Fork the repository and clone it locally.

2. Build the Docker images:

   ```shell
   task build
   ```

3. Run smoke tests to verify both images work correctly:

   ```shell
   task test
   ```

   This builds each image and runs `dotenv-linter --version` inside the container to confirm the binary is functional.

4. If you need to inspect the container manually or test commands interactively:

   ```shell
   task dev:alpine
   task dev:busybox
   ```

   This drops you into a shell inside the container with the current directory mounted at `/app`.

## Pull Requests

- Keep pull requests focused on a single change.
- Run `task test` before submitting to confirm both Alpine and BusyBox images work.
- Run `task lint` to check for linting errors before pushing.
- Create pull requests against the `main` branch.

## Code Style and Linters

Two linters are configured for this project:

- **hadolint** — lints the Dockerfile against Dockerfile best practices. Rules are configured in `.hadolint.yml`.
- **markdownlint** — lints all Markdown files for formatting consistency. Rules are configured in
  `.markdownlint.json`.

Lefthook runs both automatically on staged files before each commit. To run them manually across all files:

```shell
task lint
```

To apply automatic fixes where possible (Markdown only):

```shell
task fix
```

## Reporting Issues

If you find a bug or have a feature request,
please [open an issue](https://github.com/zavoloklom/dotenv-linter-docker/issues/new/choose) with detailed
information.

## After Your Contribution

Once your contribution is merged, it will become part of the project. You may also check the Docker image build and
publication status afterward.  
I appreciate your hard work and contribution to making this tool better. Also, I encourage you to continue participating
in the project, joining discussions, and contributing to future enhancements.

**Thank you for contributing!**
