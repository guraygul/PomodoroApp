//
//  ContentView.swift
//  PomodoroApp
//
//  Created by Güray Gül on 7.10.2023.
//

import SwiftUI


struct ContentView: View {
    @State private var showingOptions = false
    
    @StateObject private var vm = ViewModel()
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private let width: Double = 250
    private var isActive = false
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Text("\(vm.time)")
                        .font(.system(size: 70, weight: .bold, design: .rounded))
                        .foregroundColor(.black)
                        .padding()
                        .frame(width: 300, height: 300)
                        .cornerRadius(100)
                        .shadow(radius: 5)
                        .background(.thinMaterial)
                        .cornerRadius(20)
                        .overlay(RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray, lineWidth: 4))
                        .padding(50)
                        .alert("Timer done!", isPresented: $vm.showingAlert) {
                            Button("Continue", role: .cancel) {
                                // add codes
                            }
                        }
                    
                   
                }
                VStack {
                    
                    VStack {
                        Button("Start"){
                            vm.start(minutes: vm.minutes)
                                //timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                        }
                        .disabled(vm.isActive)
                        .foregroundColor(isActive ? .orange : .white)
                        .font(.title)
                    }
                    .frame(width: 300, height: 100)
                    .background(.green)
                    .cornerRadius(100)
                    .padding(.vertical)
                    .shadow(radius: 5)
                    
                    
                    VStack {
                        Button("Reset", action: vm.reset)
                        .foregroundColor(.white)
                        .font(.title)
                    }
                    .frame(width: 300, height: 100)
                    .background(.red)
                    .cornerRadius(100)
                    .padding(.vertical)
                    .shadow(radius: 5)
                }
                
            }
            .onReceive(timer) { _ in
                vm.updateCountdown()
            }
            .padding(.bottom)
            .navigationTitle("Pomodoro App")
            .toolbar {
                Button {
                    showingOptions = true
                    
                } label: {
                    Text("Settings")
                }
            }
            .sheet(isPresented: $showingOptions) {
                OptionView(vm: vm)
                
            }
        }
    }
}
#Preview {
    ContentView()
}
