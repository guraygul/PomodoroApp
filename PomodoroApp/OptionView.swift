//
//  OptionView.swift
//  PomodoroApp
//
//  Created by Güray Gül on 23.10.2023.
//

import SwiftUI

struct OptionView: View {
    @ObservedObject var vm: ContentView.ViewModel
    var body: some View {
        Form {
//            Slider(value: $vm.minutes, in: 1...10, step: 1)
//                .padding()
//                .disabled(vm.isActive)
//                .animation(.easeInOut, value: vm.minutes)
            VStack(alignment: .leading, spacing: 0) {
                Text("Select the time")
                    .font(.headline)
                Stepper("Current Time: \(vm.time)", value: $vm.minutes, in: 1...25, step: 1)
            }
        }
    }
}

//#Preview {
//    OptionView(vm: vm)
//}
