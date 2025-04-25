# hadolint-dockerfile

This repository builds a Docker image for [hadolint](https://github.com/hadolint/hadolint) directly from the `main` branch of the original project.

Since the official hadolint release hasn't been updated since November 9, 2022, this project provides a way to get a more recent version of the tool, built from the latest source code. The generated Docker image allows you to run hadolint in containerized environments while benefiting from the latest changes and fixes not yet available in official releases.

## Usage

To use the generated Docker image, pull it with:

```bash
docker pull ghcr.io/filippolmt/hadolint-dockerfile:main
```

The container works exactly like the one described in the official [hadolint README](https://github.com/hadolint/hadolint/blob/master/README.md), with the only difference being that you need to replace the image name with `ghcr.io/filippolmt/hadolint-dockerfile:main`.

### Using with VS Code Hadolint Extension

If you want to use Hadolint in a container via the VS Code Hadolint extension, you can use the same wrapper script provided in the official project. Just replace the image name in the script with:

```
ghcr.io/filippolmt/hadolint-dockerfile:main
```
