//
//  requestEndpoint.swift
//  Weather Testing API
//
//  Created by andres siri on 9/24/25.
//

import Foundation

enum APIEndpoint {
    
    static let baseURL = "https://api.openweathermap.org/"
    
    
    case coordinatesByLocationName(String)
    case weatherbyLatLong(Double,Double)
    
    private var path: String {
        switch self {
        case .coordinatesByLocationName(let city):
            return "geo/1.0/direct?q=\(city)&appid=\(Constants.Keys.apiKey)"
        case .weatherbyLatLong(let lat, let long):
            return "/data/2.5/weather?lat=\(lat)&lon=\(long)&appid=\(Constants.Keys.apiKey)"
        }
    }
    
    static func endpointURL(for endpoint: APIEndpoint) -> URL {
        let endpointpath = endpoint.path
        return URL(string: baseURL + endpointpath)!
    }
    
}
