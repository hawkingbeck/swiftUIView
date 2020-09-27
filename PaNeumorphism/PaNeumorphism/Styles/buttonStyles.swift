//
//  buttonStyle1.swift
//  PaNeumorphism
//
//  Created by Sam Proctor on 25/09/2020.
//

import Foundation
import SwiftUI


struct ButtonStyleExample: View {
    @State private var isPressed: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            
            Button(action: {}, label: {
                Image(systemName: "bed.double")
                    .font(.title)
                    .frame(width: 50, height: 50)
                    
            })
            .buttonStyle(PaButtonStyle())
            
            Spacer()
            
            Button(action: {}, label: {
                Image(systemName: "bed.double")
                    .font(.title)
                    .frame(width: 50, height: 50)
                
            })
            .buttonStyle(PaButtonDespressedStyle())
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(Color.neuBackground)
        .ignoresSafeArea()
        
    }
}

public struct PaButtonStyle: ButtonStyle {
    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(12.0)
            .background(
                ZStack{
                    RoundedRectangle(cornerRadius: 7, style: .continuous)
                        .fill(Color.neuBackground)
                }
            )
            .foregroundColor(.primary)
            .shadow(color: .dropLight, radius: configuration.isPressed ? 5: 8, x: configuration.isPressed ? -5.0 : -8.0, y: configuration.isPressed ? -5.0 : -8.0)
            .shadow(color: .dropShadow, radius: configuration.isPressed ? 5: 8, x: configuration.isPressed ? 5.0 : 8.0, y: configuration.isPressed ? 5.0 : 8.0)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.spring())
    }
}

public struct PaButtonStyle2: ButtonStyle {
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(12)
            .background(
                ZStack{
                    RoundedRectangle(cornerRadius: 7, style: .continuous)
                        .fill(Color.neuBackground)
                }
            )
            .foregroundColor(Color.primary)
            .overlay(
                RoundedRectangle(cornerRadius: 5, style: .continuous)
                    .stroke(Color.neuBackground, lineWidth: 4)
                    .shadow(color: Color.dropShadow, radius: 3, x: 5, y: 5)
                    .shadow(color: Color.dropLight, radius: 3, x: -2, y: -2)
                    .frame(maxWidth:.infinity, maxHeight:.infinity)
            )
            .cornerRadius(5)
            .background(Color.neuBackground)
            .clipShape(
                RoundedRectangle(cornerRadius: 5)
            )
            .shadow(color: .clear, radius: 0, x: -8.0, y: -8.0)
            .shadow(color: .clear, radius: 0, x: 8.0, y: 8.0)
            .animation(.none)
    }
}

public struct PaButtonDespressedStyle: ButtonStyle {
    public func makeBody(configuration: Self.Configuration) -> some View {
        if !configuration.isPressed {
            return configuration.label
                .padding(12)
                .background(
                    ZStack{
                        RoundedRectangle(cornerRadius: 7, style: .continuous)
                            .fill(Color.neuBackground)
                    }
                )
                .foregroundColor(Color.primary)
                .overlay(
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .stroke(Color.clear, lineWidth: 1)
                        .shadow(color: Color.clear, radius: 0, x: 0, y: 0)
                        .shadow(color: Color.clear, radius: 0, x: 0, y: 0)
                        .frame(maxWidth:0, maxHeight:0)
                )
                .cornerRadius(5)
                .background(Color.neuBackground)
                .clipShape(
                    RoundedRectangle(cornerRadius: 5)
                )
                .shadow(color: .dropLight, radius: 7, x: -10.0, y: -10.0)
                .shadow(color: .dropShadow, radius: 5, x: 10.0, y: 10.0)
                .animation(.none)
                
        } else {
            return configuration.label
                .padding(12)
                .background(
                    ZStack{
                        RoundedRectangle(cornerRadius: 7, style: .continuous)
                            .fill(Color.neuBackground)
                    }
                )
                .foregroundColor(Color.primary)
                .overlay(
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .stroke(Color.neuBackground, lineWidth: 4)
                        .shadow(color: Color.dropShadow, radius: 3, x: 5, y: 5)
                        .shadow(color: Color.dropLight, radius: 3, x: -2, y: -2)
                        .frame(maxWidth:.infinity, maxHeight:.infinity)
                )
                .cornerRadius(5)
                .background(Color.neuBackground)
                .clipShape(
                    RoundedRectangle(cornerRadius: 5)
                )
                .shadow(color: .clear, radius: 0, x: -8.0, y: -8.0)
                .shadow(color: .clear, radius: 0, x: 8.0, y: 8.0)
                .animation(.none)
        }
        
            
    }
}

struct ButtonStyle1_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyleExample()
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(red: Double(r) / 0xff, green: Double(g) / 0xff, blue: Double(b) / 0xff)
    }
}

extension Color {
    static let neuBackground = Color(hex: "f0f0f3")
    static let dropShadow = Color(hex: "aeaec0").opacity(0.4)
    static let dropLight = Color(hex: "ffffff")
}


