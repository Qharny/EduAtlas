# EduAtlas Widget Structure

This document outlines the refactored widget structure for the EduAtlas Flutter application.

## Directory Structure

```
lib/
├── widgets/
│   ├── common/                    # Reusable common widgets
│   │   ├── loading_widget.dart
│   │   ├── empty_state_widget.dart
│   │   └── custom_snackbar.dart
│   ├── home/                      # Home screen specific widgets
│   │   ├── animated_app_bar.dart
│   │   ├── search_section.dart
│   │   └── university_list_section.dart
│   ├── university/                # University related widgets
│   │   ├── university_card.dart
│   │   └── university_detail_dialog.dart
│   ├── search/                    # Search related widgets
│   │   └── country_search_field.dart
│   ├── onboarding/                # Onboarding widgets
│   │   └── onboarding_page.dart
│   ├── splash/                    # Splash screen widgets
│   │   └── splash_content.dart
│   └── settings/                  # Settings widgets
│       └── settings_list_item.dart
├── utils/                         # Utility classes
│   └── url_launcher_utils.dart
└── screens/                       # Refactored screens
    ├── home_refactored.dart
    ├── onboard_refactored.dart
    ├── splash_screen_refactored.dart
    └── settings_refactored.dart
```

## Widget Components

### Common Widgets (`lib/widgets/common/`)

#### LoadingWidget
- **Purpose**: Reusable loading indicator with customizable message and size
- **Usage**: Used throughout the app for consistent loading states
- **Props**: `message`, `size`, `color`

#### EmptyStateWidget
- **Purpose**: Displays empty state with icon, title, and subtitle
- **Usage**: Used when no data is available to display
- **Props**: `icon`, `title`, `subtitle`, `iconColor`

#### CustomSnackBar
- **Purpose**: Static methods for showing different types of snackbars
- **Usage**: Consistent error, info, and success messages
- **Methods**: `showError()`, `showInfo()`, `showSuccess()`

### Home Widgets (`lib/widgets/home/`)

#### AnimatedAppBar
- **Purpose**: Animated app bar with hero image and settings button
- **Usage**: Main app bar for the home screen
- **Props**: `onSettingsPressed`, `headerAnimation`

#### SearchSection
- **Purpose**: Complete search section with field and state management
- **Usage**: Main search functionality for universities
- **Props**: `countryList`, `onCountrySelected`, `controller`, `focusNode`, `isDark`, `isLoading`, `universities`, `selectedCountry`, `headerAnimation`

#### UniversityListSection
- **Purpose**: Displays list of universities with animations
- **Usage**: Shows search results
- **Props**: `universities`, `onUniversityTap`

### University Widgets (`lib/widgets/university/`)

#### UniversityCard
- **Purpose**: Individual university card with hover effects
- **Usage**: Displays university information in list
- **Props**: `university`, `onTap`, `index`

#### UniversityDetailDialog
- **Purpose**: Detailed university information dialog
- **Usage**: Shows when user taps on university card
- **Props**: `university`, `onOpenLink`

### Search Widgets (`lib/widgets/search/`)

#### CountrySearchField
- **Purpose**: Autocomplete search field for countries
- **Usage**: Main search input with suggestions
- **Props**: `countryList`, `onCountrySelected`, `controller`, `focusNode`, `isDark`

### Onboarding Widgets (`lib/widgets/onboarding/`)

#### OnboardingPage
- **Purpose**: Complete onboarding flow with introduction screens
- **Usage**: First-time user experience
- **Props**: `onComplete`

### Splash Widgets (`lib/widgets/splash/`)

#### SplashContent
- **Purpose**: Animated splash content with logo and text
- **Usage**: App launch screen content
- **Props**: `fadeAnimation`, `scaleAnimation`, `slideAnimation`

### Settings Widgets (`lib/widgets/settings/`)

#### SettingsListItem
- **Purpose**: Reusable settings list item
- **Usage**: Consistent settings UI
- **Props**: `icon`, `title`, `subtitle`, `onTap`, `trailing`, `showDivider`

## Utility Classes

### UrlLauncherUtils (`lib/utils/url_launcher_utils.dart`)
- **Purpose**: Handles URL launching with proper error handling
- **Usage**: Opening university websites
- **Methods**: `openUniversityLink()`

## Benefits of This Structure

1. **Reusability**: Widgets can be reused across different screens
2. **Maintainability**: Each widget has a single responsibility
3. **Testability**: Individual widgets can be tested in isolation
4. **Consistency**: Common UI patterns are standardized
5. **Scalability**: Easy to add new features and screens
6. **Separation of Concerns**: UI logic is separated from business logic

## Usage Examples

### Using LoadingWidget
```dart
const LoadingWidget(
  message: 'Fetching universities...',
  size: 40.0,
)
```

### Using CustomSnackBar
```dart
CustomSnackBar.showError(context, 'Failed to fetch data');
CustomSnackBar.showSuccess(context, 'Data loaded successfully');
```

### Using UniversityCard
```dart
UniversityCard(
  university: university,
  onTap: () => showUniversityDetails(university),
  index: index,
)
```

## Migration Notes

The original screens have been refactored to use these new widget components:

- `home.dart` → `home_refactored.dart`
- `onboard.dart` → `onboard_refactored.dart`
- `splash_screen.dart` → `splash_screen_refactored.dart`
- `settings.dart` → `settings_refactored.dart`

The main.dart file has been updated to use the refactored splash screen as the entry point. 