# Python distribution archive

Permanent Python wheels and source distributions for the xberg.io projects are stored
as GitHub Release assets. The package index is served by GitHub Pages:

<https://xberg-io.github.io/python-wheels/simple/>

PyPI remains the primary publication destination. This archive preserves historical
versions and provides a fallback when PyPI's project storage quota prevents uploads.

## Installing archived versions

```sh
python -m pip install "xberg==1.2.1" \
  --extra-index-url https://xberg-io.github.io/python-wheels/simple/

uv pip install "xberg==1.2.1" \
  --index https://xberg-io.github.io/python-wheels/simple/
```

For a uv project, explicitly select this index for Xberg:

```toml
[[tool.uv.index]]
name = "xberg-wheels"
url = "https://xberg-io.github.io/python-wheels/simple/"
explicit = true

[tool.uv.sources]
xberg = { index = "xberg-wheels" }
```

## PyPI retention policy

For each project:

- Keep every release in the current minor version on PyPI.
- For each older minor, keep its latest stable patch release on PyPI. If a minor has
  no stable release, keep its latest prerelease.
- Before removing any other release from PyPI, archive every distribution file here
  and verify the public download against its original PyPI SHA-256 and byte size.
- Keep archived files and their index entries permanently. Removing a release from
  PyPI does not remove it from this archive.

Xberg's current minor is **1.3**. The older minor versions retained on PyPI are
**1.0.14, 1.1.5, and 1.2.9**. All available **1.3.x** releases stay on PyPI.
The current minor changes when the project starts publishing its next minor release.

## Publication

Distributions are grouped in releases named `<normalized-project>-v<version>`.
Each release includes a `python-archive-<project>.json` manifest recording the
filename, version, SHA-256, byte size, Python requirement, and public download URL.

Publishers use the shared `xberg-io/actions/archive-python` action with one combined
wheel and source-distribution writer per project and version. The index workflow
rebuilds all projects from the verified release manifests and serializes deployment
to preserve concurrent publications from different repositories.

PyPI uploads still run normally. A storage quota error is accepted as a fallback
only after the complete release is publicly indexed and its files are verified.
Authentication, invalid metadata, and other upload errors remain failures.
