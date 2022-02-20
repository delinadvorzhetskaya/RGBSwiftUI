//
//  ContentView.swift
//  RGBSwiftUI
//
//  Created by Дэлина Дворжецкая on 20.02.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)
    
    var body: some View {
        VStack(spacing: 15) {
            Spacer().frame(height: 15)
            Rectangle()
                .frame(width: 350, height: 300)
                .foregroundColor(Color(red: redSliderValue/255, green: greenSliderValue/255, blue: blueSliderValue/255))
            ColorSlider(value: $redSliderValue, color: .red)
            ColorSlider(value: $greenSliderValue, color: .green)
            ColorSlider(value: $blueSliderValue, color: .blue)
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ColorSlider: View {
    @Binding var value: Double
    var color: Color
    
    var body: some View {
        HStack {
            Text("\(lround(value))")
            Slider(value: $value, in: 0...255, step: 1).accentColor(color)
            SliderTextField(valueOut: $value)
    }
        .foregroundColor(color)
        .padding(.horizontal)
}
}

struct SliderTextField: View {
    @State var alertPresented = false
    @State var valueIn: String = ""
    @Binding var valueOut: Double
    
    private func checkTheType() {
        if let value = Double(valueIn) {
            valueOut = value
        } else {
            valueOut = 0
            valueIn = ""
            alertPresented.toggle()
        }
    }
    
    var body: some View {
        TextField("\(lround(valueOut))", text: $valueIn) {
            checkTheType()
        }
        .padding()
        .textFieldStyle(.roundedBorder)
        .frame(width: 100)
        .alert("Wrong format", isPresented: $alertPresented, actions: {})
    }
}
