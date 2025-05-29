//
//  ContentView.swift
//  WeatherAppTest
//
//  Created by Dmitry Volkov on 28/05/2025.
//

import SwiftUI


struct WeatherView: View {
    @StateObject private var vm: WeatherViewModel = WeatherViewModel(city: "Moscow")
    @State private var searchCity: String = ""
    
    init(city: String) {
        _vm = StateObject(wrappedValue: WeatherViewModel(city: city))
    }
    
    var body: some View {
        ZStack {
            AnimatedBackground()

            VStack {
                viewTitle
                Spacer()
                currentWeather
                Spacer()
                cityTextField
                Spacer()
                futureweather
                Spacer()
            }
        }
    }
}

#Preview {
    WeatherView(city: "Moscow")
}

extension WeatherView {
    var viewTitle: some View {
        Text("Прогноз погоды")
            .font(.title)
            .fontWeight(.bold)
            .foregroundStyle(.white)
            .padding(.vertical)
    }
    
    var currentWeather: some View {
        Group {
            if let weather = vm.weather {
                CurrentWeatherView(temperature: weather.current.tempC, location: weather.location.name, date: "Сегодня \(weather.forecast.forecastDay[0].date.formattedDateToRussian() ?? "")")
            } else {
                Text("Загрузка погоды...")
                    .foregroundColor(.gray)
            }
        }
    }
    
    var cityTextField: some View {
        TextField("Ввведите город", text: $searchCity)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.white)
            )
            .overlay(
                HStack {
                    Spacer()
                    if !searchCity.isEmpty {
                        Image(systemName: "xmark.circle")
                            .padding(.horizontal)
                            .font(.title2)
                            .foregroundStyle(Color.gray)
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                    searchCity = ""
                                }
                            }
                    }
                }
            )
            .padding()
            .onSubmit {
                vm.updateWeather(for: searchCity)
                searchCity = ""
            }
    }
    
    var futureweather: some View {
        Group {
            if let weather = vm.weather {
                VStack(spacing: 20) {
                    WeatherRow(date: weather.forecast.forecastDay[0].date.formattedDateToRussian() ?? "Сегодня", minTemperature: weather.forecast.forecastDay[0].day.minTempC, avgTemperature: weather.forecast.forecastDay[0].day.avgTempC, maxTemperature: weather.forecast.forecastDay[0].day.maxTempC)
                    
                    WeatherRow(date: weather.forecast.forecastDay[1].date.formattedDateToRussian() ?? "Завтра", minTemperature: weather.forecast.forecastDay[1].day.minTempC, avgTemperature: weather.forecast.forecastDay[1].day.avgTempC, maxTemperature: weather.forecast.forecastDay[1].day.maxTempC)
                    
                    WeatherRow(date: weather.forecast.forecastDay[2].date.formattedDateToRussian() ?? "Послезавтра", minTemperature: weather.forecast.forecastDay[2].day.minTempC, avgTemperature: weather.forecast.forecastDay[2].day.avgTempC, maxTemperature: weather.forecast.forecastDay[2].day.maxTempC)
                }
            } else {
                Text("Загрузка погоды...")
                    .foregroundColor(.gray)
            }
        }
    }
}


