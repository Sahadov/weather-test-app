//
//  WeatherRow.swift
//  WeatherAppTest
//
//  Created by Dmitry Volkov on 28/05/2025.
//

import SwiftUI

struct WeatherRow: View {
    var date: String
    var temperature: Double
    
    var body: some View {
        HStack {
            Text(date)
                .foregroundStyle(.white)
            Text("\(String(format: "%.f", temperature)) ℃")
                .foregroundStyle(Color.orange)
                .fontWeight(.bold)
                .font(.title2)
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    WeatherRow(date: "25 мая", temperature: 12)
}
