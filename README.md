# Homebrew Tap for ez

This repository provides a Homebrew tap for installing the `ez` CLI tool on macOS.

## What is ez?

`ez` streamlines CLI command execution through aliases. It allows you to save frequently used or complex shell commands as short, memorable aliases, making your terminal workflow faster and more efficient.

Benefits of using it include:
- Context-specific command sets that are easy to share to the team: Aliases are stored in a `.ez_cli.json` file in each directory.
- Timed runs: After each command execution, ez prints out the duration. This gives you information about your workflow efficiency without any extra effort.
- Parallel runs: By default commands are sequential, but parallel commands are supported as well. When run in parallel, a subprocess is created for each command. 

## Installation

First, tap this repository:

```sh
brew tap urtti/ez
```

Then install `ez`:

```sh
brew install ez
```

## Usage

Add a new alias:
```sh
ez add greet echo "Hello, world!"
```

List all aliases:
```sh
ez list
```

Run an alias:
```sh
ez greet
```

Remove an alias:
```sh
ez remove greet
```

## Updating

To update `ez` to the latest version:
```sh
brew update && brew upgrade ez
```

## More Information

- For issues or feature requests, please contact the author directly. 
