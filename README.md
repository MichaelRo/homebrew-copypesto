# homebrew-copypesto

Homebrew tap for [Pesto](https://copypesto.net), a clipboard manager for macOS.

## Install

```sh
brew install michaelro/copypesto/pesto
```

That taps `michaelro/copypesto` and installs the cask in one step. It needs macOS 15 (Sequoia) or later.

Pesto lives in the menu bar. Open it from Applications the first time.

## Updates

Pesto updates itself with Sparkle and asks before each update. The cask says so (`auto_updates true`), which means
`brew upgrade` skips it unless the cask has a newer version than the one you have.

To make Homebrew check anyway:

```sh
brew upgrade --cask --greedy pesto
```

This tap follows the release feed at `https://copypesto.net/appcast.xml`. A new version appears here after the
checks below pass and a pull request is merged; Pesto's own updater may be ahead of it.

## Uninstall

```sh
brew uninstall --cask pesto
```

To also remove Pesto's settings, caches and history:

```sh
brew uninstall --cask --zap pesto
```

`--zap` removes only these paths under your home folder:

- `~/Library/Application Support/net.copypesto.pesto`
- `~/Library/Caches/net.copypesto.pesto`
- `~/Library/HTTPStorages/net.copypesto.pesto`
- `~/Library/Preferences/net.copypesto.pesto.plist`
- `~/Library/Saved Application State/net.copypesto.pesto.savedState`

The first path holds your history. Make a backup in Pesto's settings, under Data, first if you want to keep it. A plain
`brew uninstall --cask pesto` leaves all of these in place.

Homebrew does not remove Keychain items. Pesto's encryption key stays in your login Keychain until you delete it; the
[uninstall FAQ](https://copypesto.net/docs/faq/) says how. Backup files you saved stay where you put them. If you
turned on Open at Login, switch it off in Pesto's settings before you uninstall.

## How versions get here

This tap only publishes notarized releases of Pesto. A workflow checks the release feed every six hours. When there
is a new version it:

1. Downloads the disk image from the GitHub release and compares its SHA-256 with the `.sha256` file published
   on that release, and its size with the feed.
2. Runs `codesign --verify --deep --strict`, `spctl -a -t exec -vv` and `xcrun stapler validate` on the app and the
   disk image.
3. Checks that the Developer ID Team ID is the expected one.
4. Runs `brew style`, `brew audit --cask --strict --online --signing`, and an install and uninstall.
5. Opens a pull request. Nothing is pushed to `main` directly.

If any step fails, no pull request is opened and the tap stays on the last good version.

## Report a problem

For a problem with Pesto, use the [Pesto repository](https://github.com/MichaelRo/copypesto/issues). For a problem
with this cask, open an issue here.
