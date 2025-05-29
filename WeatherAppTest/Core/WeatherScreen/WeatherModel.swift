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
}

struct Current: Codable {
    var temp_c: Double
    var cloud: Double
}

struct Location: Codable {
    var name: String
}
