//
//  WeatherViewModel.swift
//  WeatherAppTest
//
//  Created by Dmitry Volkov on 28/05/2025.
//

import SwiftUI
import Combine

class WeatherViewModel: ObservableObject {

    @Published var weather: Weather?
    var city: String = ""
    
    private let weatherService: WeatherService
    private var cancellables = Set<AnyCancellable>()
    
    init(city: String) {
        self.city = city
        self.weatherService = WeatherService(city: city)
        addSubscribers()
    }
    
    func updateWeather(for city: String) {
        weatherService.getData(city: city)
    }
    
    private func addSubscribers() {
        weatherService.$weather
            .sink { [weak self] (receivedWeather) in
                self?.weather = receivedWeather
                print(receivedWeather)
            }
            .store(in: &cancellables)
    }
    
}
 
