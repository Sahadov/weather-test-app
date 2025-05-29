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
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blue)
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
                CurrentWeatherView(temperature: weather.current.temp_c, location: weather.location.name, date: "Сегодня 28 мая")
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
            .padding()
            .onSubmit {
                vm.updateWeather(for: searchCity)
                searchCity = ""
            }
    }
    
    var futureweather: some View {
        VStack {
            WeatherRow(date: "Завтра 28 мая", temperature: 5)
            WeatherRow(date: "28 мая", temperature: 5)
            WeatherRow(date: "28 мая", temperature: 5)
            WeatherRow(date: "28 мая", temperature: 5)
        }
    }
}


