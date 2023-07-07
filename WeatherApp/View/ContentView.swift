//
//  ContentView.swift
//  WeatherApp
//
//  Created by HardiB.Salih on 7/7/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?


    var body: some View {
        VStack {
            
            if let location = locationManager.location {
                if let weather = weather {
                    WeatherView(weather: weather)
                } else {
                    LoadingView()
                        .task {
                            do {
                                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch let error {
                                print(error.localizedDescription)
                            }
                            
                        }
                }
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
        }
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(
                CircularProgressViewStyle()).tint(.white).scaleEffect(2.0)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
