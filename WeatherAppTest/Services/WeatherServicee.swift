//
//  WeatherServicee.swift
//  WeatherAppTest
//
//  Created by Dmitry Volkov on 28/05/2025.
//

import Foundation
import Combine
import SwiftUI

class WeatherService {
    @Published var weather: Weather?
    var weatherSubscription: AnyCancellable?
    
    init(city: String) {
        getData(city: city)
    }
    
    func getData(city: String) {
        guard let url = URL(string: "https://api.weatherapi.com/v1/forecast.json?key=79692111fc51490e8ba21318230805&q=\(city)&days=5&aqi=no&alerts=no")
        else { return }
        
        weatherSubscription = NetworkingManager.download(url: url)
            .decode(type: Weather.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedWeather in
                self?.weather = returnedWeather
                print(returnedWeather)
                self?.weatherSubscription?.cancel()
            })
    }
}
