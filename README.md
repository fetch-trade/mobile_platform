# fetch for ios + android

<div id="badges">
  <a href="https://flutter.dev/"><img src="https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white" alt="Flutter Badge"/></a>
</div>

## about

this app is a continuation of a former project started under the same members. the mobile platform is meant to be a tool to help users conduct
successful P2P trades of materials they own, similar to the types of business done on FB Marketplace. more on the concept here: https://drive.google.com/file/d/1iKXNV9993fM_z8t35Cv1QpSsAV65U0R9/view?usp=sharing

currently, the project utilizes the following technologies:

    flutter
    firebase storage
    firestore
    tomtom maps (deprecated)

## getting started

### installing flutter

install the flutter sdk using https://docs.flutter.dev/get-started/install/macos

set the flutter path with the following steps:

#### macOS

type `vi ~/.zshrc` into your terminal, i.e., bash, zsh, warp, or tmux, to access your mac's bash profile in vim

press <kbd>i</kbd> to `INSERT` a new path variable

add `export PATH="$PATH:/Users/<username>/flutter/bin"` where `<username>` is replaced by the name of your computer

press <kbd>esc</kbd> to exit editing mode and type in `:wq` to save and quit

type in `source ~/.zshrc` to refresh the terminal window to accomodate the new changes to your bash profile

install the dart sdk using `brew install dart-sdk` (homebrew)

#### windows

follow this link: https://www.architectryan.com/2018/03/17/add-to-the-path-on-windows-10/ to add a flutter path

install the dart sdk using `choco install dart-sdk` (chocolatey)

run `flutter doctor` to have your machine check the setup and ensure all the necessary tools are enable. follow shell (terminal) instructions should an error occur.

make sure xcode (macOS only), android studio, and vscode are set up on your environment; if not, please google how to do so (note that android emulators are required to test the app)

### setting up the environment

#### the basics

open a terminal and type in `cd <folder_path>` to access the directory you intend to store this code in. please ensure that the chose directory is easily accessible, i.e., `Desktop` or `Documents`, and then run `git clone https://github.com/fetch-trade/mobile_platform.git` to clone using https or `git clone git@github.com:fetch-trade/mobile_platform.git` if ssh is set up on your machine

once the repo finishes cloning, type `cd mobile_platform/` to access the folder locally

run `code .` to edit the files in vscode or `nvim .` to edit using neovim

#### firebase configuration

open your firebase dashboard and create a new project or use an existing one and connect it to this project. steps for firebase onboarding for flutter can be found at https://firebase.google.com/docs/flutter/setup?platform=ios; further steps for setup will be introduced after working out most of the app

## contributing

when committing changes to the code, create a new branch for either addressing an issue or simply have an endpoint to store your commit history

for issues, format the branch name to be `FT-<issue #>`

for adding code outside of issues, format the name to be `<your first initial last name>` (no spaces, e.g., jadams)

branches can be created using `git checkout <new-branch>` where `<new-branch>` follows the naming standards set above

create a pull request using the new branch to compare changes--this portion is hypothetical and a CI/CD workflow has not been introduced for this repo. more on public contributions later...

## credits

the repo is maintained by @enkyuan. thanks to @ethanMoloney for helping with the app's design. made with :heart: by the fetch team
