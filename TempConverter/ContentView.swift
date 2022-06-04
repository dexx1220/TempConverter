//
//  ContentView.swift
//  TempConverter
//
//  Created by Dexter Heng on 6/4/22.
//

import SwiftUI

struct ContentView: View {
    @State private var celsius = 0
    @State private var fahrenheit = 0
    
    var convertedToFahrenheit: Double {
        return (Double(celsius) * 9/5) + Double(32)
    }
    
    var convertedToCelsius: Double {
        return Double(fahrenheit - 32) * 5/9
    }
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("Enter Celsius:")
                    TextField("Celsius", value: $celsius, formatter: NumberFormatter())
                        .multilineTextAlignment(TextAlignment.center)
                }
                VStack {
                    Text("In Fahrenheit: \(convertedToFahrenheit, specifier: "%.2f")")
                }
            }
            .padding()
            
            HStack {
                VStack {
                    Text("Enter Fahrenheit:")
                    TextField("Fahrenheit", value: $fahrenheit, formatter: NumberFormatter())
                        .multilineTextAlignment(TextAlignment.center)
                }
                VStack {
                    Text("In Celsius: \(convertedToCelsius, specifier: "%.2f")")
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
