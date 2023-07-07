//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by HardiB.Salih on 7/7/23.
//

import Foundation
import CoreLocation

class WeatherManager {
    let processInfo = ProcessInfo.processInfo

    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> ResponseBody {
        guard let apiKey = processInfo.environment["YOUR_API_KEY"] else {
            fatalError("API key not found in environment variables")
        }

        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=metric"
        guard let url = URL(string: urlString) else {
            fatalError("Invalid URL")
        }

        let urlRequest = URLRequest(url: url)

        let (data, response) = try await URLSession.shared.data(for: urlRequest)

        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error while fetching data")
        }

        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)

        return decodedData
    }
}

struct ResponseBody: Decodable {
    var coord: CoordinatesResponse
    var weather: [WeatherResponse]
    var base: String
    var main: MainResponse
    var visibility: Double
    var wind: WindResponse
    var clouds: CloudsResponse
    var dt: Double
    var sys: SysResponse
    var timezone: Double
    var name: String
    var cod: Double
    

    struct CoordinatesResponse: Decodable {
        var lon: Double
        var lat: Double
    }

    struct WeatherResponse: Decodable {
        var id: Double
        var main: String
        var description: String
        var icon: String
    }

    struct MainResponse: Decodable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
    }

    struct WindResponse: Decodable {
        var speed: Double
        var deg: Double
    }
    
    struct CloudsResponse: Decodable {
        var all: Double
    }
    
    struct SysResponse: Decodable {
        var type : Double
        var id : Double
        var country : String
        var sunrise : Double
        var sunset : Double
    }
    
    
}

extension ResponseBody.MainResponse {
    var feelsLike: Double { return feels_like }
    var tempMin: Double { return temp_min }
    var tempMax: Double { return temp_max }
}

 
/*
 {
     "coord": {
         "lon": -94.04,
         "lat": 33.44
     },
     "weather": [
         {
             "id": 803,
             "main": "Clouds",
             "description": "broken clouds",
             "icon": "04d"
         }
     ],
     "base": "stations",
     "main": {
         "temp": 32.83,
         "feels_like": 36.52,
         "temp_min": 32.61,
         "temp_max": 32.83,
         "pressure": 1014,
         "humidity": 52
     },
     "visibility": 10000,
     "wind": {
         "speed": 4.47,
         "deg": 240
     },
     "clouds": {
         "all": 63
     },
     "dt": 1688760015,
     "sys": {
         "type": 2,
         "id": 47725,
         "country": "US",
         "sunrise": 1688728354,
         "sunset": 1688779748
     },
     "timezone": -18000,
     "id": 4133367,
     "name": "Texarkana",
     "cod": 200
 }
 */
