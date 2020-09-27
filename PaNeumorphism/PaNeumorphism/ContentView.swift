//
//  ContentView.swift
//  PaNeumorphism
//
//  Created by Sam Proctor on 25/09/2020.
//

import SwiftUI

let coloredNavAppearance = UINavigationBarAppearance()


struct ContentView: View {
    init() {
        coloredNavAppearance.configureWithOpaqueBackground()
        coloredNavAppearance.backgroundColor = .systemBlue
        coloredNavAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        coloredNavAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        UINavigationBar.appearance().standardAppearance = coloredNavAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
        
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                Spacer()
                
                CabinControls()
                    .padding(.top, 20)
                
                Spacer()
            }
            .navigationBarTitle(Text("Starship Cabin 13A"))
            
            .background(Color.neuBackground)
//            .ignoresSafeArea(.all)
//            .offset(x: 0, y: 150)
        }
        
        .background(Color.neuBackground)
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
