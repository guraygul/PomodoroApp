//
//  OptionView.swift
//  PomodoroApp
//
//  Created by Güray Gül on 8.10.2023.
//

import SwiftUI

struct OptionView: View {
    @State private var selectedTime = 25
    
    var body: some View {
        NavigationStack{
            Form {
                Section {
                    Picker("Pomodoro Time", selection: $selectedTime) {
                        ForEach( 0..<61 ) {
                        Text("\($0) minutes")
                        }
                    }
                }
                Text("bbb")
            }
            Section {
                Text("Confirm")
            }
        }
        .navigationTitle("Options")
    }

    
}

#Preview {
    OptionView()
}
