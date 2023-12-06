# fetch for ios + android

## about

this app is a continuation of a former project started under the same members. the mobile platform is meant to be a tool to help users conduct 
successful P2P trades of materials they own, similar to the types of business done on FB Marketplace. more on the concept here: https://drive.google.com/file/d/1iKXNV9993fM_z8t35Cv1QpSsAV65U0R9/view?usp=sharing 

currently, the project utilizes the following technologies:

	flutter
	firebase storage
	firestore
	provider


## getting started

### installing flutter

install the flutter sdk using https://docs.flutter.dev/get-started/install/macos

set the flutter path with these next steps:

#### macOS

type `vi ~/.zshrc` to access your mac's bash profile in vim

press `i` to `INSERT` a new path variable

add `export PATH="$PATH:/Users/<username>/flutter/bin"` where <username> is replaced by the name of your computer

press `esc` to exit editing mode and type in `:wq` to save and quit

type in `source ~/.zshrc` to refresh the terminal window to accomodate the new changes to your bash profile  

install the dart sdk using `brew install dart-sdk`	(homebrew)

#### windows

follow this link: https://www.architectryan.com/2018/03/17/add-to-the-path-on-windows-10/ 

install the dart sdk using `choco install dart-sdk` (chocolatey)


make sure xcode(mac only), android studio, and vscode are set up on your environment; if not, please google how to do so (note that the android
ios emulators need to be set up to test the app)

### setting up the environment

open a terminal and type in `git clone https://github.com/fetch-trade/mobile_platform.git` to clone using https or `git clone git@github.com:fetch-trade/mobile_platform.git` if ssh is set up on your machine (make sure to clone into a directory that's visible and easily accessible, i.e., `cd Documents` or `cd Desktop`)

once the repo finishes cloning, type `cd <directory name>/<directory name>/mobile_platform` to access the folder locally

type in `code .` to edit the files on vscode

## contributing

when committing changes to the code, create a new branch for either addressing an issue or simply have an endpoint to store your commit history

for issues, format the branch name to be `FT-<issue #>` 

for adding code outside of issues, format the name to be `<your first initial last name>` (no spaces, e.g., jadams)

branches can be created using `git checkout <new-branch>` where `<new-branch>` follows the naming standards set above

## credits

the repo is maintained by @enkyuan. thanks to @ethanMoloney for helping with the app's design. made with :heart: by the fetch team
