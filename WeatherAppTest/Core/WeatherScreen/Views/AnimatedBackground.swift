//
//  AnimatedBackground.swift
//  WeatherAppTest
//
//  Created by Dmitry Volkov on 28/05/2025.
//

import SwiftUI

struct AnimatedBackground: View {
    @State private var animate = false

    var body: some View {
        LinearGradient(
                    gradient: Gradient(colors: animate ? [Color.blue, Color.indigo] : [Color.teal, Color.blue]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .animation(.easeInOut(duration: 50).repeatForever(autoreverses: true), value: animate)
        .onAppear {
            animate.toggle()
        }
        .ignoresSafeArea()
    }
}


