//
//  weatherClient.swift
//  Weather Testing API
//
//  Created by andres siri on 9/24/25.
//

import Foundation



struct weatherClient {
    func fetchWeather(location: Location) async throws -> Weather {
        let (data, response) = try await URLSession.shared.data(from: APIEndpoint.endpointURL(for: .weatherbyLatLong(location.lat, location.lon)))
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        let weatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
        
        return weatherResponse.main
           }
    }

