//
//  WeatherRow.swift
//  WeatherAppTest
//
//  Created by Dmitry Volkov on 28/05/2025.
//

import SwiftUI

struct WeatherRow: View {
    var date: String
    var minTemperature: Double
    var avgTemperature: Double
    var maxTemperature: Double
    
    var body: some View {
        HStack {
            Text(date)
                .foregroundStyle(.white)
            
            Spacer()
            
            VStack {
                Text("Min:")
                    .foregroundStyle(Color.white)
                    .font(.title2)
                Text("\(String(format: "%.f", minTemperature)) ℃")
                    .foregroundStyle(Color.orange)
                    .font(.custom("HelveticaNeue-Bold", size: 22))
            }
            
            Spacer()
            
            VStack {
                Text("Avg:")
                    .foregroundStyle(Color.white)
                    .font(.title2)
                Text("\(String(format: "%.f", avgTemperature)) ℃")
                    .foregroundStyle(Color.orange)
                    .font(.custom("HelveticaNeue-Bold", size: 22))
            }
            
            Spacer()
            
            VStack {
                Text("Max:")
                    .foregroundStyle(Color.white)
                    .font(.title2)
                Text("\(String(format: "%.f", maxTemperature)) ℃")
                    .foregroundStyle(Color.orange)
                    .font(.custom("HelveticaNeue-Bold", size: 22))
            }
        }
        .padding(.horizontal)
    }
}


