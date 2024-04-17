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
    @State private var opacity = 1.0
    private let lightIsOn = 1.0
    private let lightIsOff = 0.3
    
    var body: some View {
        VStack(spacing: 40) {
            ColorCircle(
                color: .red,
                opacity: currentLight == .red ? lightIsOn : lightIsOff
            )
            
            ColorCircle(
                color: .yellow,
                opacity: currentLight == .yellow ? lightIsOn : lightIsOff
            )
            
            ColorCircle(
                color: .green,
                opacity: currentLight == .green ? lightIsOn : lightIsOff
            )
            
            Spacer()
        }
        .padding()
        
        Button(action: startButtonPressed)  {
            Text(buttonCurrentTitle)
                .font(.title)
                //.background(in: Shape, fillStyle: <#T##FillStyle#>)
        }
        .padding(.bottom, 40)
    }

    private func startButtonPressed() {
        if buttonCurrentTitle == "START" {
            buttonCurrentTitle = "NEXT"
        }
        
        switch currentLight {
        case .red:
            currentLight = .yellow
        case .yellow:
            currentLight = .green
        case .green:
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
