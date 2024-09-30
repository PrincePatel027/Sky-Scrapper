
# Sky Scrapper

**Sky Scrapper** is a Flutter application that allows users to search for weather information based on location. It includes features for managing a list of recent locations and persisting this data using `SharedPreferences`.

## Features

- Search for weather information by location.
- View detailed weather information for a searched location.
- Manage a list of recent locations with the ability to add, remove, and clear entries.
- Data persistence using `SharedPreferences` to save and load recent locations.

## Screens

### Home Page
- Displays a search bar to enter location names.
- Shows a list of recent locations.
- Allows users to search for weather details of a selected location.

### Search Page
- Shows detailed weather information for the searched location.
- Displays temperature, weather condition, location details, and more.
- Includes a "Save" button to add the location to the recent list.

## Getting Started

### Prerequisites

- Flutter SDK
- Dart
- An IDE such as Visual Studio Code or Android Studio

### Installation

1. **Clone the repository:**

    ```bash
    git clone https://github.com/PrinceGhadiya/Sky_Scrapper
    ```

2. **Navigate to the project directory:**

    ```bash
    cd sky_scrapper
    ```

3. **Install dependencies:**

    ```bash
    flutter pub get
    ```

4. **Run the application:**

    ```bash
    flutter run
    ```

## Dependencies

- `provider`: State management solution for Flutter.
- `shared_preferences`: Persistent storage for simple data.
- `http`: For making network requests.

Thank you for using Sky Scrapper!
