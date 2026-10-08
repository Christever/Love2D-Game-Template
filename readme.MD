# LÖVE 2D Game Template

A simple starter template for creating games with [LÖVE 2D](https://love2d.org/).

The template provides a basic project structure and an automated build system for:

* Linux
* Windows
* Web / HTML5

## Project structure

```text
Love2D-Game-Template/
├── main.lua
├── conf.lua
├── src/
│   └── Game.lua
├── assets/
├── .vscode/
├── .gitignore
└── build.sh
```

## Requirements

### Development

* LÖVE 2D 11.5
* Lua 5.1
* Visual Studio Code
* Lua Language Server
* LÖVE 2D Support extension

### Building

The build script expects the LÖVE runtimes and the Web build tools to be available in:

```text
tools/
└── love-11.5-x86_64.AppImage
└── love-11.5-win64/

love.js/
└── index.js
```

## Running the game

From the project directory:

```bash
love .
```

Or press **F5** in Visual Studio Code.

## Building

Run:

```bash
./build.sh
```

The script creates builds for all three platforms.

### Linux

```text
build/Love2D-Game-Template-linux.zip
```

Contains the Linux executable and the required LÖVE library.

### Windows

```text
build/Love2D-Game-Template-windows.zip
```

Contains the Windows executable and the required DLLs.

### Web

```text
build/Love2D-Game-Template-web.zip
```

The Web ZIP contains `index.html` at its root and can be uploaded as an HTML5 game to itch.io.

## Git

The project is designed to be version-controlled with Git.

Build files are excluded from Git:

```text
build/
```

The `build.sh` script can therefore be used to regenerate all distributions whenever needed.

## License

This template is intended as a starting point for personal and game-development projects.
