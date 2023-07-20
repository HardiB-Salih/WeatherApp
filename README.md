# Weather App

The Weather App is a simple and intuitive application that provides real-time weather information based on the user's location. It utilizes CoreLocation to access the device's GPS and fetches weather data using asynchronous API calls through the OpenWeather API.

## Features

- **Current Weather**: Get the latest weather conditions for the user's location.
- **Temperature and Weather Description**: View the current temperature and a brief description of the weather conditions.
- **Humidity and Wind Speed**: Access additional weather details such as humidity percentage and wind speed.
- **Daily Forecast**: Get a 5-day weather forecast for the user's location.

## Getting Started

Follow the steps below to set up the Weather App:

### Prerequisites

- Xcode: Make sure you have Xcode installed on your macOS system.
- Swift Package Manager (SPM): The app uses SPM for handling dependencies.

### Installation

1. Clone the Weather App repository to your local machine using the following command:

```bash
git clone https://github.com/HardiB-Salih/weatherApp.git
```

2. Navigate to the project directory:

```bash
cd weather-app
```

3. Install the required dependencies using Swift Package Manager:

```bash
swift package update
```

4. Open the Xcode workspace:

```bash
open WeatherApp.xcworkspace
```

### API Key

To access weather data from the OpenWeather API, you need to obtain an API key. Visit the [OpenWeather website](https://openweathermap.org/) to sign up for a free account and generate your API key. Once you have the key, update the `WeatherService.swift` file with your API key:

```swift
// WeatherService.swift

private let apiKey = "YOUR_API_KEY"
```

### Build and Run

1. Select the desired simulator or a connected device in Xcode.

2. Press the "Build and Run" button (or `Cmd + R`) to build and run the Weather App on your chosen device.

## Screenshots

<div style="display: flex; justify-content: space-between;">
  <img src="https://filedn.com/lgYM5v25LH64Wknu6KIrjpj/Client%20Project/Innovative%20Candor/GitHub/weatherApp/Start.png" alt="Start Screen" width="300">
  <img src="https://filedn.com/lgYM5v25LH64Wknu6KIrjpj/Client%20Project/Innovative%20Candor/GitHub/weatherApp/Home.png" alt="Home Screen" width="300">
</div>

## Feedback and Support

If you encounter any issues or have suggestions for improvement, feel free to open an issue on the GitHub repository. We appreciate your feedback and contributions to make the Weather App even better.

## License

The Weather App is open-source and distributed under the [MIT License](https://innovativecandor.com/mit_license/). Feel free to use, modify, and distribute the code as per the terms of the license.

---

Thank you for using the Weather App! We hope you find it useful in staying up-to-date with the latest weather conditions. Enjoy exploring the app and always be prepared for any weather changes! ☀️🌧️
