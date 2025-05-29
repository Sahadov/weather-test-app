//
//  Weather.swift
//  WeatherAppTest
//
//  Created by Dmitry Volkov on 28/05/2025.
//
import Foundation

struct Weather: Codable {
    var location: Location
    var current: Current
    var forecast: Forecast
}

struct Current: Codable {
    var tempC: Double
    var cloud: Double

    enum CodingKeys: String, CodingKey {
        case tempC = "temp_c"
        case cloud
    }
}

struct Location: Codable {
    var name: String
}

struct Forecast: Codable {
    var forecastDay: [ForecastDay]

    enum CodingKeys: String, CodingKey {
        case forecastDay = "forecastday"
    }
}

struct ForecastDay: Codable {
    var date: String
    var day: Day
}

struct Day: Codable {
    var maxTempC: Double
    var minTempC: Double
    var avgTempC: Double

    enum CodingKeys: String, CodingKey {
        case maxTempC = "maxtemp_c"
        case minTempC = "mintemp_c"
        case avgTempC = "avgtemp_c"
    }
}
