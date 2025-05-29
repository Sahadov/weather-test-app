//
//  WeatherServicee.swift
//  WeatherAppTest
//
//  Created by Dmitry Volkov on 28/05/2025.
//

import Foundation
import Combine

class WeatherService {
    @Published var weather: Weather?
    var weatherSubscription: AnyCancellable?
    
    init(city: String) {
        getData(city: city)
        print(getNextFiveDates())
    }
    
    func getData(city: String) {
        guard let url = URL(string: "https://api.weatherapi.com/v1/current.json?key=79692111fc51490e8ba21318230805&q=\(city)&aqi=no")
        else { return }
        
        weatherSubscription = NetworkingManager.download(url: url)
            .decode(type: Weather.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedWeather in
                self?.weather = returnedWeather
                self?.weatherSubscription?.cancel()
            })
    }
    
    func getNextFiveDates() -> [String] {
        let calendar = Calendar.current
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        var dates: [String] = []
        
        for i in 0..<5 {
            if let nextDate = calendar.date(byAdding: .day, value: i, to: Date()) {
                let formattedDate = formatter.string(from: nextDate)
                dates.append(formattedDate)
            }
        }
        
        return dates
    }
}
