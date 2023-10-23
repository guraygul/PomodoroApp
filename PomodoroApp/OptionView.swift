//
//  OptionView.swift
//  PomodoroApp
//
//  Created by Güray Gül on 8.10.2023.
//

import SwiftUI

import SwiftUI

struct OptionView: View {
    @Binding var timeRemaining: CGFloat // Ana ekrandaki zamanlayıcıyı değiştirmek için kullanacağımız bağlı değişken
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Zamanlayıcı Ayarları")) {
                    Stepper(value: $timeRemaining, in: 1...200000, step: 60) {
                        Text("Süre: \(Int(timeRemaining) / 60) dakika")
                    }
                }
            }
            .navigationTitle("Ayarlar")
            .toolbar {
                Button("Kaydet") {
                    // Ayarları kaydetmek için bir şeyler yapabilirsiniz (örneğin, UserDefaults kullanarak)
                    // Ayrıca, kullanıcının seçtiği süreyi kaydetmelisiniz.
                    UserDefaults.standard.set(Int(timeRemaining), forKey: "selectedTime")
                        
                        // OptionView'i kapatın
                   // presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
}


//#Preview {
//    OptionView()
//}
