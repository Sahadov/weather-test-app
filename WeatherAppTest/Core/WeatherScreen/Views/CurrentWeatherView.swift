//
//  CurrentWeatherView.swift
//  WeatherAppTest
//
//  Created by Dmitry Volkov on 28/05/2025.
//

import SwiftUI

struct CurrentWeatherView: View {
    var temperature: Double
    var location: String
    var date: String
    
    var body: some View {
        
        Text("\(String(format: "%.f", temperature)) ℃")
            .foregroundStyle(Color.orange)
            .font(.custom("HelveticaNeue-Bold", size: 70))
        
        Text(location)
            .foregroundStyle(.white)
            .font(.title)
        
        Text(date)
            .foregroundStyle(.white)
        
    }
}

#Preview {
    CurrentWeatherView(temperature: 23, location: "London", date: "Сегодня 28 мая")
}
