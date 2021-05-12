# GBA develop with docker

## requirements

- Docker
- Visual Studio Code

## using

日本語

1. VS Code の `Remote Containers` 拡張をインストールする。
1. `Open Folder in Container` でプロジェクトルートフォルダを開く。
1. VS Code の TERMINAL で `find ./ -name "*.c" -or -name "*.h" | entr make` を実行する。(あるいは `make` のみ実行)
1. main.cを編集する。
1. buildフォルダ内にgbaファイルが保存される。
1. 新しいソースファイルを追加した場合は再度 手順3を実行する。

ENGLISH

1. Install the `Remote Containers` extension of VS Code.
1. Open the project root folder with `Open Folder in Container`.
1. Use TERMINAL of VS Code to `find . / -name "*.c" -or -name "*.h" | entr make` in TERMINAL of VS Code (or do only `make`). (or execute only `make`.)
1. Edit main.c file.
1. A gba file is saved in the build folder.
1. If you have added a new source file, perform step 3 again.
