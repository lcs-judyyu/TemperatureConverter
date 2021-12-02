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
        
        VStack(alignment: .leading, spacing: 20) {
            
            Group {
                
                Slider(value: $fahrenheit,
                       in: 0...100,
                       step: 1,
                       label: {
                    Text("Current Guess")
                },
                       minimumValueLabel: {
                    Text("0")
                },
                       maximumValueLabel: {
                    Text("100")
                })
                
                HStack {
                    Spacer()
                    Text("\(String(format:"%.0f", fahrenheit))")
                        .font(.title2)
                        .bold()
                    Spacer()
                }
                
            }
            
            HStack {
                
                Spacer()
                
                Button(action: {
                    //selection statement
                    
                    print("Button was pressed")
                }, label: {
                    Text("Submit")
                })
                    .buttonStyle(.bordered)
                    .padding(.top, 10)
                
                Spacer()
            }
            
            
            HStack {
                
                Spacer()
                
                VStack(alignment: .center) {
                    Text("It's \(celsius) degree Celsius")
                        .padding(.bottom, 20)
                    
                    Text(feedback)
                        .italic()
                }
                
                Spacer()
            }
            
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
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
