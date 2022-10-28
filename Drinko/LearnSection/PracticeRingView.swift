//
//  PracticeRingView.swift
//  Drinko
//
//  Created by Filippo Cilia on 20/09/2020.
//

import SwiftUI

struct PracticeRingView: View {
    @State private var defaultShakeTime: CGFloat = 10
    @State private var shakingTime: CGFloat = 10
    
    @State private var defaultStirTime: CGFloat = 30
    @State private var stirringTime: CGFloat = 30
    
    @State private var isCountdownOn = false
    
    @State private var chosenRing = 0
    
    let rings = ["Shake", "Stir"]
    
    var width: CGFloat = 150
    var height: CGFloat = 150
    
    var colorShake1 = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    var colorShake2 = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
    
    var colorStir1 = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
    var colorStir2 = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    var body: some View {
        let multiplier = width / 30
        let shakingProgress = 1 - (shakingTime / defaultShakeTime)
        let stirringProgress = 1 - (stirringTime / defaultStirTime)
        
        return
            VStack {
                Text("Practice your timing")
                    .font(.title)
                    .bold()
                    .padding(.top)

                Picker("Practice", selection: $chosenRing) {
                    ForEach(0 ..< rings.count, id: \.self) {
                        Text("\(rings[$0])")
                        
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                VStack {
                    ZStack {
                        Circle()
                            .stroke(Color.black.opacity(0.1), style: StrokeStyle(lineWidth: 5 * multiplier))
                            .frame(width: width, height: height)
                        
                        Circle()
                            .trim(from: chosenRing == 0 ? shakingProgress : stirringProgress, to: 1)
                            .stroke(
                                LinearGradient(gradient: Gradient(colors: [Color(chosenRing == 0 ? colorShake1 : colorStir1), Color(chosenRing == 0 ? colorShake2 : colorStir2)]), startPoint: .topTrailing, endPoint: .bottomLeading),
                                style: StrokeStyle(lineWidth: 5 * multiplier, lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20, 0], dashPhase: 0)
                            )
                            .rotationEffect(Angle(degrees: 90))
                            .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                            .frame(width: width, height: height)
                            // this is the blue shadow -> (x: n) goes right, (y: -n) goes up
                            .shadow(color: Color(chosenRing == 0 ? colorShake1 : colorStir1).opacity(0.15), radius: 3 * multiplier, x: 3 * multiplier, y: -3 * multiplier)
                            // this is the pink shadow -> (x: -n) goes left, (y: n) goes down
                            .shadow(color: Color(chosenRing == 0 ? colorShake2 : colorStir2).opacity(0.15), radius: 3 * multiplier, x: -3 * multiplier, y: 3 * multiplier)
                            .animation(.easeInOut)
                        
                        Text("\(chosenRing == 0 ? shakingTime : stirringTime, specifier: "%.0f")")
                            .font(.system(.largeTitle, design: .rounded))
                            .bold()
                    }
                    .padding()
                    
                    
                    HStack {
                        Button(action: {
                            isCountdownOn.toggle()
                            
                        }) {
                            StartAndResetButtons(text: isCountdownOn ? "Stop" : "Start", multiplier: multiplier)                            
                        }
                        .onReceive(timer) { _ in
                            if isCountdownOn && (chosenRing == 0 ? shakingTime : stirringTime) > 0 {
                                if chosenRing == 0 {
                                    shakingTime -= 1
                                } else if chosenRing == 1 {
                                    stirringTime -= 1
                                }
                                
                                if shakingTime == 0 || stirringTime == 0 {
                                    isCountdownOn = false
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                        stirringTime = defaultStirTime
                                        shakingTime = defaultShakeTime
                                    }
                                }
                            }
                        }
                        
                        Button(action: {
                            isCountdownOn = false
                            shakingTime = defaultShakeTime
                            stirringTime = defaultStirTime
                            
                        }) {
                            StartAndResetButtons(text: "Reset", multiplier: multiplier)
                        }
                    }
                    .padding()
                    
                    Spacer()
                }
            }
    }
}
