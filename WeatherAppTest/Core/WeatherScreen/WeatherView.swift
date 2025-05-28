//
//  ContentView.swift
//  WeatherAppTest
//
//  Created by Dmitry Volkov on 28/05/2025.
//

import SwiftUI

struct WeatherView: View {
    @State var searchCity: String = ""
    
    
    var body: some View {
        VStack {
           Text("Прогноз погоды")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .padding(.vertical)
            
            Spacer()
            
            Text("+5 ℃")
                .foregroundStyle(Color.green)
                .fontWeight(.bold)
                .font(.custom("Helvetica Neue", size: 70))
            
            Text("Сегодня 28 мая")
                .foregroundStyle(.white)
            
            Spacer()
            
            TextField("Ввведите город", text: $searchCity)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white)
                )
                .padding()
            
            Spacer()
            
            VStack {
                HStack {
                    Text("Завтра 28 мая")
                        .foregroundStyle(.white)
                    Text("+5 ℃")
                        .foregroundStyle(Color.green)
                        .fontWeight(.bold)
                        .font(.title2)
                    Spacer()
                }
                .padding(.horizontal)
                
                HStack {
                    Text("28 мая")
                        .foregroundStyle(.white)
                    Text("+5 ℃")
                        .foregroundStyle(Color.green)
                        .fontWeight(.bold)
                        .font(.title2)
                    Spacer()
                }
                .padding(.horizontal)
                HStack {
                    Text("28 мая")
                        .foregroundStyle(.white)
                    Text("+5 ℃")
                        .foregroundStyle(Color.green)
                        .fontWeight(.bold)
                        .font(.title2)
                    Spacer()
                }
                .padding(.horizontal)
                HStack {
                    Text("28 мая")
                        .foregroundStyle(.white)
                    Text("+5 ℃")
                        .foregroundStyle(Color.green)
                        .fontWeight(.bold)
                        .font(.title2)
                    Spacer()
                }
                .padding(.horizontal)
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blue)
    }
}

#Preview {
    WeatherView()
}
