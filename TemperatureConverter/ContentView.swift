//
//  ContentView.swift
//  TemperatureConverter
//
//  Created by Judy Yu on 2021-12-02.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: Stored properties
    @State var fahrenheit: Double = 73
    
    //feedback
    @State var feedback = " "
    
    //MARK: Computed properties
    var celsius: Double {
        return (fahrenheit - 32) / 1.8
    }
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 25) {
            
            Group {
                
                Text("Fahrenheit")
                    .bold()
                    .font(.title2)
                
                Slider(value: $fahrenheit,
                       in: -122...122,
                       step: 2,
                       label: {
                    Text("Fahrenheit")
                },
                       minimumValueLabel: {
                    Text("-122°F")
                },
                       maximumValueLabel: {
                    Text("122°F")
                })
                
                HStack {
                    Spacer()
                    Text("\(String(format:"%.0f", fahrenheit)) °F")
                        .bold()
                        .font(.title2)
                    Spacer()
                }
                
            }
            
            Text("Celsius")
                .bold()
                .font(.title2)
            
            
            HStack {
                
                Spacer()
                
                VStack(alignment: .center) {
                    Text("It's \(String(format:"%.1f", celsius)) °C")
                        .bold()
                        .font(.title3)
                        .padding(.bottom, 20)
                    
                    Text(feedback)
                        .italic()
                        .font(.subheadline)
                }
                .padding(.vertical, 10)
                
                Spacer()
            }
            
            Spacer()
        }
        .padding(20)
        .navigationTitle("Temperature Converter")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}
