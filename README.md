# homebrew-mistty

Homebrew tap for [Mistty](https://github.com/milch/mistty) — a native macOS terminal built on Ghostty.

## Install

```sh
brew install --cask milch/mistty/mistty
```

This launches `Mistty.app` in `/Applications` and symlinks `mistty-cli` into your PATH as `mistty`.

## Requirements

- macOS 14 (Sonoma) or newer
- Apple Silicon (arm64)

## Notes

The cask strips the `com.apple.quarantine` attribute after install, so the app launches without Gatekeeper prompts. This is necessary because Mistty is currently ad-hoc codesigned rather than signed with a Developer ID.

## Updating

The cask is updated automatically by the [release workflow](https://github.com/milch/mistty/blob/main/.github/workflows/release.yml) in the main Mistty repo on every new `v*` tag.
