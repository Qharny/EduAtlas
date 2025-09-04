# EduAtlas: Global University Explorer

<!-- ![EduAtlas Logo](path/to/logo.png) -->

EduAtlas is a Flutter application that allows users to explore universities worldwide by searching for institutions in specific countries. The app features a modern, responsive design with multi-language support and theme customization.

## Features

- **Multi-language Support**: Available in English, Spanish, and French
- **Theme Customization**: Light, Dark, and System theme modes
- **Onboarding Experience**: Smooth introduction to the app's features
- **Advanced Search**: Intelligent country search with autocomplete suggestions
- **University Database**: Comprehensive information from global universities
- **In-App Web View**: Seamless browsing of university websites
- **Responsive Design**: Optimized for all screen sizes
- **Offline Support**: Cached data for better performance
- **Settings Management**: Language and theme preferences

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

### 3. Advanced Search

1. **Smart Autocomplete**: Type to see country suggestions with intelligent filtering
2. **Whitespace Handling**: Automatically trims input for accurate API calls
3. **Multiple Input Methods**: Search via autocomplete selection, search button, or Enter key
4. **Real-time Results**: Instant feedback with loading states and error handling

![Search Results](https://github.com/Qharny/EduAtlas/blob/main/Assets/images/search.jpg?raw=true)

### 4. University Details

Each university in the list displays:
- University name
- Country
- Website (if available)
- Interactive cards with hover effects

### 5. In-App Web View

When you tap on a university's website link, it opens within the app using an integrated web view, providing a seamless browsing experience without leaving the app.

### 6. Settings & Customization

- **Language Selection**: Switch between English, Spanish, and French
- **Theme Toggle**: Choose Light, Dark, or System theme
- **Preferences**: Manage app settings and user preferences


![University Details](https://github.com/Qharny/EduAtlas/blob/main/Assets/images/example.jpg?raw=true)

## Technical Details

EduAtlas uses the following key components and architecture:

### Core Architecture
- **Provider Pattern**: State management using Provider package
- **MVC Structure**: Clean separation of models, views, and controllers
- **Service Layer**: API services for data fetching and caching

### Key Components
1. **API Service**: Fetches university data from the Hipolabs API with error handling and timeouts
2. **University Model**: Structured data models with JSON serialization
3. **Localization System**: Multi-language support using Flutter's intl package
4. **Theme Provider**: Dynamic theme switching with persistent preferences
5. **Search Engine**: Intelligent autocomplete with whitespace handling
6. **Web View Integration**: In-app browsing using webview_flutter package

### State Management
- **LanguageProvider**: Manages app language and localization
- **ThemeProvider**: Handles theme switching and persistence
- **Search State**: Manages search results and loading states

### Performance Features
- **Lazy Loading**: Efficient list rendering for large datasets
- **Caching**: Shared preferences for user settings and data
- **Optimized UI**: Smooth animations and responsive design

## Getting Started

To run EduAtlas on your local machine:

### Prerequisites
- Flutter SDK (3.8.1 or higher)
- Dart SDK
- Android Studio / VS Code
- Android/iOS device or emulator

### Installation Steps
1. **Clone the repository**
   ```bash
   git clone https://github.com/Qharny/EduAtlas.git
   cd EduAtlas
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Configuration
- **Android**: The app is configured to allow cleartext HTTP traffic for API compatibility
- **iOS**: No additional configuration required
- **Localization**: Supports English, Spanish, and French out of the box

## Contributing

We welcome contributions to EduAtlas! Here's how you can help:

### Ways to Contribute
- 🐛 **Report Bugs**: Submit issues with detailed descriptions
- 💡 **Feature Requests**: Suggest new features or improvements
- 🌍 **Localization**: Help add more languages
- 📱 **UI/UX**: Improve the user interface and experience
- 🧪 **Testing**: Test on different devices and report issues
- 📚 **Documentation**: Improve code documentation and README

### Development Setup
1. Fork the repository
2. Create a feature branch: `git checkout -b feature/amazing-feature`
3. Commit your changes: `git commit -m 'Add amazing feature'`
4. Push to the branch: `git push origin feature/amazing-feature`
5. Open a Pull Request

### Code Style
- Follow Flutter/Dart conventions
- Add comments for complex logic
- Include tests for new features
- Update documentation as needed

## Recent Updates

### Localization System (Latest)
- 🌍 **Multi-language Support**: English, Spanish, and French
- 🔄 **Dynamic Language Switching**: Change language on-the-fly
- 💾 **Persistent Preferences**: Remembers user's language choice
- 🎨 **Localized UI**: All text elements support multiple languages

### Search Improvements
- 🔍 **Smart Autocomplete**: Intelligent country suggestions
- ✂️ **Whitespace Handling**: Automatic input cleaning for accurate API calls
- ⚡ **Performance**: Optimized search with real-time feedback
- 🎯 **Multiple Input Methods**: Search via selection, button, or Enter key

### Theme System
- 🌓 **Dark/Light Modes**: User preference and system theme support
- 🎨 **Custom Themes**: Consistent design across the app
- 💾 **Persistent Settings**: Remembers theme preferences

## License

This project is licensed under the MIT License - see the [LICENSE.md](https://github.com/Qharny/EduAtlas_/blob/main/LICENSE) file for details.
