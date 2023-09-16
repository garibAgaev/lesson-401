//
//  ContentView.swift
//  lesson 401
//
//  Created by Garib Agaev on 16.09.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var flag = true
    @State private var buttonText = "Start"
    @State private var mutatingColorIndex = -1
    private var colors: [Color] = [.red, .yellow, .green]
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack {
                getCircle(0)
                getCircle(1)
                getCircle(2)
                Spacer()
                Button(buttonText) {
                    if flag {
                        buttonText = "Next"
                        flag.toggle()
                    }
                    mutatingColorIndex = (mutatingColorIndex + 1) % colors.count
                }
            }
            .padding()
        }
    }
    
    private func getCircle(_ colorIndex: Int) -> some View {
        Circle()
            .foregroundColor(colors[colorIndex])
            .frame(width: 150)
            .overlay(Circle().stroke(.white, lineWidth: 2))
            .opacity(mutatingColorIndex == colorIndex ? 1.0 : 0.5)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
