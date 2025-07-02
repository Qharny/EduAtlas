# EduAtlas: Global University Explorer

<!-- ![EduAtlas Logo](path/to/logo.png) -->

EduAtlas is a Flutter application that allows users to explore universities worldwide by searching for institutions in specific countries.

## Features

- Onboarding introduction to the app's features
- Search universities by country
- View detailed information about each university
- Clean and intuitive user interface

## How It Works

### 1. Onboarding

When you first open the app, you'll be greeted with an onboarding screen that introduces you to EduAtlas's features.

![Onboarding Screen](https://github.com/Qharny/EduAtlas/blob/main/Assets/images/onboard1.jpg?raw=true)
##
![Onboarding Screen](https://github.com/Qharny/EduAtlas/blob/main/Assets/images/onboard2.jpg?raw=true)
##
![Onboarding Screen](https://github.com/Qharny/EduAtlas/blob/main/Assets/images/onboard3.jpg?raw=true)

### 2. Home Screen

After the onboarding (or upon subsequent app launches), you'll see the home screen. Here, you can enter a country name to search for universities.

![Home Screen](https://github.com/Qharny/EduAtlas/blob/main/Assets/images/home.jpg?raw=true)

### 3. Searching for Universities

1. Enter a country name in the search bar.
2. Tap the search icon or press enter.
3. The app will fetch data from the API and display a list of universities in that country.

![Search Results](https://github.com/Qharny/EduAtlas/blob/main/Assets/images/search.jpg?raw=true)

### 4. University Details

Each university in the list displays:
- University name
- Country
- Website (if available)


![University Details](https://github.com/Qharny/EduAtlas/blob/main/Assets/images/example.jpg?raw=true)

## Technical Details

EduAtlas uses the following key components:

1. **API Service**: Fetches university data from the Hipolabs API.
2. **University Model**: Structures the data received from the API.
3. **Onboarding Screen**: Uses the `introduction_screen` package for a smooth onboarding experience.
4. **Home Screen**: Implements a custom UI with a search bar and results list.

## Getting Started

To run EduAtlas on your local machine:

1. Ensure you have Flutter installed and set up.
2. Clone this repository.
3. Run `flutter pub get` to install dependencies.
4. Connect a device or start an emulator.
5. Run `flutter run` to start the app.

## Contributing

We welcome contributions to EduAtlas! Please feel free to submit issues, fork the repository and send pull requests!

## License

This project is licensed under the MIT License - see the [LICENSE.md](https://github.com/Qharny/EduAtlas_/blob/main/LICENSE) file for details.
