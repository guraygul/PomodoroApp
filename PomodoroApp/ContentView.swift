//
//  ContentView.swift
//  PomodoroApp
//
//  Created by Güray Gül on 7.10.2023.
//

import SwiftUI

let defaultTimeRemaining: CGFloat = 60
let breakTime: CGFloat = 5
let oneCycle: Array = [defaultTimeRemaining, breakTime]
//let lineWith: CGFloat = 30
//let radius: CGFloat = 70

struct ContentView: View {
    @State private var isActive = false
    @State private var counter = 0
    @State private var timeRemaining: CGFloat = oneCycle[0]
    @State private var selectedTime = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var showingOptions = false
    
    var body: some View {
        let interval = timeRemaining
        let formattedString = DateComponentsFormatter().string(from: TimeInterval(interval))!
        NavigationView {
        VStack {
            VStack {
                Text("\(formattedString)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 300)
                    .background(changeBackColor(isActive: self.isActive))
                    .cornerRadius(100)
                    .font(.largeTitle)
                    .shadow(radius: 5)
                    .padding(100)
            }
            VStack {
                Label("\(isActive ? "Pause" : "Start")", systemImage: "\(isActive ? "pause.fill" : "play.fill")")
                    .foregroundColor(isActive ? .red : .white)
                    .font(.title)
                    .onTapGesture(perform: {
                        isActive.toggle()
                    })
            }
            .frame(width: 300, height: 100)
            .background(.green)
            .cornerRadius(100)
            .padding(.vertical)
            .shadow(radius: 5)
            
        } .onReceive(timer, perform: { _ in
            guard isActive else { return }
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                isActive = false
                if counter % 2 == 0 {
                    timeRemaining = oneCycle[1]
                    counter += 1
                } else {
                    timeRemaining = oneCycle[0]
                    counter += 1
                }
            }
        })
        .navigationTitle("Pomodoro App")
        .toolbar {
            Button {
                showingOptions = true
                
            } label: {
                Text("Settings")
            }
        }
        .sheet(isPresented: $showingOptions) {
            OptionView(timeRemaining: $timeRemaining)
                .onAppear() {
                    // Uygulama başlatıldığında kaydedilen süreyi yükleme
                    if let savedTime = UserDefaults.standard.value(forKey: "selectedTime") as? Double {
                        timeRemaining = CGFloat(savedTime)
                    }

                }
        }
    }
    }
    func changeBackColor(isActive: Bool) -> Color {
        isActive ? Color.blue : Color.red
    }
}
#Preview {
    ContentView()
}
