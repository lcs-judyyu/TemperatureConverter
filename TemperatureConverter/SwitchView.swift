//
//  SwitchView.swift
//  TemperatureConverter
//
//  Created by Judy Yu on 2021-12-02.
//

import SwiftUI

struct SwitchView: View {
    
    //MARK: Stored properties
    @State var fahrenheit: Double = 73
    
    @State var celsius: Double = -3
    
    //MARK: Computed properties
    var fahrenheitToCelsius: Double {
        return (fahrenheit - 32) / 1.8
    }
    
    var celsiusToFahrenheit: Double {
        return celsius * 1.8 + 32
    }
    
    @State var mode: Double = 2.0
    
    var body: some View {
        VStack {
            
            VStack {
                
                Picker(selection: $mode,
                       label: Text("Picker Name"),
                       content: {
                    
                    Text("°F to °C").tag(1.0)
                    Text("°C to °F").tag(2.0)
                    
                })
                    .pickerStyle(SegmentedPickerStyle())
                
            }
            
            //content
            if mode == 1.0 {
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
                            Text("It's \(String(format:"%.1f", fahrenheitToCelsius)) °C")
                                .bold()
                                .font(.title3)
                                .padding(.bottom, 20)
                            
                            //Selection Statement
                            if -50 <= fahrenheitToCelsius && fahrenheitToCelsius < -20 {
                                
                                Text("Don't forget to bring your coat!")
                                
                            } else if -20 <= fahrenheitToCelsius && fahrenheitToCelsius < 0 {
                                
                                Text("Dress warmly!")
                                
                            } else if 0 <= fahrenheitToCelsius && fahrenheitToCelsius < 10 {
                                
                                Text("It's a bit cold")
                                
                            } else if 10 <= fahrenheitToCelsius && fahrenheitToCelsius < 20 {
                                
                                Text("Go take a walk!")
                                
                            } else if 20 <= fahrenheitToCelsius && fahrenheitToCelsius < 30 {
                                
                                Text("It's nice outside!")
                                
                            } else if 30 <= fahrenheitToCelsius && fahrenheitToCelsius < 50 {
                                
                                Text("Drink more water!")
                                
                            }
                            
                        }
                        .font(.title2)
                        .padding(.vertical, 10)
                        
                        Spacer()
                    }
                    
                    Spacer()
                }
                .padding(.top, 20)
            } else {
                VStack(alignment: .leading, spacing: 25) {
                    Group {
                        
                        Text("Celsius")
                            .bold()
                            .font(.title2)
                        
                        Slider(value: $celsius,
                               in: -50...50,
                               step: 1,
                               label: {
                            Text("Celsius")
                        },
                               minimumValueLabel: {
                            Text("-50°C")
                        },
                               maximumValueLabel: {
                            Text("50°C")
                        })
                        
                        HStack {
                            Spacer()
                            Text("\(String(format:"%.0f", celsius)) °C")
                                .bold()
                                .font(.title2)
                            Spacer()
                        }
                        
                    }
                    
                    Text("Fahrenheit")
                        .bold()
                        .font(.title2)
                    
                    
                    HStack {
                        
                        Spacer()
                        
                        VStack(alignment: .center) {
                            Text("It's \(String(format:"%.1f", celsiusToFahrenheit)) °F")
                                .bold()
                                .font(.title3)
                                .padding(.bottom, 20)
                            
                            //Selection Statement
                            let currentCelsius = Int(celsius)
                            
                            if -50 <= currentCelsius && currentCelsius < -20 {
                                
                                Text("Don't forget to bring your coat!")
                                
                            } else if -20 <= currentCelsius && currentCelsius < 0 {
                                
                                Text("Dress warmly!")
                                
                            } else if 0 <= currentCelsius && currentCelsius < 10 {
                                
                                Text("It's a bit cold")
                                
                            } else if 10 <= currentCelsius && currentCelsius < 20 {
                                
                                Text("Go take a walk!")
                                
                            } else if 20 <= currentCelsius && currentCelsius < 30 {
                                
                                Text("It's nice outside!")
                                
                            } else if 30 <= currentCelsius && currentCelsius <= 50 {
                                
                                Text("Drink more water!")
                                
                            }
                            
                        }
                        .font(.title2)
                        .padding(.vertical, 10)
                        
                        Spacer()
                    }
                    
                    Spacer()
                }
                .padding(.top, 20)
            }
            
        }
        .padding(20)
        .navigationTitle("Temperature Converter")
    }
}

struct SwitchView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SwitchView()
        }
    }
}
