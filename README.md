# Music Player

A Flutter-based music player application.

## Features

- Play music from local storage
- Display recently played tracks

## Getting Started

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install) (version 2.0 or higher)
- [Dart](https://dart.dev/get-dart) (version 2.12 or higher)

### Installation

1. Clone the repository:
    ```sh
    git clone https://github.com/yourusername/music_player.git
    cd music_player
    ```

2. Install dependencies:
    ```sh
    flutter pub get
    ```

3. Run the app:
    ```sh
    flutter run
    ```

### Building for Android

1. Navigate to the [android](http://_vscodecontentref_/1) directory:
    ```sh
    cd android
    ```

2. Build the project:
    ```sh
    ./gradlew build
    ```

### Building for iOS

1. Navigate to the [ios](http://_vscodecontentref_/2) directory:
    ```sh
    cd ios
    ```

2. Install CocoaPods dependencies:
    ```sh
    pod install
    ```

3. Build the project:
    ```sh
    xcodebuild -workspace Runner.xcworkspace -scheme Runner -configuration Release
    ```

## Project Structure

- [lib](http://_vscodecontentref_/3): Contains the Dart source code
- [android](http://_vscodecontentref_/4): Contains the Android-specific code and configuration
- [ios](http://_vscodecontentref_/5): Contains the iOS-specific code and configuration
- [test](http://_vscodecontentref_/6): Contains the unit tests

## Contributing

Contributions are welcome! Please open an issue or submit a pull request.

## License

This project is licensed under the MIT License. See the LICENSE file for details.