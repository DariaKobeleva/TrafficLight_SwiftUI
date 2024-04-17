//
//  ContentView.swift
//  TrafficLight_SwiftUI
//
//  Created by Дарья Кобелева on 17.04.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var buttonCurrentTitle = "START"
    @State private var currentLight = CurrentLight.red
    
    @State private var redOpacity = 0.3
    @State private var yellowOpacity = 0.3
    @State private var greenOpacity = 0.3
    
    private let lightIsOn = 1.0
    private let lightIsOff = 0.3
    
    var body: some View {
        VStack(spacing: 40) {
            
            ColorCircle(color: .red, opacity: redOpacity)
            ColorCircle(color: .yellow, opacity: yellowOpacity)
            ColorCircle(color: .green, opacity: greenOpacity)
            
            Spacer()
        }
        .padding()
        
        Button(action: startButtonPressed)  {
            Text(buttonCurrentTitle)
                .font(.title)
                .fontWeight(.bold)
                .frame(width: 140, height: 40)
                .padding()
                .background(Color.cyan)
                .foregroundColor(.white)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 3)
                )
        }
        .padding(.bottom, 40)
    }
    
    private func startButtonPressed() {
        if buttonCurrentTitle == "START" {
            buttonCurrentTitle = "NEXT"
        }
        
        switch currentLight {
        case .red:
            greenOpacity = lightIsOff
            redOpacity = lightIsOn
            currentLight = .yellow
        case .yellow:
            redOpacity = lightIsOff
            yellowOpacity = lightIsOn
            currentLight = .green
        case .green:
            yellowOpacity = lightIsOff
            greenOpacity = lightIsOn
            currentLight = .red
        }
    }
}

struct ColorCircle: View {
    let color: Color
    var opacity: Double
    
    var body: some View {
        Circle()
            .foregroundStyle(color)
            .opacity(opacity)
            .frame(width: 100, height: 100)
            .overlay(Circle().stroke(Color.white, lineWidth: 3))
            .shadow(radius: 10)
    }
}

extension ContentView {
    private enum CurrentLight {
        case red, yellow, green
    }
}

#Preview {
    ContentView()
}
