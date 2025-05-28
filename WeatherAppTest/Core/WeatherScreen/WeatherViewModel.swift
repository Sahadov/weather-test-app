//
//  WeatherViewModel.swift
//  WeatherAppTest
//
//  Created by Dmitry Volkov on 28/05/2025.
//

import SwiftUI
import Combine

class WeatherViewModel: ObservableObject {
    @Published var weatherArray: [String]

    init() {
        self.weatherArray = []
    }
}
 
