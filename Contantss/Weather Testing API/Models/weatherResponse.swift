//
//  weatherResponse.swift
//  Weather Testing API
//
//  Created by andres siri on 9/24/25.
//

import Foundation


struct WeatherResponse: Decodable {
    let main: Weather
 
}


struct Weather: Decodable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Double
    let humidity: Double
}

