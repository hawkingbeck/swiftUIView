//
//  CabinControls.swift
//  PaNeumorphism
//
//  Created by Sam Proctor on 26/09/2020.
//

import SwiftUI
import CoreHaptics

struct CabinControls: View {
    @State private var lightsOn: Bool = false
    @State private var doorLocked: Bool = false
    @State private var engine: CHHapticEngine?
    
    func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        do {
            self.engine = try CHHapticEngine()
            try engine?.start()
        } catch let err {
            print("There was an error starting the haptic engine \(err.localizedDescription)")
        }
    }
    
    func buttonSwitch() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        var events = [CHHapticEvent]()
        
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1.0)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1.0)
        
        let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0, duration: 1)
        
        events.append(event)
        
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play pattern \(error.localizedDescription)")
        }
        
    }
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                if self.lightsOn {
                    Button(action: {
                        buttonSwitch()
                        self.lightsOn.toggle()
                    }, label: {
                        Image(systemName: "lightbulb")
                            .font(.title)
                            .frame(width: 50,height: 50)
                    })
                    .buttonStyle(PaButtonStyle2())
                } else {
                    Button(action: {
                        buttonSwitch()
                        self.lightsOn.toggle()
                    }, label: {
                        Image(systemName: "lightbulb.slash")
                            .font(.title)
                            .frame(width: 50,height: 50)
                    })
                    .buttonStyle(PaButtonStyle())
                }
                
                Spacer()
                if self.doorLocked {
                    Button(action: {
                        self.doorLocked.toggle()
                    }, label: {
                        Image(systemName: "lock")
                            .font(.title)
                            .frame(width: 50,height: 50)
                    })
                    .buttonStyle(PaButtonStyle2())
                } else {
                    Button(action: {
                        self.doorLocked.toggle()
                    }, label: {
                        Image(systemName: "lock.slash")
                            .font(.title)
                            .frame(width: 50,height: 50)
                    })
                    .buttonStyle(PaButtonStyle())
                }
                
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "bed.double")
                        .font(.title)
                        .frame(width: 50,height: 50)
                })
                .buttonStyle(PaButtonDespressedStyle())
                Spacer()
            }
        }
        .onAppear{
            prepareHaptics()
        }
    }
    
    func simpleSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
}

struct CabinControls_Previews: PreviewProvider {
    static var previews: some View {
        CabinControls()
    }
}
