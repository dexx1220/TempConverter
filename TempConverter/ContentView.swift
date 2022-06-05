//
//  ContentView.swift
//  TempConverter
//
//  Created by Dexter Heng on 6/4/22.
//

import SwiftUI

struct ContentView: View {
    enum TemperatureUnit: String, CaseIterable {
        case celsius, fahrenheit
    }

    @State private var temp = 0
    @State private var selectedTempUnit: TemperatureUnit = .celsius

    var converted: Double {
        if (selectedTempUnit == .celsius) {
            return (Double(temp) * 9/5) + Double(32)
        } else {
            return Double(temp - 32) * 5/9
        }
    }
    
    var body: some View {
        VStack {
            Text("Temperature Converter").font(.title)
            HStack {
                Text("Temperature:")
                TextField("", value: $temp, formatter: NumberFormatter())
            }
            .padding()
            VStack {
                Text("Select unit")
                    .font(.caption)
                Picker("Units", selection: $selectedTempUnit) {
                    ForEach(TemperatureUnit.allCases, id: \.self) { unit in
                        Text(unit.rawValue)
                    }
                }
                .pickerStyle(.segmented)
            }
            .padding()
            HStack {
                Text(selectedTempUnit == .celsius ? "Fahrenheit Equivalent:" : "Celsius Equivalent:")
                Text("\(converted, specifier: "%.2f")")
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
