//
//  ContentView.swift
//  Weather Testing API
//
//  Created by andres siri on 9/24/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var city: String = ""
    @State private var isFetchingWeather: Bool = false
    
    let geocodingClient = GeocodingClient()
    let WeatherClient = weatherClient()
    
    @State private var weather: Weather?
    
    private func fetchWeather() async {
        do { guard let location = try await geocodingClient.coordinationByCity(city)
            else { return }
            weather = try await WeatherClient.fetchWeather(location: location)
        } catch {
            print(error)
        }
    }
    var body: some View {
        VStack {
            TextField("City", text: $city)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    isFetchingWeather = true
                }.task(id: isFetchingWeather) {
                    if isFetchingWeather {
                        await fetchWeather()
                        isFetchingWeather = false
                        city = ""
                    }
                }
            if let weather {
                Text(MeasurementFormatter.temperature(value: weather.temp))
                Text(MeasurementFormatter.temperature(value: weather.temp_min))
                Text(MeasurementFormatter.temperature(value: weather.temp_max))
               // Text("\(weather.pressure)")
                Text("Humidity: \(weather.humidity, specifier: "%.0f")%")
                    .font(.system(size: 30))
            }
            
            
            
            Spacer()
            
        
                

        }
        .padding()
    }
}

 



#Preview {
    ContentView()
}
