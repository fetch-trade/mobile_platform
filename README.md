# fetch mobile

<div id="badges">
  <a href="https://flutter.dev/"><img src="https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white" alt="Flutter Badge"/></a>
  <a href="https://www.apple.com/ios/ios-17/"><img src="https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=ios&logoColor=white" alt="iOS Badge"/></a>
  <a href="https://www.android.com/"><img src="https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white" alt="Android Badge"></a>
</div>

## about

this app is a continuation of a former project started under the same members. the mobile platform is meant to be a tool to help users conduct
successful P2P trades of materials they own, similar to the types of business done on FB Marketplace. more on the concept here: https://drive.google.com/file/d/1iKXNV9993fM_z8t35Cv1QpSsAV65U0R9/view?usp=sharing

currently, the project utilizes the following technologies:

    flutter
    firebase storage
    firestore
    tomtom maps

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

make sure android studio and vscode are set up on your environment; if not, please google how to do so (note that android emulators are required to test the app)

### setting up the environment

#### the basics

open a terminal and type in `cd <folder_path>` to access the directory you intend to store this code in. please ensure that the chose directory is easily accessible, i.e., `Desktop` or `Documents`, and then run `git clone https://github.com/fetch-trade/mobile_platform.git` to clone using https or `git clone git@github.com:fetch-trade/mobile_platform.git` if ssh is set up on your machine

once the repo finishes cloning, type `cd mobile_platform/` to access the folder locally

run `code .` to edit the files in vscode or `nvim .` to edit using neovim

#### inital step

when first opening the project directory, be sure to run `flutter pub get` to fetch dependencies. create `api_keys.dart` in the root directory of lib and add personal API keys for firebase (highlighted below) and tomtom maps using the following naming convention:

firebase + <platformName> + Key  ~  no spaces + camelCase

e.g., firebaseIOSKey

the following depicts the directory structure of this app:

```
lib
├── app
│   ├── authentication
│   │   ├── authentication.dart
│   │   ├── components
│   │   │   ├── circle_tile.dart
│   │   │   ├── components.dart
│   │   │   ├── enter_button.dart
│   │   │   ├── splash_screen_scaffold.dart
│   │   │   ├── toggle_page.dart
│   │   │   └── username_input_field.dart
│   │   ├── model
│   │   │   └── app_user.dart
│   │   ├── resources
│   │   │   └── get_gradient_colors.dart
│   │   └── screens
│   │       ├── auth_options.dart
│   │       ├── auth_page.dart
│   │       ├── confirmation.dart
│   │       ├── forgot_password.dart
│   │       ├── phone_number.dart
│   │       ├── screens.dart
│   │       ├── sign_in.dart
│   │       ├── sign_up.dart
│   │       ├── splash_screen.dart
│   │       └── user_name.dart
│   ├── feeds
│   │   ├── components
│   │   │   ├── alt_user_gradient.dart
│   │   │   ├── comment_card.dart
│   │   │   ├── components.dart
│   │   │   ├── post_card.dart
│   │   │   └── upper_tab_bar.dart
│   │   ├── feeds.dart
│   │   ├── model
│   │   │   ├── comment.dart
│   │   │   └── post.dart
│   │   ├── resources
│   │   │   └── get_ids.dart
│   │   └── screens
│   │       ├── comments_screen.dart
│   │       ├── feeds_screen.dart
│   │       ├── new_comment.dart
│   │       ├── new_post.dart
│   │       ├── screens.dart
│   │       └── user_settings.dart
│   ├── messaging
│   │   ├── components
│   │   │   ├── components.dart
│   │   │   ├── message_bubble.dart
│   │   │   └── message_input_field.dart
│   │   ├── messaging.dart
│   │   ├── model
│   │   │   └── message.dart
│   │   └── screens
│   │       ├── contacts_list.dart
│   │       ├── messages_screen.dart
│   │       └── screens.dart
│   └── screens
│       ├── explore_screen.dart
│       ├── home_screen.dart
│       ├── notifications_screen.dart
│       ├── screens.dart
│       └── user_profile.dart
├── components
│   ├── components.dart
│   ├── input_field.dart
│   ├── logo.dart
│   ├── profile_gradient.dart
│   ├── rectangular_tile.dart
│   ├── square_tile.dart
│   └── start_button.dart
├── firebase_options.dart
├── main.dart
├── providers
│   └── gauth_provider.dart
└── services
    ├── auth_service.dart
    ├── messaging_service.dart
    ├── posting_service.dart
    └── services.dart

20 directories, 62 files
```

note that the code is primarily stored in `lib/`. make additions ONLY to the files within this folder (other files can be ignored unless required for a specific configuration)

#### firebase configuration

open your firebase dashboard and create a new project or use an existing one and connect it to this project. steps for firebase onboarding for flutter can be found at https://firebase.google.com/docs/flutter/setup?platform=ios; further steps for setup will be introduced after working out more of the app

## contributing

when committing changes to the code, create a new branch for either addressing an issue or simply have an endpoint to store your commit history

for issues, format the branch name to be `FT-<issue #>`

for adding code outside of issues, format the name to be `<your first initial last name>` (no spaces, e.g., jadams)

branches can be created using `git checkout <new-branch>` where `<new-branch>` follows the naming standards set above

create a pull request using the new branch to compare changes--this portion is hypothetical and a CI/CD workflow has not been introduced for this repo. more on public contributions later...

### workflow

when a contributor pushes changes to their branch, a review should be requested from others with higher contributions to the application. if the review is approved and the build functions, then those changes proceed to get merged along with the next batch of updates. that's the essence of the process for now...

## credits

the repo is maintained by @enkyuan. thanks to @ethanMoloney for helping with the app's design. made with :heart: by the fetch team
