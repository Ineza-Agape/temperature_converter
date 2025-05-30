# Temperature Converter

A simple, responsive Flutter app to convert temperatures between Celsius and Fahrenheit. 

## Features

- **Temperature Conversion**: Instantly convert values between Celsius and Fahrenheit.
- **Conversion History**: View a scrollable list of your recent conversions.
- **Responsive Design**: Adapts layout for mobile, tablet, desktop, and web.
- **Modern UI**: Built with Material Design 3 and a custom color scheme.
- **Error Handling**: Notifies users of invalid input.

## Running the App
1. **Clone the repository:**
   ```sh
   git clone https://github.com/Ineza-Agape/temperature_converter.git
   cd temperature_converter
   ```
2. **Install dependencies:**
   ```sh
   flutter pub get
   ```
3. **Run on your preferred device:**
   - Android/iOS emulator: `flutter run`
   - Windows desktop: `flutter run -d windows`
   - Web (Chrome): `flutter run -d chrome`

### Project Structure

- `lib/main.dart`: App entry point, theme, and navigation setup.
- `lib/home_screen.dart`: Main UI and logic for temperature conversion.
- `lib/widgets/conversion_history.dart`: Widget for displaying conversion history.
- `pubspec.yaml`: Project configuration and dependencies.

#### How It Works

1. Enter a temperature value.
2. Select the conversion direction (Fahrenheit to Celsius or vice versa)
3. Tap the **CONVERT** button to see the result.
4. Each conversion is saved in the history list.

## Dependencies
- `flutter`
- `cupertino_icons`