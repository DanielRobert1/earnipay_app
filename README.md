# Earnipay Mobile Project

This is an Earnipay Dev Test submission by Daniel Robert Aigbe. The mobile application built with Flutter that allows users to browse and view photos fetched from the Unsplash API.

## Features

- Display a grid view of photos with their titles.
- Fetch and load the photos from the Unsplash API.
- Implement pagination to load more photos as the user scrolls.
- Allow the user to tap on a photo to view it in full screen with additional details.
- Optimized network request by using Flutter Cache Manger and Cache Network Image package.

## Getting Started

To get started with the app, follow the instructions below.

### Prerequisites

- Flutter SDK: You need to have Flutter SDK installed on your machine. You can download and install Flutter from the [official Flutter website](https://flutter.dev).
- Flutter development environment: Set up your preferred development environment for Flutter, whether it's Android Studio, Visual Studio Code, or any other IDE of your choice. Follow the [official Flutter documentation](https://flutter.dev/docs/get-started/editor) for detailed instructions.

### Installation

1. Clone the repository:

```bash
git clone https://github.com/your-username/flutter-unsplash-photo-viewer.git
```

2. Change into the project directory:

```bash
cd flutter-unsplash-photo-viewer
```

3. Fetch the dependencies:

```bash
flutter pub get
```

### Adding the Unsplash API Key

To fetch photos from the Unsplash API, you need to add your Unsplash API key to the app. Follow the steps below:

- Visit the [Unsplash Developers website](https://unsplash.com/developers) and create a new developer account if you don't have one.
- Create a new application and obtain an API key.
- Open the **lib/api_service.dart** file and replace **'YOUR_UNSPLASH_API_KEY'** with your actual API key.

```dart
// Replace 'YOUR_UNSPLASH_ACCESS_KEY' with your actual API key
const String unsplashApiKey = 'YOUR_UNSPLASH_ACCESS_KEY';
```

### Running the App

Make sure you have an emulator or a physical device connected, and then run the app using the following command:

```bash
flutter run 
```
This command will build and launch the app on the connected device or emulator.

### Testing

To run the unit tests for the app, use the following command:

```bash
flutter test 
```
This command will execute the unit tests and display the test results in the console.

