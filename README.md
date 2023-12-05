# fetch for ios + android

### about


### getting started

#### flutter/dart sdk

install the flutter sdk using https://docs.flutter.dev/get-started/install/macos

set the flutter path with these next steps:

##### macOS

type `vi ~/.zshrc` to access your mac's bash profile in vim

press `i` to `INSERT` a new path variable

add `export PATH="$PATH:/Users/<username>/flutter/bin"` where <username> is replaced by the name of your computer

press `esc` to exit editing mode and type in `:wq` to save a quit

type in `source ~/.zshrc` to refresh the terminal window to accomodate the new changes to your bash profile  

##### windows

follow this link: https://www.architectryan.com/2018/03/17/add-to-the-path-on-windows-10/ 

install the dart sdk using:

`brew install dart-sdk`	(homebrew)

`choco install dart-sdk` (chocolatey)

make sure xcode, android studio, and vscode are set up on your environment; if not, please google how to do so


#### setting up local env

open a terminal and type in `git clone https://github.com/fetch-trade/mobile_platform.git` to clone using https or `git clone git@github.com:fetch-trade/mobile_platform.git` if ssh is set up on your machine (make sure to clone into a selected directory that's visible and easy accessible, i.e., `cd Documents` or `cd Desktop`)

once the repo finishes cloning, type `cd <directory name>/<directory name>/mobile_platform` to access the folder locally

type in code . to edit the files on vscode

### contributing
