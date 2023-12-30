# go-boilerplate-starter

<p align="center">
   <a href="https://github.com/greenstevester/go-boilerplate-starter/releases"><img src="https://img.shields.io/github/release/greenstevester/go-boilerplate-starter.svg?style=for-the-badge" alt="Releases"/></a>
  <br>
  <img src="https://img.shields.io/badge/Go-1.21.5-blue.svg?style=for-the-badge" alt="Go"/>
</p>

-----

A simple and barely-above-zero-opinion go starter template for building cross-platform go applications.

Includes:
 - Canonical go project with shared modules, tests with simple software release process
 - uses https://goreleaser.com/quick-start/ for heavy lifting on build and release of the go binaries
 - uses https://github.com/cweill/gotests to generate tests

## Installation
git clone git@github.com:greenstevester/go-boilerplate-starter.git

## Building

For those devs using intellij, you can click on the run icon next to the shell scripts, in the following order:

1. ./scripts/cleanup.sh
2. ```sh goreleaser release --snapshot --clean```
3. /scripts/package/docker.sh

## goreleaser
run a "local-only" release to see if it works using the [release](/cmd/goreleaser_release/) command:

```sh
goreleaser release --snapshot --clean
```
You can verify your `.goreleaser.yaml` is valid by running the [check](/cmd/goreleaser_check/) command:

```sh
goreleaser check
```

You can also use GoReleaser to [build](/cmd/goreleaser_build/) the binary only for a given GOOS/GOARCH, which is useful for local development:

```sh
goreleaser build --single-target
```

To release to GitHub, you'll need to export a `GITHUB_TOKEN` environment variable, which should contain a valid GitHub token with the `repo` scope.
It will be used to deploy releases to your GitHub repository.
You can create a new GitHub token [here](https://github.com/settings/tokens/new?scopes=repo,write:packages).

!! info
The minimum permissions the `GITHUB_TOKEN` should have to run this are `write:packages`

```sh
export GITHUB_TOKEN="YOUR_GH_TOKEN"
```

GoReleaser will use the latest [Git tag](https://git-scm.com/book/en/v2/Git-Basics-Tagging) of your repository.

Now, create a tag and push it to GitHub:

```sh
git tag -a v0.1.0 -m "First release"
git push origin v0.1.0
```

Now you can run GoReleaser at the root of your repository:

```sh
goreleaser release
```

GoReleaser will build the binaries for your app for Windows, Linux and macOS, both amd64 and i386 architectures.
You can customize that by changing the `builds` section. Check the [documentation](/customization/build/) for more information.

After building the binaries, GoReleaser will create an archive for each OS/Arch pair into a separate file.
You can customize several things by changing the `archive` section, including releasing only the binaries and not creating archives at all.
Check the [documentation](/customization/archive/) for more information.

Finally, it will create a release on GitHub with all the artifacts.

Check your GitHub project's releases page!

<a href="https://github.com/goreleaser/example/releases">
  <figure>
    <img src="https://img.carlosbecker.dev/goreleaser-github.png"/>
    <figcaption>Example release on GitHub.</figcaption>
  </figure>
</a>

## Dry run

If you want to test everything before doing a release "for real", you can
use the following techniques.

### Build-only Mode

Build command will build the project

```sh
goreleaser build
```

### Release Flags

Use the `--skip=publish` flag to skip publishing:

```sh
goreleaser release --skip=publish
```

## build docker container

```sh
./scripts/package/docker.sh
```
